<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/3/14
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>用户注册</title>
  <link rel="stylesheet" href="${ctx}/static/js/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="${ctx}/static/js/jquery-Validation/css/validationEngine.jquery.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script language="JavaScript" src="${ctx}/static/js/bootstrap/js/bootstrap.js"></script>
</head>
<body style="text-align: center">

<div  style="margin-left: auto;margin-right: auto;width: 60%">
  <div ><h2>用户注册</h2></div>
  <hr/>
<form class="form-horizontal" role="form" method="post" id="form2">
  <div class="form-group">
    <label for="username" class="col-sm-4 control-label">用户名</label>
    <div class="col-sm-5">
      <input type="text" class="form-control validate[required,minSize[6],maxSize[20]" id="username" name="username"
             placeholder="请输入用户名">
    </div>
    <div class="col-sm-2 hide" style="color: red" id="flag"><span class="glyphicon glyphicon-remove-circle"></span>用户名不可用</div>
  </div>
  <div class="form-group">
    <label for="password" class="col-sm-4 control-label">密码</label>
    <div class="col-sm-5">
      <input type="password" class="form-control validate[required,minSize[6],maxSize[20]]" id="password" name="password"
             placeholder="请输入密码">
    </div>
  </div>
  <div class="form-group">
    <label for="repassword" class="col-sm-4 control-label">密码</label>
    <div class="col-sm-5">
      <input type="password" class="form-control validate[required,minSize[6],maxSize[20],funcCall[checkPassword]]" id="repassword"
             placeholder="再次输入密码">
    </div>
  </div>
  <div class="form-group">
    <label for="email" class="col-sm-4 control-label">电子邮件</label>
    <div class="col-sm-5">
      <input type="text" class="form-control" id="email" name="email"
             placeholder="可不填" >
    </div>
  </div>
  <div class="form-group">
    <label for="phone" class="col-sm-4 control-label">电话</label>
    <div class="col-sm-5">
      <input type="text" class="form-control" id="phone" name="phone"
             placeholder="可不填">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-3">
      <input type="reset" class="btn btn-default" value="清除">
      <input type="submit" class="btn btn-default col-sm-offset-1" value="提交">
    </div>
  </div>

</form>
  <hr/>
</div>
</body>
<script src="${ctx}/static/js/jquery-Validation/js/jquery.validationEngine-zh_CN.js"></script>
<script src="${ctx}/static/js/jquery-Validation/js/jquery.validationEngine.js"></script>
<script src="${ctx}/static/js/md5/md5.js"></script>
<script language="JavaScript">
  $(function() {
    $('#form2').validationEngine({
      onValidationComplete: function(form, status){
        if(flag)
        $('#password').val(hex_md5($('#password').val()));
        else $('#username').focus();

        return flag;

      }
    });
    $('#username').blur(function(){
      $.post(ctx + "/user/checkUsername",{username:$('#username').val()},function(date){
        if('success'==date.msg){
          $('#flag').addClass('hide');
          flag=true;
        }
        else {
          $('#flag').removeClass('hide');
        }

      })
    });
  });
  var flag=false;
  var ctx='${ctx}';
  function checkPassword(field, rules, i, options){
   if(field.val()!=$('#password').val()){
     return "密码与原密码不一致";
   }
  }
</script>
</html>
