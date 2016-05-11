<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2015/11/30
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>登录</title>
  <meta charset="utf-8">
  <link rel="stylesheet" type="text/css" href="${ctx}/static/framework/css/register.css"/>

</head>
<body>
<form id="loginForm" method="post">
<div class='signup_container'>

  <h1 class='signup_title'>用户登陆</h1>
  <img src='${ctx}/static/framework/images/people.png' id='admin'/>
  <div id="signup_forms" class="signup_forms clearfix">
    <form class="signup_form_form" id="signup_form" method="post">
      <div class="form_row first_row">
        <label for="username">请输入用户名</label>
        <%--<div class='tip ok'></div>--%>
        <input type="text" name="username" placeholder="请输入用户名" id="username"
               class="validate[required,minSize[6],maxSize[20]]" data-required="required" value="admin123">
      </div>
      <div class="form_row">
        <label for="username">请输入密码</label>
        <%--<div class='tip error'></div>--%>
        <input type="password" name="password" placeholder="请输入密码" id="password"
               class="validate[required,minSize[6],maxSize[20]]" data-required="required" value="admin1234">
      </div>
      <div class="form_row">
        <input type="text" name="rememberMe" placeholder="" id="signup_select" value='' data-required="required">
        <img src='${ctx}/static/framework/images/d.png' id='d'/>
        <ul>
          <li>管理员</li>
          <li>用户1</li>
          <li>用户2</li>
        </ul>
      </div>

    </form>
  </div>

  <div class="login-btn-set"><div class='rem'>记住我</div>
    <div id="formSubmit" class="login-btn"></div></div>
  <%--<a href='javascript:void(0)' onclick="formSubmit()" class='login-btn'>--%>
  <div>
  <div style="float: left;margin-left: 45px"><a href="${ctx}/user/register">新用户注册</a></div>
    <div style="float: right;margin-right: 45px"><a href="#">忘记密码</a></div>
  </div>
  <div>
    <p class='copyright'>版权所有 jacket</p></div>


</div>


</form>
</body>
<script src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
<link rel="stylesheet" href="${ctx}/static/js/jquery-Validation/css/validationEngine.jquery.css">
<script src="${ctx}/static/js/jquery-Validation/js/jquery.validationEngine-zh_CN.js"></script>
<script src="${ctx}/static/js/jquery-Validation/js/jquery.validationEngine.js"></script>
<script src="${ctx}/static/js/md5/md5.js"></script>
<script language="JavaScript">
  $(function(){
    $('#formSubmit').click(function(){
      $('#loginForm').submit();
    })
    $('#loginForm').validationEngine({
      onValidationComplete: function(form, status){
        $('#password').val(hex_md5($('#password').val()));
        return true;
      }
    });


    $('.rem').click(function(){
      $(this).toggleClass('selected');
    })

    $('#signup_select').click(function(){
      $('.form_row ul').show();
      event.cancelBubble = true;
    })

    $('#d').click(function(){
      $('.form_row ul').toggle();
      event.cancelBubble = true;
    })

    $('body').click(function(){
      $('.form_row ul').hide();
    })

    $('.form_row li').click(function(){
      var v  = $(this).text();
      $('#signup_select').val(v);
      $('.form_row ul').hide();
    })


  })



</script>
</html>
