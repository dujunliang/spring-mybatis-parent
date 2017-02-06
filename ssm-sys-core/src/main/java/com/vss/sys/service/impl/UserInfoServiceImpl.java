package com.vss.sys.service.impl;

import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.Page;
import com.vss.sys.dto.UserDTO;
import com.vss.sys.service.process.UserServiceProcess;
import com.vss.sys.service.UserInfoService;
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
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    public UserServiceProcess userServiceProcess;

    @Override
    public List<UserDTO> getUserinfoList() {
        return null;
    }
    @Override
    public Page<UserDTO> findUserInfoPage(PageRequest<Map<String, Object>> dataTable) {
        return userServiceProcess.findUserInfoPage(dataTable);
    }

    @Override
    public boolean update(UserDTO userDTO) {
       return userServiceProcess.update(userDTO);
    }

    @Override
    @Transactional
    public boolean deleteUser(Integer[] userid) {
        return  userServiceProcess.deleteUser(userid);
    }

    @Override
    public UserDTO getUser(Integer userid) {
        return userServiceProcess.getUser(userid);
    }

    @Override
    public boolean save(UserDTO userDTO) {
        return userServiceProcess.save(userDTO);
    }

    @Override
    public UserDTO login(UserDTO user) {
        return userServiceProcess.login(user);
    }

}
