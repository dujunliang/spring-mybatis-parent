package com.vss.sys.controller;

import com.vss.sys.bean.ResultBean;
import com.vss.sys.dto.UserDTO;
import com.vss.sys.service.LoginService;
import com.vss.sys.service.UserInfoService;
import com.vss.sys.spring.BaseController;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by dujunliang on 16/11/30.
 */

@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {


    @Autowired
    public UserInfoService userInfoService;

    @RequestMapping("/login.do")
    @ResponseBody
    public ResultBean Login(UserDTO user,Model model,HttpSession session) {

        if (userInfoService.login(user) != null) {
            setSuccess(false);
            setMsg("用户不存在");
        }else{
            setSuccess(true);
            session.setAttribute("user",user);
        }
        return resultBean;
    }

    @RequestMapping("/logining.do")
    public ModelAndView logining(Model model) {
        return new ModelAndView("/index/login");
    }

    @RequestMapping("/loginSuc.do")
    public ModelAndView loginSuc(Model model) {
        return new ModelAndView("/index/index");
    }
//
//    @RequestMapping("/loginOut.do")
//    public ModelAndView loginOut(Model model,HttpSession session) {
//        session.removeAttribute("user");
//        return new ModelAndView("/index/login");
//    }

    @RequestMapping("/dologin.do") //url
    @ResponseBody
    public ResultBean dologin(UserDTO user, Model model){
        String info = loginUser(user);
        if (!"SUCC".equals(info)) {
            setSuccess(false);
            setMsg(info);
        }else{
//            model.addAttribute("successMsg", "登陆成功！");//返回到页面说夹带的参数
//            model.addAttribute("name", user.getUsername());
            setSuccess(true);
            model.addAttribute("name", user.getUsername());
            //return "/jsp/success";//返回的页面
        }
        return resultBean;

    }

    @RequestMapping("/logout.do")
    public ModelAndView logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
        Subject subject = SecurityUtils.getSubject();
        if (subject != null) {
            try{
                subject.logout();
            }catch(Exception ex){
            }
        }
        return new ModelAndView("/index/login");
    }

    private String loginUser(UserDTO user) {
        if (isRelogin(user)) return "SUCC"; // 如果已经登陆，无需重新登录

        return shiroLogin(user); // 调用shiro的登陆验证
    }
    private String shiroLogin(UserDTO user) {
        // 组装token，包括客户公司名称、简称、客户编号、用户名称；密码
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword().toCharArray(), null);
        token.setRememberMe(true);

        // shiro登陆验证
        try {
            SecurityUtils.getSubject().login(token);
        } catch (UnknownAccountException ex) {
            return "用户不存在或者密码错误！";
        } catch (IncorrectCredentialsException ex) {
            return "用户不存在或者密码错误！";
        } catch (AuthenticationException ex) {
            return ex.getMessage(); // 自定义报错信息
        } catch (Exception ex) {
            ex.printStackTrace();
            return "内部错误，请重试！";
        }
        return "SUCC";
    }

    private boolean isRelogin(UserDTO user) {
        Subject us = SecurityUtils.getSubject();
        if (us.isAuthenticated()) {
            return true; // 参数未改变，无需重新登录，默认为已经登录成功
        }
        return false; // 需要重新登陆
    }










}
