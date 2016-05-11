package com.jacket.webapp.common.realm;

/**
 * Created by jacket on 2015/11/15.
 */
import com.jacket.webapp.user.entity.Role;
import com.jacket.webapp.user.entity.User;
import com.jacket.webapp.user.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class MyRealm extends AuthorizingRealm{
    //private static final Logger log = LoggerFactory.getLogger("mywebsite-error");
    @Autowired
    private UserService userService;
    /**
     * 权限认证
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取登录时输入的用户名
        String username=(String) principalCollection.fromRealm(getName()).iterator().next();
        //到数据库查是否有此对象
        User user = userService.findByUsername(username);
        System.out.println("------------权限验证----------");
        //权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
        SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
        info.setRoles(userService.getRoles(user.getId()));
        info.setStringPermissions(userService.getStringPermissions(user.getId()));
        return info;
    }

    /**
     * 登录认证;
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authenticationToken) throws AuthenticationException {
        //UsernamePasswordToken对象用来存放提交的登录信息
        UsernamePasswordToken token=(UsernamePasswordToken) authenticationToken;
        String username=token.getUsername().trim();
        String password=new String(token.getPassword());//获取密码
        User user=null;
        try{
            user=userService.login(username,password);
        }catch (Exception e){

        }

        System.out.println("------------登录验证----------");
        System.out.println("------------"+username+"----------");
        System.out.println("------------"+password+"----------");
        System.out.println("------------"+new String(token.getPassword())+"----------");
        SimpleAuthenticationInfo info=null;
        if(user!=null)
        info=new SimpleAuthenticationInfo(username, password, getName());
        return info;
    }

}
