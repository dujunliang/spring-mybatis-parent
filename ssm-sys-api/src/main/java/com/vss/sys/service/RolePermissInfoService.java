package com.vss.sys.service;

import com.vss.sys.datatable.Page;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.dto.PermissDTO;
import com.vss.sys.dto.RolePermissDTO;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;

/**
 * Created by dujunliang on 16/12/5.
 */
public interface RolePermissInfoService {


    @interface Save{};
    @interface Update{};

    public List<RolePermissDTO> getRolePermissInfoList(String roleid);

    public Boolean edit(String[] permissid,String roleid);


}
