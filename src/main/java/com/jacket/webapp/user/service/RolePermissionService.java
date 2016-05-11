package com.jacket.webapp.user.service;

import com.jacket.webapp.user.entity.Permission;
import com.jacket.webapp.user.entity.RolePermission;
import com.jacket.webapp.user.repository.RolePermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/5/2.
 */
@Service
public class RolePermissionService extends BaseService<RolePermission>{
    @Autowired
    private RolePermissionRepository rolePermissionRepository;
    public List<Permission> listPermissionByRoleId(String roleId){
        return rolePermissionRepository.listPermissionByRoleId(roleId);

    }
}
