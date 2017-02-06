package com.vss.sys.service;

import com.vss.sys.dto.UserDTO;
import org.springframework.stereotype.Service;

/**
 * Created by dujunliang on 16/11/29.
 */
public interface LoginService {


    public boolean login(UserDTO user);

}
