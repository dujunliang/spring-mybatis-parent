package com.vss.sys.dto;

import com.vss.sys.data.BaseDTO;
import com.vss.sys.service.RolesInfoService;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class RolesDTO extends BaseDTO {


    @NotNull(groups = {RolesInfoService.Update.class}, message = "roleid is not beempty")
    private Integer roleid;

    @NotNull(message = "username is not beempty") // 不允许为空
    @Size(min = 1, max = 20)
    private String rolename;

    @NotNull(groups = {RolesInfoService.Update.class, RolesInfoService.Save.class}, message = "isValid is not beempty")
    @Size(min = 1, max = 1)
    private String isValid;

    private String[] permissId;


    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename == null ? null : rolename.trim();
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid == null ? null : isValid.trim();
    }

    public String[] getPermissId() {
        return permissId;
    }

    public void setPermissId(String[] permissId) {
        this.permissId = permissId;
    }

    @Override
    public String toString() {
        return "RolesDTO{" +
                "roleid=" + roleid +
                ", rolename='" + rolename + '\'' +
                ", isValid='" + isValid + '\'' +
                '}';
    }
}