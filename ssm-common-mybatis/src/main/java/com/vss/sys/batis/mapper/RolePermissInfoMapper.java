package com.vss.sys.batis.mapper;

import com.vss.sys.batis.model.RolePermissInfo;

import java.util.List;

public interface RolePermissInfoMapper {

    int deleteByPrimaryKey(Integer id);

    int deleteByPrimaryRolesId(String roleid);

    int insert(RolePermissInfo record);

    int insertSelective(RolePermissInfo record);

    RolePermissInfo selectByPrimaryKey(Integer id);

    List<RolePermissInfo> selectByPrimaryRoleid(String roleid);

    List<RolePermissInfo> selectByPrimaryRoleidList(List<String> list);

    int updateByPrimaryKeySelective(RolePermissInfo record);

    int updateByPrimaryKey(RolePermissInfo record);



}