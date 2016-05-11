package com.jacket.webapp.user.repository;

import com.github.abel533.mapper.Mapper;
import com.jacket.webapp.user.entity.User;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Repository;

import java.util.Set;

/**
 * Created by jacket on 2015/11/15.
 */
@Repository
public interface UserRepository extends Mapper<User>{

    public Set<String> selectUserPermissions(String userId);
    public Set<String> selectUserRoles(String userId);
}
