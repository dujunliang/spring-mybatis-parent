package com.vss.sys.spring;

import com.vss.sys.bean.ResultBean;

import java.util.Map;

/**
 * Created by dujunliang on 12/27/16.
 */
public abstract class BaseController  {


    protected ResultBean resultBean = new ResultBean();

    protected Map<String, Object> request;
    protected Map<String, Object> session;
    protected Map<String, Object> application;

    protected ResultBean setData(Object data) {
        resultBean.setData(data);
        return resultBean;
    }

    protected ResultBean setMsg(String msg) {
        resultBean.setMsg(msg);
        return resultBean;
    }

    protected ResultBean setErrorMsg(String errorMsg) {
        resultBean.setErrorMsg(errorMsg);
        return resultBean;
    }

    protected ResultBean setMsg(String msg, String msgType) {
        resultBean.setMsg(msg);
        resultBean.setMsgType(msgType);
        return resultBean;
    }

    protected ResultBean setSuccess(boolean success) {
        resultBean.setSuccess(success);
        return resultBean;
    }

    protected ResultBean setErrorCode(String errorCode) {
        resultBean.setErrorCode(errorCode);
        return resultBean;
    }


    public Map<String, Object> getApplication() {
        return application;
    }

    public void setApplication(Map<String, Object> application) {
        this.application = application;
    }

    public ResultBean getResultBean() {
        return resultBean;
    }

    public void setResultBean(ResultBean resultBean) {
        this.resultBean = resultBean;
    }

    public Map<String, Object> getRequest() {
        return request;
    }

    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
