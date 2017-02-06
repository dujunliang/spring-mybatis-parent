package com.vss.sys.service.process;

import com.vss.sys.batis.mapper.PermissInfoMapper;
import com.vss.sys.batis.mapper.RolesInfoMapper;
import com.vss.sys.data.ParamDTO;
import com.vss.sys.datatable.Page;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.Map;

/**
 * Created by dujunliang on 17/1/6.
 */
@Lazy
@Component
public class Select2ServiceProcess {


    @Autowired
    public PermissInfoMapper permissInfoMapper;

    @Autowired
    public RolesInfoMapper rolesInfoMapper;


    public Page<ParamDTO> select2SelectPermiss(PageRequest<Map<String, Object>> map) {

        List<ParamDTO> infoList = permissInfoMapper.select2PermissInfo(map);
        Page<ParamDTO> page = new Page<ParamDTO>();
        page.setEntities(infoList);
        page.setCount(15);

        return page;
    }

    public Page<ParamDTO> select2SelectRole(PageRequest<Map<String, Object>> map) {

        List<ParamDTO> infoList = rolesInfoMapper.select2RoleInfo(map);
        Page<ParamDTO> page = new Page<ParamDTO>();
        page.setEntities(infoList);
        page.setCount(15);

        return page;
    }




}
