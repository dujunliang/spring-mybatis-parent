package com.vss.sys.data;


public class BaseDTO implements DTO {

    private static final long serialVersionUID = 3761458575768025556L;

    private String createUser;

    private String createData;


    private String latestOpDate;

    private String latestOpUser;

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public String getCreateData() {
        return createData;
    }

    public void setCreateData(String createData) {
        this.createData = createData;
    }

    public String getLatestOpDate() {
        return latestOpDate;
    }

    public void setLatestOpDate(String latestOpDate) {
        this.latestOpDate = latestOpDate;
    }

    public String getLatestOpUser() {
        return latestOpUser;
    }

    public void setLatestOpUser(String latestOpUser) {
        this.latestOpUser = latestOpUser;
    }

    @Override
    public String toString() {
        return "BaseDTO{" +
                "createUser='" + createUser + '\'' +
                ", createData='" + createData + '\'' +
                ", latestOpDate='" + latestOpDate + '\'' +
                ", latestOpUser='" + latestOpUser + '\'' +
                '}';
    }
}
