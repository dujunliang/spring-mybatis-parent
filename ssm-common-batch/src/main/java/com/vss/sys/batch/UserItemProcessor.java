package com.vss.sys.batch;

import com.vss.sys.batis.model.UserInfo;

/**
 * Created by dujunliang on 16/12/2.
 */


    import org.springframework.batch.item.ItemProcessor;

    public class UserItemProcessor implements ItemProcessor<UserInfo, UserInfo> {

        public UserInfo process(final UserInfo userInfo) throws Exception {
            final String username = userInfo.getUsername().toUpperCase();
            final String password = userInfo.getPassword().toUpperCase();
            final UserInfo transformedUserInfo = new UserInfo(username, password);
            System.out.println("Converting (" + userInfo + ") into ("
                    + transformedUserInfo + ")");
            return transformedUserInfo;
        }

    }

