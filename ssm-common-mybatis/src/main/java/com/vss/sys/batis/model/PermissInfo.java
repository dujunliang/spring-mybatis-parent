package com.vss.sys.batis.model;

public class PermissInfo {
    private Integer permissId;

    private String permissName;

    private String permissType;

    private String permissVal;

    private String permissOwnId;

    private String permissSuperId;

    private String permissSuperVal;

    private String isValid;

    private String createDate;

    private String createUser;

    private String latestOpDate;

    private String latestOpUser;

    public Integer getPermissId() {
        return permissId;
    }

    public void setPermissId(Integer permissId) {
        this.permissId = permissId;
    }

    public String getPermissName() {
        return permissName;
    }

    public void setPermissName(String permissName) {
        this.permissName = permissName == null ? null : permissName.trim();
    }

    public String getPermissType() {
        return permissType;
    }

    public void setPermissType(String permissType) {
        this.permissType = permissType == null ? null : permissType.trim();
    }

    public String getPermissVal() {
        return permissVal;
    }

    public void setPermissVal(String permissVal) {
        this.permissVal = permissVal == null ? null : permissVal.trim();
    }


    public String getPermissOwnId() {
        return permissOwnId;
    }

    public void setPermissOwnId(String permissOwnId) {
        this.permissOwnId = permissOwnId == null ? null : permissOwnId.trim();
    }

    public String getPermissSuperId() {
        return permissSuperId;
    }

    public void setPermissSuperId(String permissSuperId) {
        this.permissSuperId = permissSuperId == null ? null : permissSuperId.trim();
    }

    public String getPermissSuperVal() {
        return permissSuperVal;
    }

    public void setPermissSuperVal(String permissSuperVal) {
        this.permissSuperVal = permissSuperVal == null ? null : permissSuperVal.trim();
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid == null ? null : isValid.trim();
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate == null ? null : createDate.trim();
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public String getLatestOpDate() {
        return latestOpDate;
    }

    public void setLatestOpDate(String latestOpDate) {
        this.latestOpDate = latestOpDate == null ? null : latestOpDate.trim();
    }

    public String getLatestOpUser() {
        return latestOpUser;
    }

    public void setLatestOpUser(String latestOpUser) {
        this.latestOpUser = latestOpUser == null ? null : latestOpUser.trim();
    }
}