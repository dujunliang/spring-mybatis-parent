package com.vss.sys.dto;

import com.vss.sys.data.BaseDTO;
import com.vss.sys.service.PermissInfoService;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class PermissDTO extends BaseDTO {


    @NotNull(groups = {PermissInfoService.Update.class},message = "permissid is not beempty")
    private Integer permissId;

    @NotNull(message = "peimissName is not beempty")
    @Size(min = 1,max = 20)
    private String permissName;

    @NotNull(message = "permissType is not beempty")
    @Size(min = 1,max = 20)
    private String permissType;

    @NotNull(groups = {PermissInfoService.Update.class,PermissInfoService.Save.class},message = "permissVal is not beempty")
    @Size(min = 1,max = 20)
    private String permissVal;

    @NotNull(message = "permissOwnId is not beempty")
    @Size(min = 1,max = 20)
    private String permissOwnId;

    @NotNull(message = "permissSuperId is not beempty")
    @Size(min = 1,max = 20)
    private String permissSuperId;

    private String permissSuperVal;

    @NotNull(groups = {PermissInfoService.Update.class,PermissInfoService.Save.class},message = "isValid is not beempty")
    @Size(min = 1, max = 1)
    private String isValid;


    public Integer getPermissId() {
        return permissId;
    }

    public void setPermissId(Integer permissId) {
        this.permissId = permissId;
    }

    public String getPermissName() {
        return permissName;
    }

    public void setPermissName(String permissName) {
        this.permissName = permissName == null ? null : permissName.trim();
    }

    public String getPermissType() {
        return permissType;
    }

    public void setPermissType(String permissType) {
        this.permissType = permissType == null ? null : permissType.trim();
    }

    public String getPermissVal() {
        return permissVal;
    }

    public void setPermissVal(String permissVal) {
        this.permissVal = permissVal == null ? null : permissVal.trim();
    }


    public String getPermissOwnId() {
        return permissOwnId;
    }

    public void setPermissOwnId(String permissOwnId) {
        this.permissOwnId = permissOwnId == null ? null : permissOwnId.trim();
    }


    public String getPermissSuperId() {
        return permissSuperId;
    }

    public void setPermissSuperId(String permissSuperId) {
        this.permissSuperId = permissSuperId == null ? null : permissSuperId.trim();
    }

    public String getPermissSuperVal() {
        return permissSuperVal;
    }

    public void setPermissSuperVal(String permissSuperVal) {
        this.permissSuperVal = permissSuperVal == null ? null : permissSuperVal.trim();
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid == null ? null : isValid.trim();
    }


    @Override
    public String toString() {
        return "PermissDTO{" +
                "permissId=" + permissId +
                ", permissName='" + permissName + '\'' +
                ", permissType='" + permissType + '\'' +
                ", permissVal='" + permissVal + '\'' +
                ", permissOwnId='" + permissOwnId + '\'' +
                ", permissSuperId='" + permissSuperId + '\'' +
                ", permissSuperVal='" + permissSuperVal + '\'' +
                ", isValid='" + isValid + '\'' +
                '}';
    }
}