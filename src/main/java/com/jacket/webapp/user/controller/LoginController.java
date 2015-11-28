package com.jacket.webapp.user.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.apache.commons.codec.binary.Base64;

/**
 * Created by jacket on 2015/11/15.
 */
@Controller
@RequestMapping("user")
public class LoginController {
    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String login(){
       return "main/login";
    }
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login2(String username,String password,String rememberMe){
        System.out.println(username+"\n"+password+"\n"+rememberMe);
        password=new Base64().decode(password).toString();
        try {
            SecurityUtils.getSubject().login(new UsernamePasswordToken(username,password));
        }catch (Exception e){
            e.printStackTrace();
        }
        return "main/index";

    }
    @RequestMapping("validate")
    public String validate(){
        return "main/validate";
    }
    @RequestMapping("401")
    public String error(){
        return "error/401";
    }
}
