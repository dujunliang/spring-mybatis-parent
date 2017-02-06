package com.vss.sys.batch;

import com.vss.sys.batis.model.UserInfo;
import org.springframework.batch.item.ItemProcessor;

public class MyProcessor implements ItemProcessor<UserInfo, UserInfo> {

    @Override
    public UserInfo process(UserInfo userInfo) throws Exception {
        return userInfo;
    }

}