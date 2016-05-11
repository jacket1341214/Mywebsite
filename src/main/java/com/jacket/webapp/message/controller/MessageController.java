package com.jacket.webapp.message.controller;

import com.github.pagehelper.PageInfo;
import com.jacket.webapp.common.utils.UUIDGeneratorUtils;
import com.jacket.webapp.message.entity.Message;
import com.jacket.webapp.message.service.MessageService;
import com.jacket.webapp.user.entity.Log;
import com.jacket.webapp.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jacket on 2016/3/13.
 */
@Controller
@RequestMapping("message")
public class MessageController {
    @Autowired
    private MessageService messageService;

    /**
     * 获取未读消息的条数
     * @param httpSession
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getUnreadMessage",method = RequestMethod.GET)
    public Map<String,String> getUnreadMessage(HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        Map<String,String> map=new HashMap<>();
        map.put("msg",String.valueOf(messageService.getUnreadMessage(user.getUsername())));
        return map;
    }

    /**
     * 写消息初始化跳转
     * @return
     */
    @RequestMapping(value = "write",method = RequestMethod.GET)
    public String writeMessageInit(){
        return "message/writeMessage";
    }

    /**
     * 写消息保存发送
     * @param message 消息实体
     * @param httpSession
     * @param map
     * @return
     */
    @RequestMapping(value = "write",method = RequestMethod.POST)
    public String writeMessage(Message message,HttpSession httpSession,ModelMap map){
        User user=(User)httpSession.getAttribute("USER");
        message.setId(new UUIDGeneratorUtils().uuid32());
        message.setFromUser(user.getUsername());
        message.setDate(new Date());
        message.setFromStatus(1);
        message.setToStatus(1);
        if(1==messageService.save(message))
            map.put("msg","success");
        else map.put("msg","failed");
        return "message/writeMessage";
    }

    /**
     * 跳转到已发送消息页面
     * @return
     */
    @RequestMapping(value = "send",method = RequestMethod.GET)
    public String sendMessageInit(){
        return "message/sendMessage";
    }

    /**
     * 获取已发送的所有消息
     * @param pageNumber
     * @param pageSize
     * @param httpSession
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "send",method = RequestMethod.POST)
    public PageInfo<Message> sendMessage(int pageNumber,int pageSize,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return messageService.sendMessage(pageNumber,pageSize,user.getUsername());
    }

    /**
     * 收消息初始化
     * @return
     */
    @RequestMapping(value = "receive",method = RequestMethod.GET)
    public String receiveMessageInit(){
        return "message/receiveMessage";
    }

    /**
     * 获取所有已接收消息
     * @param pageNumber
     * @param pageSize
     * @param httpSession
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "receive",method = RequestMethod.POST)
    public PageInfo<Message> receiveMessage(int pageNumber,int pageSize,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return messageService.receiveMessage(pageNumber,pageSize,user.getUsername());
    }

    /**
     * 设置未读消息为已读
     * @param id 消息id
     * @return
     */
    @RequestMapping(value = "setReadMessage",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> setReadMessage(String id){
        Message message=new Message();
        message.setId(id);
        message.setToStatus(2);
        Map<String,String> map=new HashMap<>();
        if(1==messageService.update(message))
        map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 接收者删除消息
     * @param id 消息id
     * @return
     */
    @RequestMapping(value = "deleteMessage",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deleteMessage(String id){
        Message message=new Message();
        message.setId(id);
        message.setToStatus(0);
        Map<String,String> map=new HashMap<>();
        if(1==messageService.update(message))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }

    /**
     * 发送者删除信息
     * @param id 信息id
     * @return
     */
    @RequestMapping(value = "deleteMessage2",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deleteMessage2(String id){
        Message message=new Message();
        message.setId(id);
        message.setFromStatus(0);
        Map<String,String> map=new HashMap<>();
        if(1==messageService.update(message))
            map.put("msg","success");
        else map.put("msg","failed");
        return map;
    }
}
