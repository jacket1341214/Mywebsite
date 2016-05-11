package com.jacket.webapp.user.controller;

import com.jacket.webapp.user.entity.User;
import com.jacket.webapp.user.service.LogService;
import com.jacket.webapp.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jacket on 2016/3/16.
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private LogService logService;

    /**
     * 显示用户详细信息跳转
     * @param request
     * @param map
     * @return
     */
    @RequestMapping(value = "userInfo",method = RequestMethod.GET)
    public String userInfoInit(HttpServletRequest request,ModelMap map){
        User user=(User)request.getSession(false).getAttribute("USER");
        map.put("user",userService.findByUserId(user.getId()));
        return "user/personalInfo";
    }

    /**
     * 显示用户详细信息
     * @param user
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "userInfo",method = RequestMethod.POST)
    public Map<String,String> userInfo(User user,HttpServletRequest request){
        logService.log("用户信息修改", request);
        Map<String,String> map=new HashMap<>();
        if (1==userService.updateById(user))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 登录情况跳转
     * @return
     */
    @RequestMapping(value = "loginStatus",method = RequestMethod.GET)
    public String loginStatusInit(){
        return "user/loginStatus";
    }
    @RequestMapping(value = "loginStatus",method = RequestMethod.POST)
    public String loginStatus(){
        return "user/loginStatus";
    }

    /**
     * 更新密码跳转
     * @return
     */
    @RequestMapping(value = "updatePassword",method = RequestMethod.GET)
    public String updatePasswordInit(){
        return "user/updatePassword";
    }

    /**
     * 更新密码
     * @param newPassword
     * @param session
     * @param map
     * @return
     */
    @RequestMapping(value = "updatePassword",method = RequestMethod.POST)
    public String updatePassword(String newPassword,HttpSession session,ModelMap map){
        User user=(User)session.getAttribute("USER");
        User user1=new User();
        user1.setId(user.getId());
        user1.setPassword(newPassword);
        if(1==userService.update(user1))
            map.put("msg","success");
        else map.put("msg","failed");
        return "user/updatePassword";
    }

    /**
     * 检查旧密码是否正确
     * @param password
     * @param session
     * @return
     */
    @RequestMapping(value = "checkPassword",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> checkPassword(String password,HttpSession session){
        User user=(User)session.getAttribute("USER");
        Map<String,String> map=new HashMap<>();
        if(null==userService.login(user.getUsername(),password))
            map.put("msg","failed");
        else map.put("msg","success");
        return map;
    }

}
