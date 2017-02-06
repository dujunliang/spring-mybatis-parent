package com.vss.sys.dto;

import java.io.Serializable;

/**
 * Created by dujunliang on 17/1/24.
 */
public class Resource implements Serializable {

    private String id;
    //action url
    private String value;
    //shiro permission;
    private String permission;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
}
