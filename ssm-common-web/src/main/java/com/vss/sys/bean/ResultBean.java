package com.vss.sys.bean;

import java.io.Serializable;


public class ResultBean implements Serializable {


    /** 
     *
     */
    private static final long serialVersionUID = -6292812640931231817L;
    private String msg;
    private String msgType="success";
    private boolean success = true;
    private String errorCode;
    private String errorMsg;
    private Object data;

    public String getMsg() {
        return msg;
    }

    public ResultBean setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public String getMsgType() {
        return msgType;
    }

    public ResultBean setMsgType(String msgType) {
        this.msgType = msgType;
        return this;
    }

    public boolean isSuccess() {
        return success;
    }

    public ResultBean setSuccess(boolean success) {
        this.success = success;
        return this;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public ResultBean setErrorCode(String errorCode) {
        this.errorCode = errorCode;
        return this;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public ResultBean setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
        return this;
    }

    public Object getData() {
        return data;
    }

    public ResultBean setData(Object data) {
        this.data = data;
        return this;
    }

    @Override
    public String toString() {
        return "ResultBean [msg=" + msg + ", msgType=" + msgType + ", success="
                + success + ", errorCode=" + errorCode + ", errorMsg=" + errorMsg + ", data=" + data + "]";
    }

}
