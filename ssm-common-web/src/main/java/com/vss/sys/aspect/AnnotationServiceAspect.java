package com.vss.sys.aspect;

import com.vss.sys.bytecode.ClassGenerator;
import javassist.*;
import javassist.Modifier;
import javassist.bytecode.AnnotationsAttribute;
import javassist.bytecode.ClassFile;
import javassist.bytecode.ConstPool;
import javassist.bytecode.annotation.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.validation.*;
import javax.validation.constraints.NotNull;
import javax.validation.executable.ExecutableValidator;
import javax.validation.groups.Default;
import java.lang.annotation.Annotation;
import java.lang.reflect.*;

import java.util.*;

/**
 * Created by dujunliang on 12/20/16.
 */
@Aspect
public class AnnotationServiceAspect {

    private static final Logger logger = LoggerFactory.getLogger(AnnotationServiceAspect.class);

    @Pointcut("execution(* com.vss.sys.service.*.*(..))")
    private void pointCutMethod() {
    }

    //声明前置通知
    @Before("pointCutMethod()")
    public void doBefore(JoinPoint jp) throws Exception {


         Object o = jp.getTarget();

         final Class<?> clazz = jp.getSignature().getDeclaringType();

         final Validator validator;

         ValidatorFactory factory = Validation.buildDefaultValidatorFactory();

         validator = factory.getValidator();

         if(validator != null) {

             validate(jp.getSignature().getName(), ((MethodSignature) jp.getSignature()).getMethod().getParameterTypes(),
                     jp.getArgs(), clazz, validator,jp);

         }

    }

    /**
     * 验证
     * @param methodName
     * @param parameterTypes
     * @param arguments
     * @param clazz
     * @param validator
     * @throws Exception
     */
    public void validate(String methodName, Class<?>[] parameterTypes, Object[] arguments,Class<?> clazz,Validator validator,JoinPoint jp) throws Exception {

        String methodClassName = clazz.getName() + "$" + toUpperMethoName(methodName);
        Class<?> methodClass = null;
        try {
            methodClass = Class.forName(methodClassName);
        } catch (ClassNotFoundException e) {
        }
        Set<ConstraintViolation<?>> violations = new HashSet<ConstraintViolation<?>>();
        Method method = clazz.getMethod(methodName, parameterTypes);

        ExecutableValidator executableValidator = validator.forExecutables();

        violations.addAll(executableValidator.validateParameters(jp.getThis(),
                    method, arguments));

        /**
         * 非组验证
         */
        for (Object arg : arguments) {
            validate(violations, arg, clazz, methodClass,validator);
        }
        /**
         * 组的验证
         */
        if(methodClass != null){
            vilidategroups(violations, methodClass , method, arguments,validator);
        }

        /**
         * violations
         */
        if (violations.size() > 0) {
            for (ConstraintViolation<?>constraintViolation : violations) {
                System.out.println(constraintViolation.getMessage());
            }
            throw new com.vss.sys.exception.ValidationException(violations);
        }

    }

    /**
     * 判断验证参数对象
     * @param violations
     * @param arg
     * @param clazz
     * @param methodClass
     * @param validator
     */
    private void validate(Set<ConstraintViolation<?>> violations, Object arg, Class<?> clazz, Class<?> methodClass,Validator validator) {
        if (arg != null && ! isPrimitives(arg.getClass())) {
            if (Object[].class.isInstance(arg)) {
                for (Object item : (Object[]) arg) {
                    validate(violations, item, clazz, methodClass,validator);
                }
            } else if (Collection.class.isInstance(arg)) {
                for (Object item : (Collection<?>) arg) {
                    validate(violations, item, clazz, methodClass,validator);
                }
            } else if (Map.class.isInstance(arg)) {
                for (Map.Entry<?, ?> entry : ((Map<?, ?>) arg).entrySet()) {
                    validate(violations, entry.getKey(), clazz, methodClass,validator);
                    validate(violations, entry.getValue(), clazz, methodClass,validator);
                }
            } else {
                if (methodClass != null) {
                    violations.addAll(validator.validate(arg, Default.class, clazz, methodClass));
                } else {
                    violations.addAll(validator.validate(arg, Default.class, clazz));
                }
            }


        }
    }

    private static String toUpperMethoName(String methodName) {
        return methodName.substring(0, 1).toUpperCase() + methodName.substring(1);
    }

    private static boolean isPrimitives(Class<?> cls) {
        if (cls.isArray()) {
            return isPrimitive(cls.getComponentType());
        }
        return isPrimitive(cls);
    }

    private static boolean isPrimitive(Class<?> cls) {
        return cls.isPrimitive() || cls == String.class || cls == Boolean.class || cls == Character.class
                || Number.class.isAssignableFrom(cls) || Date.class.isAssignableFrom(cls);
    }

    /**
     * 组的验证
     * @param violations
     * @param clazz
     * @param method
     * @param args
     * @param validator
     */
    private static void vilidategroups(Set<ConstraintViolation<?>> violations,Class<?> clazz, Method method, Object[] args,Validator validator) {

        try {
            if (!hasConstraintParameter(method)) {
                return;
            }
            Class<?>[] parameterTypes = method.getParameterTypes();
            Annotation[][] parameterAnnotations = method.getParameterAnnotations();
            for (int i = 0; i < parameterTypes.length; i ++) {
                Class<?> type = parameterTypes[i];
                Annotation[] annotations = parameterAnnotations[i];
                for (Annotation annotation : annotations) {
                    if (annotation.annotationType().isAnnotationPresent(Constraint.class)) {
                        violations.addAll(validator.validate(type, clazz));
                    }
                }
            }
        }catch (ConstraintViolationException e){
            throw new com.vss.sys.exception.ValidationException(violations);
        }

    }

    /**
     * 判断是否存在组信息
     * @param method
     * @return
     */
    private static boolean hasConstraintParameter(Method method) {
        Annotation[][] parameterAnnotations = method.getParameterAnnotations();
        if (parameterAnnotations != null && parameterAnnotations.length > 0) {
            for (Annotation[] annotations : parameterAnnotations) {
                for (Annotation annotation : annotations) {
                    if (annotation.annotationType().isAnnotationPresent(Constraint.class)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }


    //声明后置通知
    @AfterReturning(pointcut = "pointCutMethod()", returning = "result")
    public void doAfterReturning(String result) {
        logger.info(result);
    }

    //声明例外通知
    @AfterThrowing(pointcut = "pointCutMethod()", throwing = "e")
    public void doAfterThrowing(Exception e) {
        logger.error(e.getMessage());
    }

    //声明最终通知
    @After("pointCutMethod()")
    public void doAfter() {

    }

    //声明环绕通知
    @Around("pointCutMethod()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {

        Object o = pjp.proceed();

        return o;
    }

}
