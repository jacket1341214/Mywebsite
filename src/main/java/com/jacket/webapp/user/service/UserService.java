package com.jacket.webapp.user.service;


import com.github.abel533.entity.Example;
import com.github.pagehelper.PageInfo;
import com.jacket.webapp.user.entity.Role;
import com.jacket.webapp.user.repository.UserRepository;
import com.jacket.webapp.user.service.BaseService;
import com.jacket.webapp.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by jacket on 2015/11/15.
 */
@Service
public class UserService extends BaseService<User> {
    @Autowired
    private UserRepository userRepository;
    public int queryAl(User user){
       return 0;
    }
    public User login(String username,String password){
        System.out.println("-------service---" + username + "\n" + password + "\n");
        Example example=new Example(User.class);
        example.createCriteria().andEqualTo("username", username).andEqualTo("password", password);
        List<User> list=mapper.selectByExample(example);
        User user=null;
        if(list.size()!=0)
            user=list.get(0);
        return user;
    }
    public User findByUsername(String username){
        Example example=new Example(User.class);
        example.createCriteria().andEqualTo("username", username);
        List<User> list=mapper.selectByExample(example);
        User user=null;
        if(list.size()!=0)
            user=list.get(0);
        return user;
    }
    public User findByUserId(String userId){
        Example example=new Example(User.class);
        example.createCriteria().andEqualTo("id", userId);
        List<User> list=mapper.selectByExample(example);
        User user=null;
        if(list.size()!=0)
            user=list.get(0);
        return user;
    }
    public Set<String> getRoles(String userId){
        Set<String> roles=new HashSet<String>();
        roles=userRepository.selectUserRoles(userId);
        System.out.println(roles.toString());
        return roles;
    }
    public Set<String> getStringPermissions(String userId){
        Set<String> permissions=new HashSet<String>();
        permissions=userRepository.selectUserPermissions(userId);
        System.out.println(permissions.toString());
        return permissions;
    }

//    public Boolean updatePassword(String id,String newPassword){
//        Boolean flag=false;
//        User user=new User();
//        user.setId(id);
//        user.setPassword(newPassword);
//        Example example=new Example(User.class);
//        example.createCriteria().andEqualTo("id", id);
////        mapper.
//        return flag;
//    }
}
