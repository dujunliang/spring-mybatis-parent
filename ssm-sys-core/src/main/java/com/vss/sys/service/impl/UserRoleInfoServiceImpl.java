package com.vss.sys.service.impl;

import com.vss.sys.dto.RolePermissDTO;
import com.vss.sys.dto.UserRoleDTO;
import com.vss.sys.service.RolePermissInfoService;
import com.vss.sys.service.UserRoleInfoService;
import com.vss.sys.service.process.RolePermissServiceProcess;
import com.vss.sys.service.process.UserRoleServiceProcess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * Created by dujunliang on 16/11/29.
 */
@Transactional
@Service
public class UserRoleInfoServiceImpl implements UserRoleInfoService {

    @Autowired
    public UserRoleServiceProcess userRoleServiceProcess;


    @Override
    public List<UserRoleDTO> getUserRoleInfoList(String userid) {
        return userRoleServiceProcess.getUserRoleInfoList(userid);
    }

    @Override
    public Boolean edit(String[] rolesid, String userid) {
        return userRoleServiceProcess.edit(rolesid,userid);
    }


}
