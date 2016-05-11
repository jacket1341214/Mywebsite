package com.jacket.webapp.user.repository;

import com.github.abel533.mapper.Mapper;
import com.jacket.webapp.user.entity.Permission;
import org.springframework.stereotype.Repository;

/**
 * Created by jacket on 2016/4/29.
 */
@Repository
public interface PermissionRepository extends Mapper<Permission> {
}
