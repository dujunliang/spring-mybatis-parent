package com.vss.sys.filter;

import com.vss.sys.dto.Resource;
import com.vss.sys.util.StringUtils;
import org.apache.shiro.config.Ini;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.stereotype.Component;
import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

/**
 * Created by dujunliang on 17/1/24.
 * 动态获取过滤内容
 */
@Component
public class ChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {


    private String filterChainDefinitions;

    /**
     * 默认premission字符串
     */
    public static final String PREMISSION_STRING="perms[\"{0}\"]";

    public Ini.Section getObject() throws BeansException {
        Ini ini = new Ini();
        Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
        ini.load(filterChainDefinitions);
        //获取所有Resource
        List<Resource> list = null;//resourceDao.getAll();
        if(list != null && list.size() > 0){
            //加载默认的url

            section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
            //循环Resource的url,逐个添加到section中。section就是filterChainDefinitionMap,
            //里面的键就是链接URL,值就是存在什么条件才能访问该链接
            for (Iterator<Resource> it = list.iterator(); it.hasNext();) {

                Resource resource = it.next();
                //如果不为空值添加到section中
                if(StringUtils.isNotEmpty(resource.getValue()) && StringUtils.isNotEmpty(resource.getPermission())) {
                    section.put(resource.getValue(),  MessageFormat.format(PREMISSION_STRING, resource.getPermission()));
                }

            }

        }

        return section;
    }

    /**
     * 通过filterChainDefinitions对默认的url过滤定义
     *
     * @param filterChainDefinitions 默认的url过滤定义
     */
    public void setFilterChainDefinitions(String filterChainDefinitions) {
        this.filterChainDefinitions = filterChainDefinitions;
    }

    public Class<?> getObjectType() {
        return this.getClass();
    }

    public boolean isSingleton() {
        return false;
    }

}
