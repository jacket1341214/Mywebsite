package com.jacket.webapp.user.controller;

import com.github.pagehelper.PageInfo;
import com.jacket.webapp.user.entity.Log;
import com.jacket.webapp.user.entity.User;
import com.jacket.webapp.user.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by jacket on 2016/3/17.
 */
@Controller
@RequestMapping("log")
public class LogController {
    @Autowired
    private LogService logService;

    /**
     * 查询系统日志
     * @param pageNumber
     * @param pageSize
     * @param httpSession
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "queryLogStatus",method = RequestMethod.POST)
    public PageInfo<Log> queryLogStatus(int pageNumber,int pageSize,HttpSession httpSession){
        User user=(User)httpSession.getAttribute("USER");
        return logService.queryLogStatus(pageNumber, pageSize,user.getId());
    }
}
