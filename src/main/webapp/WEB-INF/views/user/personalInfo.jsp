<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/3/16
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>个人信息</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <link rel="stylesheet" href="${ctx}/static/js/jquery-Validation/css/validationEngine.jquery.css">
</head>
<body>
<h3 class="page-title">
  个人信息
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="${ctx}/user/userInfo">个人信息</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="${ctx}/user/userInfo">个人信息修改</a>
    </li>
  </ul>
</div>
<%--个人信息开始--%>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>个人信息修改
      </div>
      <div class="tools">
        <a href="javascript:;" class="collapse">
        </a>
      </div>
    </div>
    <div class="portlet-body">
      <form class="form-horizontal" method="post" id="personInfo">
        <div class="form-group hide">
          <label for="id" class="col-sm-2 control-label">id</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" id="id" value="${user.id}">
          </div>
        </div>
        <div class="form-group">
          <label for="username" class="col-sm-2 control-label">账号</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" readonly id="username" value="${user.username}">
          </div>
        </div>
        <div class="form-group">
          <label for="name" class="col-sm-2 control-label">昵称</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" name="name" id="name"
                   value="${user.name}">
          </div>
        </div>
        <div class="form-group">
          <label for="Email" class="col-sm-2 control-label">Email</label>
          <div class="col-sm-5">
            <input type="email" class="form-control" name="email" id="Email"
                   value="${user.email}">
          </div>
        </div>
        <div class="form-group">
          <label for="phone" class="col-sm-2 control-label">电话</label>
          <div class="col-sm-5">
            <input type="text" class="form-control"  name="phone" id="phone"
                   value="${user.phone}">
          </div>
        </div>
        <div class="form-group">
          <label for="create" class="col-sm-2 control-label">创建时间</label>
          <div class="col-sm-5">
            <input type="text" class="form-control " readonly id="create"
                   value="<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">修改时间</label>
          <div class="col-sm-5">
            <input type="email" class="form-control" readonly
                   value="<fmt:formatDate value="${user.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-3 col-sm-5">
            <%--<button  id="updateBt" class="btn btn-default">修改</button>--%>
            <input type="button" id="updateBt" class="btn btn-default" value="修改">
            <%--<button type="submit" class="btn btn-primary btn">保存</button>--%>
          </div>
        </div>


      </form>
    </div>
  </div>



</div>
<%--个人信息结束--%>
<script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
<script language="JavaScript" src="${ctx}/static/js/layer/layer.js"></script>

<script language="JavaScript">
  var ctx='${ctx}';
  $(function(){

    $('#updateBt').click(function(){
      if($('#name').val().length<6||$('#name').val().length>20){
        layer.tips('昵称应在6到20个字符', '#name');
        return;
      }
      if(''==$('#email').val()){
        layer.tips('email不能为空', '#email');
        return;
      }
      if(''==$('#phone').val()){
        layer.tips('电话不能为空', '#phone');
        return;
      }

      $.post(ctx+"/user/userInfo",{id:$('#id').val(),name:$('#name').val(),
        email:$('#email').val(),phone:$('#phone').val()},function(date){
        if('success'==date.msg)
          layer.msg('更新成功',{icon:1,time:2000});
        else  layer.msg('更新失败',{icon:2,time:2000});
      })
    });


  });


</script>
</body>

</html>
