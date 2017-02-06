package com.vss.sys.controller;

import com.vss.sys.bean.ResultBean;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.PageResponse;
import com.vss.sys.datatable.Page;
import com.vss.sys.dto.UserDTO;
import com.vss.sys.service.UserInfoService;
import com.vss.sys.spring.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by dujunliang on 16/11/30.
 */

@Controller
@RequestMapping("/user")
public class UserController extends  BaseController{


    @Autowired
    public UserInfoService userInfoService;


    @RequestMapping("/userload.do")
    public ModelAndView userload() {

        return new ModelAndView("user/userinfo");
    }

    @RequestMapping("/addview.do")
    public ModelAndView addview() {

        return new ModelAndView("user/add");
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public PageResponse findUserList(WebRequest request) {

        Page<UserDTO> page = userInfoService.findUserInfoPage(new PageRequest<Map<String, Object>>(request));
        PageResponse response = new PageResponse(page);
        return response;

    }

    @RequestMapping(value = "/finduser")
    @ResponseBody
    public ModelAndView find(Integer userid,Model model) {

        UserDTO user = userInfoService.getUser(userid);
        model.addAttribute(user);
        return new ModelAndView("/user/update");

    }

    @RequestMapping(value = "/exitsuser")
    @ResponseBody
    public Map exitsuser(Integer userid) {
        Map map = new HashMap<>();
        map.put("valid", true);
        return map;
    }


    @RequestMapping(value = "/add")
    @ResponseBody
    public ResultBean add(UserDTO user) {
        if (userInfoService.save(user)) {
            setSuccess(true);
        } else {
            setSuccess(false);
            setMsg("新增失败");
        }
        return resultBean;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public ResultBean update(UserDTO user) {
        if (userInfoService.update(user)) {
            setSuccess(true);
        } else {
            setSuccess(false);
            setMsg("更新失败");
        }
        return resultBean;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public ResultBean delete(Integer[] userid) {
        if (userInfoService.deleteUser(userid)) {
            setSuccess(true);
        } else {
            setSuccess(false);
            setMsg("删除失败");
        }
        return resultBean;
    }




    @RequestMapping("/test.do")
    public ModelAndView test() {

        return new ModelAndView("test/test");
    }


}
