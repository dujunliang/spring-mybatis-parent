package com.vss.sys.batis.mapper;

import com.vss.sys.batis.model.UserRoleInfo;

import java.util.List;

public interface UserRoleInfoMapper {

    int deleteByPrimaryKey(Integer id);

    int deleteByUserId(String userid);

    int insert(UserRoleInfo record);

    int insertSelective(UserRoleInfo record);

    UserRoleInfo selectByPrimaryKey(Integer id);

    List<UserRoleInfo> selectByUserId(String userid);


    int updateByPrimaryKeySelective(UserRoleInfo record);

    int updateByPrimaryKey(UserRoleInfo record);
}