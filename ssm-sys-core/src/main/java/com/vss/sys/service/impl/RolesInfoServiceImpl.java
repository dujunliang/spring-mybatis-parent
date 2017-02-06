package com.vss.sys.service.impl;

import com.vss.sys.data.ParamDTO;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.Page;
import com.vss.sys.dto.RolesDTO;
import com.vss.sys.service.RolesInfoService;
import com.vss.sys.service.process.RolesServiceProcess;
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
public class RolesInfoServiceImpl implements RolesInfoService {

    @Autowired
    public RolesServiceProcess rolesServiceProcess;

    @Override
    public boolean save(RolesDTO rolesDTO) {
        return rolesServiceProcess.save(rolesDTO);
    }

    @Override
    public boolean update(RolesDTO rolesDTO) {
        return rolesServiceProcess.update(rolesDTO);
    }

    @Override
    @Transactional
    public boolean deleteRoles(Integer[] rolesid) {
        return rolesServiceProcess.deleteUser(rolesid);
    }

    @Override
    public RolesDTO getRoles(Integer rolesid) {
        return rolesServiceProcess.getRoles(rolesid);
    }

    @Override
    public List<RolesDTO> getRolesinfoList() {
        return null;
    }

    @Override
    public Page<RolesDTO> findRolesInfoPage(PageRequest<Map<String, Object>> map) {
        return rolesServiceProcess.findRolesInfoPage(map);
    }

    @Override
    public List<ParamDTO> getRoleList(Integer roles) {
        return rolesServiceProcess.getRoleList(roles);
    }


}
