package com.vss.sys.dto;

import com.vss.sys.data.BaseDTO;

public class RolePermissDTO extends BaseDTO{

    private Integer id;

    private String roleid;

    private String permissId;

    private String isValid;


    public RolePermissDTO(){

    }

    public RolePermissDTO( String roleid, String permissId, String isValid) {

        this.roleid = roleid;
        this.permissId = permissId;
        this.isValid = isValid;
    }

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

    public String getPermissId() {
        return permissId;
    }

    public void setPermissId(String permissId) {
        this.permissId = permissId == null ? null : permissId.trim();
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid == null ? null : isValid.trim();
    }

    @Override
    public String toString() {
        return "RolePermissDTO{" +
                "id=" + id +
                ", roleid='" + roleid + '\'' +
                ", permissId='" + permissId + '\'' +
                ", isValid='" + isValid + '\'' +
                '}';
    }
}