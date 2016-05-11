package com.jacket.webapp.user.service;

import com.jacket.webapp.user.entity.Role;
import com.jacket.webapp.user.entity.UserRole;
import com.jacket.webapp.user.repository.UserRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jacket on 2016/5/2.
 */
@Service
public class UserRoleService extends BaseService<UserRole>{
    @Autowired
    private UserRoleRepository userRoleRepository;
    public List<Role> listRoleByUserId(String userId){
        return userRoleRepository.listRoleByUserId(userId);
    }
}
