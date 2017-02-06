package com.vss.sys.batis.model;


public class UserInfo {
    private Integer userid;

    private String username;

    private String password;

    private String email;

    private String createUser;

    private String createData;

    private String isValid;

    private String latestOpDate;

    private String latestOpUser;

    public UserInfo() {

    }

    public UserInfo(String username, String password) {

        this.username = username;
        this.password = password;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public String getCreateData() {
        return createData;
    }

    public void setCreateData(String createData) {
        this.createData = createData == null ? null : createData.trim();
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid == null ? null : isValid.trim();
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}