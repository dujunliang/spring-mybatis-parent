package com.vss.sys.service.impl;

import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.Page;
import com.vss.sys.dto.PermissDTO;
import com.vss.sys.dto.UserDTO;
import com.vss.sys.service.PermissInfoService;
import com.vss.sys.service.process.PermissServiceProcess;
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
public class PermissInfoServiceImpl implements PermissInfoService {

    @Autowired
    public PermissServiceProcess permissServiceProcess;

    @Override
    public boolean save(PermissDTO permissDTO) {
        return permissServiceProcess.save(permissDTO);
    }

    @Override
    public boolean update(PermissDTO permissDTO) {
        return permissServiceProcess.update(permissDTO);
    }

    @Override
    @Transactional
    public boolean deletePermiss(Integer[] permissid) {
        return permissServiceProcess.deleteUser(permissid);
    }

    @Override
    public PermissDTO getPermiss(Integer permissid) {
        return permissServiceProcess.getPermiss(permissid);
    }

    @Override
    public List<PermissDTO> getPermissInfoList() {
        return null;
    }

    @Override
    public Page<PermissDTO> findPermissInfoPage(PageRequest<Map<String, Object>> map) {
        return permissServiceProcess.findPermissInfoPage(map);
    }

    @Override
    public List<PermissDTO> ownPermiss(UserDTO userDTO) {
        return permissServiceProcess.ownPermiss(userDTO);
    }

}
