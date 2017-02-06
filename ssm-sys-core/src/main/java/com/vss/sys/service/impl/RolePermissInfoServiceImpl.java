package com.vss.sys.service.impl;

import com.vss.sys.datatable.Page;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.dto.PermissDTO;
import com.vss.sys.dto.RolePermissDTO;
import com.vss.sys.service.PermissInfoService;
import com.vss.sys.service.RolePermissInfoService;
import com.vss.sys.service.process.PermissServiceProcess;
import com.vss.sys.service.process.RolePermissServiceProcess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


/**
 * Created by dujunliang on 16/11/29.
 */
@Transactional
@Service
public class RolePermissInfoServiceImpl implements RolePermissInfoService {

    @Autowired
    public RolePermissServiceProcess rolePermissServiceProcess;


    @Override
    public List<RolePermissDTO> getRolePermissInfoList(String roleid) {
        return rolePermissServiceProcess.getRolePermissInfoList(roleid);
    }

    @Override
    public Boolean edit(String[] permissid, String roleid) {
        return rolePermissServiceProcess.edit(permissid,roleid);
    }


}
