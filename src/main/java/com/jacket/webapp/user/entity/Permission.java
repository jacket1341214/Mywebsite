package com.jacket.webapp.user.entity;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by jacket on 2016/3/13.
 */
@Table(name = "t_permission")
public class Permission {
    @Id
    private String id;
    private String code;//权限码
    private String name;//权限名称
    private String description;//描述
    private String status;//状态

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
