package com.vss.sys.service;

import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.Page;
import com.vss.sys.dto.PermissDTO;
import com.vss.sys.dto.UserDTO;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;

/**
 * Created by dujunliang on 16/12/5.
 */
public interface PermissInfoService {


    @interface Save{};
    @interface Update{};

    public boolean save(@NotNull @Validated({Save.class}) PermissDTO permissDTO);

    public boolean update(@NotNull(groups = {Update.class}) PermissDTO permissDTO);

    public boolean deletePermiss(@NotNull Integer[] permissid);


    public PermissDTO getPermiss(@NotNull @Min(1) Integer permissid);

    public List<PermissDTO> getPermissInfoList();

    public Page<PermissDTO> findPermissInfoPage(PageRequest<Map<String, Object>> map);

    public List<PermissDTO> ownPermiss(UserDTO userDTO);


}
