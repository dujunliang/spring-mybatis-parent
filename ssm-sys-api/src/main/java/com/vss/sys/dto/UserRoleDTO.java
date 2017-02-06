package com.vss.sys.dto;

import com.vss.sys.data.BaseDTO;

public class UserRoleDTO extends BaseDTO {


    private Integer id;

    private String roleid;

    private String userid;

    private String isValid;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid == null ? null : roleid.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid == null ? null : isValid.trim();
    }

    @Override
    public String toString() {
        return "UserRoleDTO{" +
                "id=" + id +
                ", roleid='" + roleid + '\'' +
                ", userid='" + userid + '\'' +
                ", isValid='" + isValid + '\'' +
                '}';
    }
}