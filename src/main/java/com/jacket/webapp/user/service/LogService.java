package com.jacket.webapp.user.service;

import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jacket.webapp.common.utils.UUIDGeneratorUtils;
import com.jacket.webapp.user.entity.Log;
import com.jacket.webapp.user.entity.User;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by jacket on 2016/3/17.
 */
@Service
public class LogService extends BaseService<Log>{

    public int log(String action,HttpServletRequest request){
        Log log=new Log();
        log.setId(new UUIDGeneratorUtils().uuid32());
        log.setOccurTime(new Date());
        log.setAction(action);
        User user=(User)request.getSession(false).getAttribute("USER");
        log.setUserId(user.getId());
        log.setUsername(user.getUsername());
        log.setIp(request.getRemoteAddr());
        System.out.println("---------系统日志-------\n"+log);
        return save(log);
    }
    public PageInfo<Log> queryLogStatus(int pageNumber,int pageSize,String userId){
        Example example=new Example(Log.class);
        example.createCriteria().andEqualTo("userId", userId);
        PageHelper.startPage(pageNumber, pageSize);
        return new PageInfo<Log>(mapper.selectByExample(example));
    }
}
