package com.vss.sys.batch;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.vss.sys.batis.model.UserInfo;
import org.springframework.jdbc.core.RowMapper;


public class MyRowMapper implements RowMapper<UserInfo>{

    @Override
    public UserInfo mapRow(ResultSet rs, int i)
            throws SQLException {
        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(rs.getString("username"));
        userInfo.setPassword(rs.getString("password"));
        return userInfo;
    }

}
