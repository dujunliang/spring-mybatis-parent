package com.vss.sys.datatable;


import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.io.Serializable;
import java.util.List;

/**
 * Created by dujunliang on 16/12/6.
 */
public class PageResponse<T extends Serializable> {

    private List<T> data;

    private int recordsTotal; // 数据总记录数

    private int recordsFiltered; // 过滤数

    private int sEcho; //请求服务器端次数

    public PageResponse(Page<T> page){

         this.setData(page.getEntities());
         this.setRecordsTotal(page.getCount());
         this.setRecordsFiltered(page.getFilter());
         this.setsEcho(page.getsEcho()+1);



    }
    public String PageResponse(Page<T> page){

        this.setData(page.getEntities());
        this.setRecordsTotal(page.getCount());
        this.setRecordsFiltered(page.getFilter());
        return JSONObject.fromObject(this).toString();

    }

    public PageResponse(){

    }


    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public int getsEcho() {
        return sEcho;
    }

    public void setsEcho(int sEcho) {
        this.sEcho = sEcho;
    }


}
