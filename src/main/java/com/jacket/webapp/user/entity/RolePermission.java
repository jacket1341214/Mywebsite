package com.jacket.webapp.user.entity;

import javax.persistence.Table;
import javax.persistence.Id;
/**
 * Created by jacket on 2016/5/2.
 */
@Table(name = "t_role_per")
public class RolePermission {
    @Id
    private String id;
    private String roleId;
    private String perId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getPerId() {
        return perId;
    }

    public void setPerId(String perId) {
        this.perId = perId;
    }
}
