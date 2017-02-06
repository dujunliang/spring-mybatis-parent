package com.vss.sys.controller;

import com.vss.sys.bean.ResultBean;
import com.vss.sys.data.ParamDTO;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.PageResponse;
import com.vss.sys.datatable.Page;
import com.vss.sys.dto.RolePermissDTO;
import com.vss.sys.dto.RolesDTO;
import com.vss.sys.service.RolePermissInfoService;
import com.vss.sys.service.RolesInfoService;
import com.vss.sys.spring.BaseController;
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
@RequestMapping("/roles")
public class RoleController  extends BaseController {


    @Autowired
    public RolesInfoService rolesInfoService;



    @RequestMapping("/rolesload.do")
    public ModelAndView userload() {
        return new ModelAndView("roles/rolesinfo");
    }

    @RequestMapping("/addview.do")
    public ModelAndView addview() {

        return new ModelAndView("roles/add");
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public PageResponse findUserList(WebRequest request) {
        Page<RolesDTO> page = rolesInfoService.findRolesInfoPage(new PageRequest<Map<String, Object>>(request));
        PageResponse response = new PageResponse(page);
        return response;
    }

    @RequestMapping(value = "/findroles")
    @ResponseBody
    public RolesDTO find(Integer rolesid,Model model) {
        RolesDTO roles = rolesInfoService.getRoles(rolesid);
        return roles;
//        model.addAttribute(roles);
//        return new ModelAndView("/roles/update");
    }

    @RequestMapping(value = "/getroleslist")
    @ResponseBody
    public List<ParamDTO> getList(Integer rolesid) {

        return rolesInfoService.getRoleList(rolesid);
    }

    @RequestMapping(value = "/exitsroles")
    @ResponseBody
    public Map exitsuser(Integer rolesid) {
        Map map = new HashMap<>();
        map.put("valid", true);
        return map;
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public ResultBean add(RolesDTO rolesDTO) {
        if (rolesInfoService.save(rolesDTO)) {
            setSuccess(true);
        } else {
            setSuccess(false);
            setMsg("新增失败");
        }
        return resultBean;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public ResultBean update(RolesDTO rolesDTO) {
        if (rolesInfoService.update(rolesDTO)) {
            setSuccess(true);
        } else {
            setSuccess(false);
            setMsg("更新失败");
        }
        return resultBean;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public ResultBean delete(Integer[] rolesid) {
        if (rolesInfoService.deleteRoles(rolesid)) {
            setSuccess(true);
        } else {
            setSuccess(false);
            setMsg("删除失败");
        }
        return resultBean;
    }

}
