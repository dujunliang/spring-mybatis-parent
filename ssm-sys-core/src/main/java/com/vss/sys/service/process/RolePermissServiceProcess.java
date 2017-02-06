package com.vss.sys.service.process;

import com.vss.sys.batis.mapper.PermissInfoMapper;
import com.vss.sys.batis.mapper.RolePermissInfoMapper;
import com.vss.sys.batis.model.PermissInfo;
import com.vss.sys.batis.model.RolePermissInfo;
import com.vss.sys.datatable.Page;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.dto.PermissDTO;
import com.vss.sys.dto.RolePermissDTO;
import com.vss.sys.util.BeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by dujunliang on 16/11/30.
 */
@Lazy
@Component
public class RolePermissServiceProcess {

    @Autowired
    public BeanMapper beanMapper;

    @Autowired
    public RolePermissInfoMapper rolePermissInfoMapper;


    /**
     * 获取权限信息
     * @param roleid
     * @return
     */
    public List<RolePermissDTO> getRolePermissInfoList(String roleid) {
        List<RolePermissDTO> listdto = new ArrayList<RolePermissDTO>();
        List<RolePermissInfo> list = rolePermissInfoMapper.selectByPrimaryRoleid(roleid);
        for (RolePermissInfo rolePermissInfo : list) {
            listdto.add(beanMapper.map(rolePermissInfo, RolePermissDTO.class));
        }
        return listdto;
    }

    /**
     * 修改角色权限
     * @param permiss
     * @param roleid
     * @return
     */
    public Boolean edit(String[] permiss,String roleid){

        rolePermissInfoMapper.deleteByPrimaryRolesId(roleid);

        for (String permissid : permiss) {
            RolePermissDTO dto = new RolePermissDTO();
            dto.setRoleid(roleid);
            dto.setPermissId(permissid);
            dto.setIsValid("A");
            RolePermissInfo rpinfo = beanMapper.map(dto, RolePermissInfo.class);
            rolePermissInfoMapper.insert(rpinfo);
        }

        return true;
    }


}
