package com.vss.sys.batis.mapper;

import com.vss.sys.batis.model.RolesInfo;
import com.vss.sys.batis.model.UserInfo;
import com.vss.sys.data.ParamDTO;
import com.vss.sys.datatable.PageRequest;

import java.util.List;
import java.util.Map;

public interface RolesInfoMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(RolesInfo record);

    int insertSelective(RolesInfo record);

    RolesInfo selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(RolesInfo record);

    int updateByPrimaryKey(RolesInfo record);

    List<RolesInfo> findRoleInfo(PageRequest<Map<String, Object>> map);

    int findCountRoleInfo(PageRequest<Map<String, Object>> map);

    List<ParamDTO> select2RoleInfo(PageRequest<Map<String, Object>> map);

    List<ParamDTO> getRoleInfoList(Integer roleid);



}