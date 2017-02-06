package com.vss.sys.batis.mapper;

import com.vss.sys.batis.model.UserInfo;
import com.vss.sys.datatable.PageRequest;

import java.util.List;
import java.util.Map;

public interface UserInfoMapper {

    List<UserInfo> selectAllInfo(UserInfo userinfo);

    List<UserInfo> findUserInfo(PageRequest<Map<String, Object>> map);

    int findCountUserInfo(PageRequest<Map<String, Object>> map);

    int deleteByPrimaryKey(Integer userid);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer userid);

    UserInfo selectByUser(UserInfo record);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

}