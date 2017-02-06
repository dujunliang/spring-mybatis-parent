import com.vss.sys.dto.UserDTO;
import com.vss.sys.groups.ValidationGroups;
import com.vss.sys.service.LoginService;
import com.vss.sys.service.PermissInfoService;
import com.vss.sys.service.UserInfoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.*;
import javax.validation.executable.ExecutableValidator;
import javax.validation.groups.Default;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by dujunliang on 16/12/1.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:sys-web-config.xml"})
public class mainTest {


    @Autowired
    public UserInfoService userInfoService;

    @Autowired
    public PermissInfoService permissInfoService;

    @Test
    public void testActionScope() throws Exception {

        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        // 验证方法参数
        Method method = null;
        try {
            method = PermissInfoService.class.getMethod("getPermiss", Integer.class);
        } catch (SecurityException e) {
        } catch (NoSuchMethodException e) {
        }
        Object[] parameterValues = { 1 };
        ExecutableValidator executableValidator = validator.forExecutables();
        Class cls = Class.forName("com.vss.sys.service.PermissInfoService");
        for (ConstraintViolation<?> constraintViolation : executableValidator.validateParameters(permissInfoService,
                method, parameterValues)) {
            System.out.println(constraintViolation.getMessage());
        }

    }


}