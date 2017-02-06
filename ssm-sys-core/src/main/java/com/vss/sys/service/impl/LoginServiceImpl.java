package com.vss.sys.service.impl;

import com.vss.sys.batis.mapper.UserInfoMapper;
import com.vss.sys.batis.model.UserInfo;
import com.vss.sys.dto.UserDTO;
import com.vss.sys.service.process.UserServiceProcess;
import com.vss.sys.service.LoginService;
import com.vss.sys.util.BeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * Created by dujunliang on 16/11/29.
 */
@Transactional
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    public UserInfoMapper userInfoMapper;
    @Autowired
    public BeanMapper beanMapper;
    @Autowired
    public UserServiceProcess loginServiceProcess;

    @Override
    public boolean login(UserDTO user) {

        try {
            // TODO Auto-generated method stub

            UserInfo userInfo = beanMapper.map(user, UserInfo.class);
            userInfo = userInfoMapper.selectByPrimaryKey(userInfo.getUserid());
            if (userInfo != null) {
                System.out.print("My Name is :" + userInfo.getUsername());
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
