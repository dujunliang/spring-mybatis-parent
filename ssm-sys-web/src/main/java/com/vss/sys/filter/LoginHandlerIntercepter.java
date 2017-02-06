package com.vss.sys.filter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/**
 * Created by dujunliang on 17/2/4.
 * 用户登陆拦截器
 */
@Component
public class LoginHandlerIntercepter implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object arg2, Exception arg3)
            throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
                           Object arg2, ModelAndView arg3) throws Exception {

    }
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1,
                             Object arg2) throws Exception {


        Subject us = SecurityUtils.getSubject();
        String requestURI = request.getRequestURI();
        if (us.isAuthenticated()|| requestURI.indexOf("login") > 0) {
            return true; // 参数未改变，无需重新登录，默认为已经登录成功
        }else {
            request.getRequestDispatcher("/login/logining.do").forward(request,arg1);
            return false; // 需要重新登陆
        }

    }

}
