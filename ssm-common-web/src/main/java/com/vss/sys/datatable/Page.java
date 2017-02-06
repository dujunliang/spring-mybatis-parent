/**
 * @Project Name: dsat-common
 * @File Name: Page.java
 * @Package Name: mo.gov.dsat.datatable
 * @Date: 13/04/201611:06:24 PM
 * @Copyright: Copyright (c) 2016 Atos Information Technology HK Limited. All Rights Reserved.
 */
package com.vss.sys.datatable;

import java.io.Serializable;
import java.util.List;

public class Page<T extends Serializable> {

    /**
     * 返回数据
     */
    private List<T> entities;

    /**
     * 总数据
     */
    private int count;

    private int filter;

    private int sEcho;

    public List<T> getEntities() {
        return entities;
    }

    public void setEntities(List<T> entities) {
        this.entities = entities;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getFilter() {
        return filter;
    }

    public void setFilter(int filter) {
        this.filter = filter;
    }

    public int getsEcho() {
        return sEcho;
    }

    public void setsEcho(int sEcho) {
        this.sEcho = sEcho;
    }
}
