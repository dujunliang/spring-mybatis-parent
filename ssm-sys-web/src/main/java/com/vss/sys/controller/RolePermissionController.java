package com.vss.sys.controller;

import com.vss.sys.bean.ResultBean;
import com.vss.sys.datatable.Page;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.PageResponse;
import com.vss.sys.dto.PermissDTO;
import com.vss.sys.dto.RolePermissDTO;
import com.vss.sys.dto.RolesDTO;
import com.vss.sys.service.PermissInfoService;
import com.vss.sys.service.RolePermissInfoService;
import com.vss.sys.spring.BaseController;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by dujunliang on 16/12/29.
 */
@Controller
@RequestMapping("/rolepermiss")
public class RolePermissionController extends BaseController {


    @Autowired
    private RolePermissInfoService rolePermissInfoService;

    @RequestMapping("/editview.do")
    @ResponseBody
    public List editview(String rolesid,Model model) {
        List<RolePermissDTO> list = rolePermissInfoService.getRolePermissInfoList(rolesid);
        return list;
//        model.addAttribute("rolesid",rolesid);
//        model.addAttribute("permisslist", JSONArray.fromObject(list));
//        return new ModelAndView("rolepermiss/edit");
    }

    @RequestMapping("/edit.do")
    @ResponseBody
    public ResultBean edit(RolesDTO rolesDTO) {

        if (rolePermissInfoService.edit(rolesDTO.getPermissId(), rolesDTO.getRoleid()+"")) {
            setSuccess(true);
        } else {
            setSuccess(false);
            setMsg("新增失败");
        }
        return resultBean;
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public List findPermissList(String roleid) {

        List<RolePermissDTO> list = rolePermissInfoService.getRolePermissInfoList(roleid);

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
