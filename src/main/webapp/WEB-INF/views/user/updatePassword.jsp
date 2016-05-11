<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/3/16
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
  <title>修改密码</title>
  <link rel="stylesheet" href="${ctx}/static/js/jquery-Validation/css/validationEngine.jquery.css">
  <script language="JavaScript" src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  修改密码
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="${ctx}/user/updatePassword">修改密码</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="${ctx}/user/updatePassword">修改登录密码</a>
    </li>
  </ul>
</div>
<%--个人信息开始--%>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>修改登录密码
      </div>
      <div class="tools">
        <a href="javascript:;" class="collapse">
        </a>
      </div>
    </div>
    <div class="portlet-body">
      <form class="form-horizontal" role="form" method="post" id="form2">
        <div class="form-group">
          <label for="password" class="col-sm-4 control-label">原密码</label>
          <div class="col-sm-5">
            <input type="text" class="form-control validate[required,minSize[6],maxSize[20]" id="password" name="password"
                   placeholder="请输入原密码">
          </div>
          <div class="col-sm-2 hide" style="color: red" id="flag"><span class="glyphicon glyphicon-remove-circle"></span>原密码不正确</div>
        </div>
        <div class="form-group">
          <label for="newpassword" class="col-sm-4 control-label">新密码</label>
          <div class="col-sm-5">
            <input type="password" class="form-control validate[required,minSize[6],maxSize[20]]" id="newpassword" name="newPassword"
                   placeholder="请输入新密码">
          </div>
        </div>
        <div class="form-group">
          <label for="repassword" class="col-sm-4 control-label">新密码</label>
          <div class="col-sm-5">
            <input type="password" class="form-control validate[required,minSize[6],maxSize[20],funcCall[checkPassword]]" id="repassword"
                   placeholder="再次输入新密码">
          </div>
        </div>

        <div class="form-group">
          <div class="col-sm-offset-4 col-sm-3">
            <input type="reset" class="btn btn-default" value="清除">
            <input type="submit" class="btn btn-default col-sm-offset-1" value="提交">
          </div>
        </div>

      </form>
    </div>
  </div>



</div>
<%--个人信息结束--%>
<script src="${ctx}/static/js/jquery-Validation/js/jquery.validationEngine-zh_CN.js"></script>
<script src="${ctx}/static/js/jquery-Validation/js/jquery.validationEngine.js"></script>
<script src="${ctx}/static/js/md5/md5.js"></script>
<script language="JavaScript">
  var flag=false;
  var ctx='${ctx}';
  var msg = '${msg}';

  if(msg == null || msg == ''){

  }else{
    if('success' == msg){
      layer.msg(msg,{icon:1,time:2000});
    }else {
      layer.msg(msg,{icon:2,time:2000});
    }

  }
  function checkPassword(field, rules, i, options) {
    if (field.val() != $('#newpassword').val())
      return "2次密码不一致";
      if (field.val() == $('#password').val()) {
        return "新密码与原密码一致";
      }
  }
  $(function() {
    $('#form2').validationEngine({
      onValidationComplete: function(form, status){
        if(flag)
          $('#newpassword').val(hex_md5($('#newpassword').val()));
        else $('#password').focus();

        return flag;

      }
    });
    $('#password').blur(function(){
      $.post(ctx + "/user/checkPassword",{password:hex_md5($('#password').val())},function(date){
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

</script>
</body>
</html>