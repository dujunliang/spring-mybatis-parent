package com.vss.sys.controller;

import com.vss.sys.data.ParamDTO;
import com.vss.sys.datatable.Page;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.PageResponse;
import com.vss.sys.dto.UserDTO;
import com.vss.sys.service.Select2Service;
import com.vss.sys.spring.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by dujunliang on 17/1/6.
 */
@Controller
@RequestMapping("/select2")
public class Selce2Controller extends BaseController {


    @Autowired
    private Select2Service select2Service;


    @RequestMapping(value = "/select2Permiss")
    @ResponseBody
    public PageResponse select2Permiss(@RequestParam int pageSize,@RequestParam int pageNumber,@RequestParam Map<String,Object> params) {

        Page<ParamDTO> page = select2Service.select2SelectPermiss(new PageRequest<Map<String, Object>>(pageSize,pageNumber,params));
        PageResponse response = new PageResponse(page);
        return response;

    }

    @RequestMapping(value = "/select2Role")
    @ResponseBody
    public PageResponse select2Role(@RequestParam int pageSize,@RequestParam int pageNumber,@RequestParam Map<String,Object> params) {

        Page<ParamDTO> page = select2Service.select2SelectRole(new PageRequest<Map<String, Object>>(pageSize,pageNumber,params));
        PageResponse response = new PageResponse(page);
        return response;

    }




}
