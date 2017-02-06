package com.vss.sys.service.process;

import com.vss.sys.batis.mapper.RolePermissInfoMapper;
import com.vss.sys.batis.mapper.RolesInfoMapper;
import com.vss.sys.batis.model.RolePermissInfo;
import com.vss.sys.batis.model.RolesInfo;
import com.vss.sys.batis.model.UserInfo;
import com.vss.sys.data.ParamDTO;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.Page;
import com.vss.sys.dto.RolePermissDTO;
import com.vss.sys.dto.RolesDTO;
import com.vss.sys.util.BeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by dujunliang on 16/11/30.
 */
@Lazy
@Component
public class RolesServiceProcess {

    @Autowired
    public BeanMapper beanMapper;

    @Autowired
    public RolesInfoMapper rolesInfoMapper;

    @Autowired
    public RolePermissInfoMapper rolePermissInfoMapper;

    /**
     * 分页查询
     * @param dataTable
     * @return
     */
    public Page<RolesDTO> findRolesInfoPage(PageRequest<Map<String, Object>> dataTable) {

        List<RolesInfo> infoList = rolesInfoMapper.findRoleInfo(dataTable);
        int count = rolesInfoMapper.findCountRoleInfo(dataTable);

        List<RolesDTO> infodto = new ArrayList<RolesDTO>();
        for (int i = 0; i < infoList.size(); i++) {

            infodto.add(beanMapper.map(infoList.get(i), RolesDTO.class));
        }
        Page<RolesDTO> page = new Page<RolesDTO>();
        page.setEntities(infodto);
        page.setCount(count);
        page.setFilter(count);
        page.setsEcho(dataTable.getDraw());
        return page;

    }


    /**
     * 更新
     * @param rolesDTO
     * @return
     */
    public boolean update(RolesDTO rolesDTO) {
        RolesInfo rolesInfo = beanMapper.map(rolesDTO, RolesInfo.class);
        return rolesInfoMapper.updateByPrimaryKeySelective(rolesInfo) > 0;
    }

    /**
     * 删除
     * @param roleid
     * @return
     */
    public boolean deleteUser(Integer[] roleid) {
        Boolean bool = true;
        for (int id : roleid){
            if(rolesInfoMapper.deleteByPrimaryKey(id)<0){
                bool = false;
            }
        }
        return bool;
    }

    /**
     * 保存
     * @param rolesDTO
     * @return
     */
    public boolean save(RolesDTO rolesDTO) {
        return  rolesInfoMapper.insert(beanMapper.map(rolesDTO, RolesInfo.class)) > 0;
    }


    /**
     * 获取单个用户
     * @param rolesid
     * @return
     */
    public RolesDTO getRoles(Integer rolesid) {
        RolesInfo rolesInfo = rolesInfoMapper.selectByPrimaryKey(rolesid);
        return beanMapper.map(rolesInfo,RolesDTO.class);
    }

    public List<ParamDTO> getRoleList(Integer roleid){
        return rolesInfoMapper.getRoleInfoList(roleid);
    }




}
