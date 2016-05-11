package com.jacket.webapp.message.service;

import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jacket.webapp.message.entity.Message;
import com.jacket.webapp.user.service.BaseService;
import org.springframework.stereotype.Service;

/**
 * Created by jacket on 2016/3/13.
 */
@Service
public class MessageService extends BaseService<Message> {
    /**
     * 查询未读消息
     * @param to 接收者id
     * @return 未读消息条数
     */
    public int getUnreadMessage(String to){
        Example example=new Example(Message.class);
        System.out.println("--------to--------\n"+to);
        example.createCriteria().andEqualTo("toUser",to).andEqualTo("toStatus", 1);
        return mapper.selectByExample(example).size();
    }

    /**
     * 查询已发送的消息
     * @param pageNumber
     * @param pageSize
     * @param username
     * @return
     */
    public PageInfo<Message>  sendMessage(int pageNumber,int pageSize,String username){
        Example example=new Example(Message.class);
        example.createCriteria().andEqualTo("fromUser",username).andEqualTo("fromStatus", 1);
        PageHelper.startPage(pageNumber, pageSize);
        return new PageInfo<Message>(mapper.selectByExample(example));
    }

    /**
     * 查询已收到的消息
     * @param pageNumber
     * @param pageSize
     * @param username
     * @return
     */
    public PageInfo<Message>  receiveMessage(int pageNumber,int pageSize,String username){
        Example example=new Example(Message.class);
        example.createCriteria().andEqualTo("toUser",username).andNotEqualTo("toStatus",0);
        PageHelper.startPage(pageNumber, pageSize);
        return new PageInfo<Message>(mapper.selectByExample(example));
    }
}
