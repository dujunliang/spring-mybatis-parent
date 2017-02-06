package com.vss.sys.service.process;

import com.vss.sys.batis.mapper.RolePermissInfoMapper;
import com.vss.sys.batis.mapper.UserRoleInfoMapper;
import com.vss.sys.batis.model.RolePermissInfo;
import com.vss.sys.batis.model.UserRoleInfo;
import com.vss.sys.dto.RolePermissDTO;
import com.vss.sys.dto.UserRoleDTO;
import com.vss.sys.util.BeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dujunliang on 16/11/30.
 */
@Lazy
@Component
public class UserRoleServiceProcess {

    @Autowired
    public BeanMapper beanMapper;

    @Autowired
    public UserRoleInfoMapper userRoleInfoMapper;


    /**
     * 获取权限信息
     * @param userid
     * @return
     */
    public List<UserRoleDTO> getUserRoleInfoList(String userid) {
        List<UserRoleDTO> listdto = new ArrayList<UserRoleDTO>();
        List<UserRoleInfo> list = userRoleInfoMapper.selectByUserId(userid);
        for (UserRoleInfo userRoleInfo : list) {
            listdto.add(beanMapper.map(userRoleInfo, UserRoleDTO.class));
        }
        return listdto;
    }

    /**
     * 修改角色权限
     * @param rolesid
     * @param userid
     * @return
     */
    public Boolean edit(String[] rolesid,String userid){

        userRoleInfoMapper.deleteByUserId(userid);

        for (String roleid : rolesid) {
            UserRoleDTO dto = new UserRoleDTO();
            dto.setRoleid(roleid);
            dto.setUserid(userid);
            dto.setIsValid("A");
            UserRoleInfo rpinfo = beanMapper.map(dto, UserRoleInfo.class);
            userRoleInfoMapper.insert(rpinfo);
        }

        return true;
    }


}
