package com.vss.sys.service.process;

import com.vss.sys.batis.mapper.PermissInfoMapper;
import com.vss.sys.batis.mapper.RolePermissInfoMapper;
import com.vss.sys.batis.model.PermissInfo;
import com.vss.sys.batis.model.RolePermissInfo;
import com.vss.sys.batis.model.UserInfo;
import com.vss.sys.batis.model.UserRoleInfo;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.Page;
import com.vss.sys.dto.PermissDTO;
import com.vss.sys.dto.UserDTO;
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
public class PermissServiceProcess {

    @Autowired
    public BeanMapper beanMapper;

    @Autowired
    public PermissInfoMapper permissInfoMapper;



    /**
     * 分页查询
     * @param dataTable
     * @return
     */
    public Page<PermissDTO> findPermissInfoPage(PageRequest<Map<String, Object>> dataTable) {

        List<PermissInfo> infoList = permissInfoMapper.findPermissInfo(dataTable);
       // int count = permissInfoMapper.findCountPermissInfo(dataTable);

        List<PermissDTO> infodto = new ArrayList<PermissDTO>();
        for (int i = 0; i < infoList.size(); i++) {

            infodto.add(beanMapper.map(infoList.get(i), PermissDTO.class));
        }

        Page<PermissDTO> page = new Page<PermissDTO>();
        page.setEntities(infodto);
        page.setCount(0);
        page.setFilter(0);
        page.setsEcho(dataTable.getDraw());
        return page;

    }

    /**
     *  登陆
     * @param user
     * @return
     */
    public List<PermissDTO> ownPermiss(UserDTO user) {
        try {
            // TODO Auto-generated method stub
            List<PermissDTO> infodto = new ArrayList<PermissDTO>();
            List<PermissInfo> permissList =  permissInfoMapper.selectByPrimaryOwnPermiss(user.getRoleList());
            for (PermissInfo permissInfo : permissList){
                infodto.add(beanMapper.map(permissInfo, PermissDTO.class));
            }
            return infodto;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 更新
     * @param permissDTO
     * @return
     */
    public boolean update(PermissDTO permissDTO) {
        PermissInfo permissInfo = beanMapper.map(permissDTO, PermissInfo.class);
        return permissInfoMapper.updateByPrimaryKeySelective(permissInfo) > 0;
    }

    /**
     * 删除
     * @param permissid
     * @return
     */
    public boolean deleteUser(Integer[] permissid) {
        Boolean bool = true;
        for (int id : permissid){
            if(permissInfoMapper.deleteByPrimaryKey(id)<0){
                bool = false;
            }
        }
        return bool;
    }

    /**
     * 保存
     * @param permissDTO
     * @return
     */
    public boolean save(PermissDTO permissDTO) {
        PermissInfo permissInfo = beanMapper.map(permissDTO, PermissInfo.class);
        return  permissInfoMapper.insert(permissInfo) > 0;
    }


    /**
     * 获取单个用户
     * @param permissid
     * @return
     */
    public PermissDTO getPermiss(Integer permissid) {
        PermissInfo permissInfo = permissInfoMapper.selectByPrimaryKey(permissid);
        return beanMapper.map(permissInfo,PermissDTO.class);
    }







}
