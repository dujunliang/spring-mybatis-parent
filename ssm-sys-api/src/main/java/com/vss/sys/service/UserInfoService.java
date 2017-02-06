package com.vss.sys.service;

import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.Page;
import com.vss.sys.dto.UserDTO;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;

/**
 * Created by dujunliang on 16/12/5.
 */
public interface UserInfoService {


    @interface Save{};
    @interface Update{};

    public boolean save(@NotNull @Validated({Save.class}) UserDTO userDTO);

    public boolean update(@NotNull(groups = {Update.class}) UserDTO userDTO);

    public boolean deleteUser(@NotNull Integer[] userid);

    public UserDTO getUser(@NotNull Integer userid);

    public UserDTO login(@NotNull UserDTO user);


    public List<UserDTO> getUserinfoList();

    public Page<UserDTO> findUserInfoPage(PageRequest<Map<String, Object>> map);


}
