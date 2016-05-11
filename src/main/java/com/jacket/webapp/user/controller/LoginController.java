package com.jacket.webapp.user.controller;

import com.jacket.webapp.common.utils.UUIDGeneratorUtils;
import com.jacket.webapp.user.entity.User;
import com.jacket.webapp.user.service.LogService;
import com.jacket.webapp.user.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.apache.commons.codec.binary.Base64;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by jacket on 2015/11/15.
 */
@Controller
@RequestMapping("user")
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private LogService logService;

    /**
     * 登录跳转
     * @return
     */

    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String loginInit(){
       return "main/login";
    }

    /**
     * 登录认证
     * @param username
     * @param password
     * @param rememberMe
     * @return
     */
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(String username,String password,String rememberMe){
        System.out.println(username+"\n"+password+"\n"+rememberMe);
        Subject sub=null;

        try {
             sub=SecurityUtils.getSubject();
            sub.login(new UsernamePasswordToken(username, password));

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            System.out.println("---------login success");
            }
        return "main/login";

    }

    /**
     * 检查用户名是否可用
     * @param username
     * @return
     */
    @ResponseBody
    @RequestMapping("checkUsername")
    public Map<String,String> checkUsername(String username){
        Map<String,String> map=new HashMap<String,String>();
        if(userService.findByUsername(username)==null){
            map.put("msg","1");
        }
        else map.put("msg","0");

        return map;
    }

    /**
     * 用户退出
     * @param httpServletRequest
     * @return
     */
    @RequestMapping("logout")
    public String logout(HttpServletRequest httpServletRequest){
        logService.log("用户退出",httpServletRequest);
        SecurityUtils.getSubject().logout();
        return "redirect:/login";
    }
    @RequestMapping("validate")
    public String validate(){
        return "main/validate";
    }
    @RequestMapping("401")
    public String error(){
        return "error/401";
    }

    /**
     * 注册初始化跳转
     * @return
     */
    @RequestMapping(value = "register",method = RequestMethod.GET)
    public String registerInit(){
        return "user/register";
    }
    @RequestMapping(value = "test",method = RequestMethod.GET)
    public String test(){
        return "main/show";
    }

    /**
     * 注册用户信息
     * @param user
     * @return
     */
    @RequestMapping(value = "register",method = RequestMethod.POST)
    public String register(User user){
        String id=new UUIDGeneratorUtils().uuid32();
        Date date=new Date();
        user.setId(id);
        user.setUpdateUser(id);
        user.setUpdateTime(date);
        user.setCreateTime(date);
        user.setName(user.getUsername());
        System.out.println(user);
        userService.save(user);
        return "redirect:/login";
    }
}
