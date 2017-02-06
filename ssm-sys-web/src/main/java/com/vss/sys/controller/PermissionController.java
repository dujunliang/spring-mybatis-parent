package com.vss.sys.controller;

import com.vss.sys.bean.ResultBean;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.PageResponse;
import com.vss.sys.datatable.Page;
import com.vss.sys.dto.PermissDTO;
import com.vss.sys.dto.UserDTO;
import com.vss.sys.service.PermissInfoService;
import com.vss.sys.service.RolePermissInfoService;
import com.vss.sys.spring.BaseController;
import org.apache.shiro.SecurityUtils;
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
@RequestMapping("/permiss")
public class PermissionController extends BaseController {


    @Autowired
    private PermissInfoService permissInfoService;



    @RequestMapping("/permissload.do")
    public ModelAndView permissload() {
        return new ModelAndView("permiss/permissinfo");
    }

    @RequestMapping("/addview.do")
    public ModelAndView addview() {

        return new ModelAndView("permiss/add");
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public PageResponse findPermissList(WebRequest request) {
        Page<PermissDTO> page = permissInfoService.findPermissInfoPage(new PageRequest<Map<String, Object>>(request));
        PageResponse response = new PageResponse(page);
        return response;
    }
    @RequestMapping(value = "/ownlist")
    @ResponseBody
    public List<PermissDTO> ownPermissList(WebRequest request) {
        UserDTO user = (UserDTO) SecurityUtils.getSubject().getSession().getAttribute(ShiroDbRealm.SESSION_USER_KEY);
        return permissInfoService.ownPermiss(user);
    }



    @RequestMapping(value = "/findpermiss")
    @ResponseBody
    public ModelAndView find(Integer permissid,Model model) {
        PermissDTO permissDTO = permissInfoService.getPermiss(permissid);
        model.addAttribute(permissDTO);
        return new ModelAndView("/permiss/update");
    }

    @RequestMapping(value = "/exitspermiss")
    @ResponseBody
    public Map exitsPermiss(Integer rolesid) {
        Map map = new HashMap<>();
        map.put("valid", true);
        return map;
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public ResultBean add(PermissDTO permissDTO) {
        if (permissInfoService.save(permissDTO)) {
            setSuccess(true);
        } else {
            setSuccess(false);
            setMsg("新增失败");
        }
        return resultBean;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public ResultBean update(PermissDTO permissDTO) {
        if (permissInfoService.update(permissDTO)) {
            setSuccess(true);
        } else {
            setSuccess(false);
            setMsg("更新失败");
        }
        return resultBean;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public ResultBean delete(Integer[] permissid) {
        if (permissInfoService.deletePermiss(permissid)) {
            setSuccess(true);
        } else {
            setSuccess(false);
            setMsg("删除失败");
        }
        return resultBean;
    }


}
