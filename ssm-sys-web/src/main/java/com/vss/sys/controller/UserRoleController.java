package com.vss.sys.controller;

import com.vss.sys.bean.ResultBean;
import com.vss.sys.dto.RolePermissDTO;
import com.vss.sys.dto.RolesDTO;
import com.vss.sys.dto.UserDTO;
import com.vss.sys.dto.UserRoleDTO;
import com.vss.sys.service.RolePermissInfoService;
import com.vss.sys.service.UserRoleInfoService;
import com.vss.sys.spring.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by dujunliang on 16/12/29.
 */
@Controller
@RequestMapping("/userrole")
public class UserRoleController extends BaseController {


    @Autowired
    private UserRoleInfoService userRoleInfoService;

    @RequestMapping("/editview.do")
    @ResponseBody
    public List editview(String userid,Model model) {
        List<UserRoleDTO> list = userRoleInfoService.getUserRoleInfoList(userid);
        return list;
//        model.addAttribute("rolesid",rolesid);
//        model.addAttribute("permisslist", JSONArray.fromObject(list));
//        return new ModelAndView("rolepermiss/edit");
    }

    @RequestMapping("/edit.do")
    @ResponseBody
    public ResultBean edit(UserDTO userDTO) {
        if (userRoleInfoService.edit(userDTO.getRolesId(), userDTO.getUserid() + "")) {
            setSuccess(true);
        } else {
            setSuccess(false);
            setMsg("新增失败");
        }
        return resultBean;
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public List findPermissList(String userid) {
        List<UserRoleDTO> list = userRoleInfoService.getUserRoleInfoList(userid);
        return list;
    }


//
//    @RequestMapping(value = "/edit")
//    @ResponseBody
//    public ResultBean add(PermissDTO permissDTO) {
//        if (permissInfoService.save(permissDTO)) {
//            setSuccess(true);
//        } else {
//            setSuccess(false);
//            setMsg("新增失败");
//        }
//        return resultBean;
//    }





}
