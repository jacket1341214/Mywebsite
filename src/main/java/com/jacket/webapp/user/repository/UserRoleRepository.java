package com.jacket.webapp.user.repository;

import com.github.abel533.mapper.Mapper;
import com.jacket.webapp.user.entity.Role;
import com.jacket.webapp.user.entity.UserRole;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by jacket on 2016/5/2.
 */
@Repository
public interface UserRoleRepository extends Mapper<UserRole>{
    public List<Role> listRoleByUserId(String userId);
}
