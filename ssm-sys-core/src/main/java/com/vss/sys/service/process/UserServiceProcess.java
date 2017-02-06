package com.vss.sys.service.process;

import com.vss.sys.batis.mapper.RolePermissInfoMapper;
import com.vss.sys.batis.mapper.UserInfoMapper;
import com.vss.sys.batis.mapper.UserRoleInfoMapper;
import com.vss.sys.batis.model.RolePermissInfo;
import com.vss.sys.batis.model.UserInfo;
import com.vss.sys.batis.model.UserRoleInfo;
import com.vss.sys.datatable.PageRequest;
import com.vss.sys.datatable.Page;
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
public class UserServiceProcess {

    @Autowired
    public BeanMapper beanMapper;

    @Autowired
    public UserInfoMapper userInfoMapper;

    @Autowired
    public UserRoleInfoMapper userRoleInfoMapper;

    @Autowired
    public RolePermissInfoMapper rolePermissInfoMapper;

    /**
     * 分页查询
     * @param dataTable
     * @return
     */
    public Page<UserDTO> findUserInfoPage(PageRequest<Map<String, Object>> dataTable) {

        List<UserInfo> infoList = userInfoMapper.findUserInfo(dataTable);
        int count = userInfoMapper.findCountUserInfo(dataTable);

        List<UserDTO> infodto = new ArrayList<UserDTO>();

        for (int i = 0; i < infoList.size(); i++) {

            infodto.add(beanMapper.map(infoList.get(i), UserDTO.class));
        }

        Page<UserDTO> page = new Page<UserDTO>();
        page.setEntities(infodto);
        page.setCount(count);
        page.setFilter(count);
        page.setsEcho(dataTable.getDraw());

        return page;

    }


    /**
     * 更新
     * @param userDTO
     * @return
     */
    public boolean update(UserDTO userDTO) {
        UserInfo userInfo = beanMapper.map(userDTO, UserInfo.class);
        return userInfoMapper.updateByPrimaryKeySelective(userInfo) > 0;
    }

    /**
     * 删除
     * @param userid
     * @return
     */
    public boolean deleteUser(Integer[] userid) {
        Boolean bool = true;
        for (int id : userid){
            if(userInfoMapper.deleteByPrimaryKey(id)<0){
                bool = false;
            }
        }
        return bool;
    }

    /**
     * 保存
     * @param userDTO
     * @return
     */
    public boolean save(UserDTO userDTO) {
        return  userInfoMapper.insert(beanMapper.map(userDTO, UserInfo.class)) > 0;
    }


    /**
     * 获取单个用户
     * @param userid
     * @return
     */
    public UserDTO getUser(Integer userid) {
        UserInfo userInfo = userInfoMapper.selectByPrimaryKey(userid);
        return beanMapper.map(userInfo,UserDTO.class);
    }

    /**
     *  登陆
     * @param user
     * @return
     */
    public UserDTO login(UserDTO user) {
        try {
            // TODO Auto-generated method stub

            UserInfo userInfo = beanMapper.map(user, UserInfo.class);
            userInfo = userInfoMapper.selectByUser(userInfo);
            if (userInfo != null) {
                UserDTO userDTO = beanMapper.map(userInfo, UserDTO.class);

                List<UserRoleInfo> list = userRoleInfoMapper.selectByUserId(userDTO.getUserid().toString());

                List<String> rolelist = new ArrayList<String>();
                String roles="";
                for (UserRoleInfo userRoleInfo : list){
                    rolelist.add(userRoleInfo.getRoleid());
                }
                List<String> permisslist = new ArrayList<String>();
                List<RolePermissInfo> permissList =  rolePermissInfoMapper.selectByPrimaryRoleidList(rolelist);
                for (RolePermissInfo rolePermissInfo : permissList){
                    permisslist.add(rolePermissInfo.getPermissId());
                }
                userDTO.setPermissList(permisslist);
                userDTO.setRoleList(rolelist);

                return userDTO;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }





}
