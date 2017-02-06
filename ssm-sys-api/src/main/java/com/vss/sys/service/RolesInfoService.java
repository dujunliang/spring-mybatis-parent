package com.vss.sys.service;

import com.vss.sys.data.ParamDTO;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.Page;
import com.vss.sys.dto.RolesDTO;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;

/**
 * Created by dujunliang on 16/12/5.
 */
public interface RolesInfoService {


    @interface Save{};
    @interface Update{};

    public boolean save(@NotNull @Validated({Save.class}) RolesDTO rolesDTO);

    public boolean update(@NotNull(groups = {Update.class}) RolesDTO rolesDTO);

    public boolean deleteRoles(@NotNull Integer[] rolesid);

    public RolesDTO getRoles(@NotNull Integer rolesid);

    public List<RolesDTO> getRolesinfoList();

    public Page<RolesDTO> findRolesInfoPage(PageRequest<Map<String, Object>> map);

    public List<ParamDTO> getRoleList(Integer roles);


}
