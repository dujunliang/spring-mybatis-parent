package com.vss.sys.dto;

import com.vss.sys.data.BaseDTO;
import com.vss.sys.service.UserInfoService;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * Created by dujunliang on 16/11/29.
 */
public class UserDTO extends BaseDTO {

    private static final long serialVersionUID = 1L;


    @NotNull(groups = {UserInfoService.Update.class},message = "userid is not beempty")
    private Integer userid;

    @NotNull(message = "username is not beempty") // 不允许为空
    @Size(min = 2, max = 20) // 长度或大小范围
    private String username;

    @NotNull(message = "password is not beempty")
    @Size(min = 6, max = 20)
    private String password;

    @NotNull(groups = {UserInfoService.Save.class},message = "email is not beempty") // 保存时不允许为空，更新时允许为空 ，表示不更新该字段
    @Pattern(regexp = "^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$")
    private String email;

    @NotNull(groups = {UserInfoService.Update.class,UserInfoService.Save.class},message = "isvalid is not beempty") // 不允许为空
    @Size(min = 1, max = 1)
    private String isValid;

    private String[] rolesId;

    private List<String> roleList;

    private List<String> permissList;

    public UserDTO(){

    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    //@NotBlank(message="用户名不能为空")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

   // @NotBlank(message="状态不能为空")
    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String[] getRolesId() {
        return rolesId;
    }

    public void setRolesId(String[] rolesId) {
        this.rolesId = rolesId;
    }

    public List<String> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<String> roleList) {
        this.roleList = roleList;
    }

    public List<String> getPermissList() {
        return permissList;
    }

    public void setPermissList(List<String> permissList) {
        this.permissList = permissList;
    }

    @Override

    public String toString() {
        return "UserDTO{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", isValid='" + isValid + '\'' +
                '}';
    }
}
