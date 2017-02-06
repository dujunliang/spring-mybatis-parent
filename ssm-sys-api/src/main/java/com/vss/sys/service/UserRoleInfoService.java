package com.vss.sys.service;

import com.vss.sys.dto.RolePermissDTO;
import com.vss.sys.dto.UserRoleDTO;

import java.util.List;

/**
 * Created by dujunliang on 16/12/5.
 */
public interface UserRoleInfoService {


    @interface Save{};
    @interface Update{};

    public List<UserRoleDTO> getUserRoleInfoList(String userid);

    public Boolean edit(String[] rolesid, String userid);


}
