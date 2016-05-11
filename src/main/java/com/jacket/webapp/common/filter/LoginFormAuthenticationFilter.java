package com.jacket.webapp.common.filter;

import com.jacket.webapp.user.service.LogService;
import com.jacket.webapp.user.service.UserService;
import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import com.jacket.webapp.user.entity.User;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by jacket on 2015/12/24.
 */
public class LoginFormAuthenticationFilter extends FormAuthenticationFilter {
    protected final Logger logger = Logger.getLogger(LoginFormAuthenticationFilter.class);

    /**
     * 重写表单过滤是为了确定登录时可以跳转到sucessUrl
     * 同时当用户超时被拦截时，登录后要跳转到请求前的页面
     * 请求的URL保存在savedRequest中，登录时用自动跳转到
     * 首页。
     */
    @Autowired
    private UserService userService;
    @Autowired
    private LogService logService;


    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response)
            throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        if (subject == null) {
            return true;
        }

        String username = (String) subject.getPrincipal();
        User user = userService.findByUsername(username);
        //把当前用户放到session中
        // request.setAttribute("CURRENT_USERID", user);
        if (null != user) {
            System.out.println("-------保存userId------\n"+user);
            httpServletRequest.getSession().setAttribute("USER", user);
            logService.log("用户登录",httpServletRequest);
        }
        SavedRequest savedRequest = WebUtils.getSavedRequest(request);
        String url = httpServletRequest.getContextPath() + this.getSuccessUrl();
        if (savedRequest != null && savedRequest.getRequestUrl() != null) {
            logger.info("----------------------URL=" + this.getSuccessUrl());
            logger.info("----------saveRequest" + savedRequest.getRequestUrl());
            if (savedRequest.getRequestUrl().endsWith("login"))
                httpServletResponse.sendRedirect(url);
            else {
                url = savedRequest.getRequestUrl();
                httpServletResponse.sendRedirect(url);    //页面跳转
            }
        } else {
            //跳转到默认的成功页面
            httpServletResponse.sendRedirect(url);
        }
        return false;
    }

}
