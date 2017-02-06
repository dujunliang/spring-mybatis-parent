package com.vss.sys.treejson;

import java.util.Map;
import java.util.Set;

/**
 * Created by dujunliang on 17/1/5.
 */
public class Node {

    private String id;
    private String pId;
    private String text;
    private Map<String, Object> nodeValue;
    private String path;
    public Node() {

    }
    public Node(String id,String pId,String text,String path){
        this.id = id;
        this.pId = pId;
        this.text = text;
        this.path = path;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getpId() {
        return pId;
    }
    public void setpId(String pId) {
        this.pId = pId;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
    public Map<String, Object> getNodeValue() {
        return nodeValue;
    }
    public void setNodeValue(Map<String, Object> nodeValue) {
        this.nodeValue = nodeValue;
    }
    public String getPath() {
        return path;
    }
    public void setPath(String path) {
        this.path = path;
    }
    @Override
    public String toString() {
        String str = "";
        if(this.nodeValue!=null){
            Set<Map.Entry<String,Object>> entrySet = this.nodeValue.entrySet();
            for (Map.Entry<String, Object> entry : entrySet) {
                str+=entry.getKey()+"="+entry.getValue();
            }
        }
        return str;
    }
}
