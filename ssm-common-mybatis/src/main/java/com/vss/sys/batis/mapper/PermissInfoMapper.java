package com.vss.sys.batis.mapper;

import com.vss.sys.batis.model.PermissInfo;
import com.vss.sys.batis.model.RolePermissInfo;
import com.vss.sys.data.ParamDTO;
import com.vss.sys.datatable.PageRequest;

import java.util.List;
import java.util.Map;

public interface PermissInfoMapper {
    int deleteByPrimaryKey(Integer permissId);

    int insert(PermissInfo record);

    int insertSelective(PermissInfo record);

    PermissInfo selectByPrimaryKey(Integer permissId);

    int updateByPrimaryKeySelective(PermissInfo record);

    int updateByPrimaryKey(PermissInfo record);

    List<PermissInfo> findPermissInfo(PageRequest<Map<String, Object>> map);

    int findCountPermissInfo(PageRequest<Map<String, Object>> map);

    List<ParamDTO> select2PermissInfo(PageRequest<Map<String, Object>> map);

    List<PermissInfo> selectByPrimaryOwnPermiss(List<String> list);


}