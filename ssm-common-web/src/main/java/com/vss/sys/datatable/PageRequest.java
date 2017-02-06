package com.vss.sys.datatable;

import com.vss.sys.util.Constants;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.WebRequest;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class PageRequest<T> {

    private int draw; // 第几次请求
    private int start = Constants.IDISPLAYSTART;// 起止位置'0'
    private int length = Constants.DISPLAYLENGTH; // 数据长度'10'

    private Map<String, Object> condition = new HashMap<String, Object>(); // 查询条件

    public PageRequest() {

    }

    public PageRequest(int pageSize,int pageNumber,Map<String, Object> condition){
        this.start = pageNumber;
        this.length = pageSize;
        this.condition.putAll(condition);
    }

    public PageRequest(WebRequest request) {
        if (StringUtils.isNotBlank(request.getParameter("aoData"))) {

            JSONArray jsonarray = JSONArray.fromObject(request.getParameter("aoData"));
            for (int i = 0; i < jsonarray.size(); i++) {
                JSONObject obj = (JSONObject) jsonarray.get(i);
                if (obj.get("name").equals("sEcho"))
                    this.setDraw(obj.getInt("value"));

                if (obj.get("name").equals("iDisplayStart"))
                    this.setStart(obj.getInt("value"));

                if (obj.get("name").equals("iDisplayLength"))
                    this.setLength(obj.getInt("value"));
            }
        }

        if (StringUtils.isNotBlank(request.getParameter("searchData"))
                && request.getParameter("searchData").startsWith("[")) {
            JSONArray searchData = JSONArray.fromObject(request.getParameter("searchData"));
            if (searchData != null && searchData.size() > 0) {

                for (int i = 0; i < searchData.size(); i++) {
                    JSONObject jsonObject = searchData.getJSONObject(i);

                    Iterator iterator = jsonObject.keys();
                    while(iterator.hasNext()){
                        String key = iterator.next().toString();
                        if (StringUtils.isNotBlank(jsonObject.getString(key))) {
                            this.condition.put(key,
                                    jsonObject.getString(key));
                        }
                    }
                }
            }
        }
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }



    public Map<String, Object> getCondition() {
        return condition;
    }

    public void setCondition(Map<String, Object> condition) {
        this.condition = condition;
    }



}
