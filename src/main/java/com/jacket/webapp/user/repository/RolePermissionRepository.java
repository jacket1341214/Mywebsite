package com.jacket.webapp.user.repository;

import com.github.abel533.mapper.Mapper;

import com.jacket.webapp.user.entity.Permission;
import com.jacket.webapp.user.entity.RolePermission;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

/**
 * Created by jacket on 2015/11/15.
 */
@Repository
public interface RolePermissionRepository extends Mapper<RolePermission>{
    public List<Permission> listPermissionByRoleId(String roleId);
}
