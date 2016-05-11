<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2015/11/17
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <title><sitemesh:write property='title' /></title>
  <link rel="stylesheet" href="${ctx}/static/js/bootstrap/css/bootstrap.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script language="JavaScript" src="${ctx}/static/js/bootstrap/js/bootstrap.js"></script>
  <sitemesh:write property='head' />
</head>
<body>
<div>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div  class="navbar-collapse collapse">
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">考生模块</a></li>
      <li><a href="${ctx}/student/chooseCourse">课程管理</a></li>
      <li> <a href="#" class="dropdown-toggle" data-toggle="dropdown"
              role="button" aria-expanded="false">考试管理<span class="caret"></span></a>
        <ul class="dropdown-menu pull-left" role="menu" id="studentCourse">
          <li class="dropdown-header">请选择课程</li>
          <li class="divider"></li>
        </ul>
      <li> <a href="#" class="dropdown-toggle" data-toggle="dropdown"
              role="button" aria-expanded="false">错题管理<span class="caret"></span></a>
        <ul class="dropdown-menu pull-left" role="menu" id="errorAnswer">
          <li class="dropdown-header">请选择课程</li>
          <li class="divider"></li>
        </ul>
      <li> <a href="#" class="dropdown-toggle" data-toggle="dropdown"
              role="button" aria-expanded="false">成绩查询<span class="caret"></span></a>
        <ul class="dropdown-menu pull-left" role="menu" id="grade">
          <li class="dropdown-header">请选择课程</li>
          <li class="divider"></li>
        </ul>

    </ul>
    <ul class="nav navbar-nav pull-right nav-pills">
      <li class="active"><a href="${ctx}/message/receive" class="glyphicon glyphicon-envelope"><span class="badge pull-right" id="messageCount"></span></a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown"
           role="button" aria-expanded="false">jacket <span class="caret"></span></a>
        <ul class="dropdown-menu pull-left" role="menu">
          <li><a href="${ctx}/user/userInfo">个人信息</a></li>
          <li><a href="${ctx}/user/logout">退出</a></li>
          <li><a href="#">#</a></li>
        </ul>
      </li>
      <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>


    </ul>
  </div><!--/.nav-collapse -->
  <div  class="navbar-collapse collapse">
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">教师模块</a></li>
      <li><a href="${ctx}/teacher/createCourse">课程管理</a></li>
      <li> <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                     role="button" aria-expanded="false">题库管理<span class="caret"></span></a>
        <ul class="dropdown-menu pull-left" role="menu" id="course">
          <li class="dropdown-header">请选择课程</li>
          <li class="divider"></li>
        </ul>
      </li>
      <li> <a href="#" class="dropdown-toggle" data-toggle="dropdown"
              role="button" aria-expanded="false">考试管理<span class="caret"></span></a>
        <ul class="dropdown-menu pull-left" role="menu" id="exam">
          <li class="dropdown-header">请选择课程</li>
          <li class="divider"></li>
        </ul>
      <li> <a href="#" class="dropdown-toggle" data-toggle="dropdown"
              role="button" aria-expanded="false">考生管理<span class="caret"></span></a>
        <ul class="dropdown-menu pull-left" role="menu" id="student">
          <li class="dropdown-header">请选择课程</li>
          <li class="divider"></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav pull-right nav-pills">
      <li class="active"><a href="${ctx}/message/receive" class="glyphicon glyphicon-envelope"><span class="badge pull-right">50</span></a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown"
           role="button" aria-expanded="false">jacket <span class="caret"></span></a>
        <ul class="dropdown-menu pull-left" role="menu">
          <li><a href="${ctx}/user/userInfo">个人信息</a></li>
          <li><a href="${ctx}/user/logout">退出</a></li>
          <li><a href="#">#</a></li>
        </ul>
      </li>
      <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>


    </ul>
  </div><!--/.nav-collapse -->
  <div  class="navbar-collapse collapse">
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">管理员模块</a></li>
      <li><a href="${ctx}/admin/listUser">权限管理</a></li>
      <li><a href="#contact">问卷管理</a></li>
    </ul>
    <ul class="nav navbar-nav pull-right nav-pills">
      <li class="active"><a href="${ctx}/message/receive" class="glyphicon glyphicon-envelope"><span class="badge pull-right">50</span></a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown"
           role="button" aria-expanded="false">jacket <span class="caret"></span></a>
        <ul class="dropdown-menu pull-left" role="menu">
          <li><a href="${ctx}/user/userInfo">个人信息</a></li>
          <li><a href="${ctx}/user/logout">退出</a></li>
        </ul>
      </li>
      <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>


    </ul>
  </div><!--/.nav-collapse -->
</nav>
</div>


<div style="width: 80%;background: red;margin: 160px auto auto auto">
  <sitemesh:write property='body' />
</div>
<script language="JavaScript">
  var ctx='${ctx}';

  window.onload = function(){
    $.get(ctx+"/message/getUnreadMessage",function(date){
      $('#messageCount').text(date.msg);
    });
    $.post(ctx+"/teacher/findCourseByUserId",function(date){
      $.each(date,function(i,val){
        $('#course').append("<li><a href='"+ctx+"/teacher/"+val.id+"'> "+val.name+"</a></li>");
        $('#exam').append("<li><a href='"+ctx+"/exam/"+val.id+"'> "+val.name+"</a></li>");
        $('#student').append("<li><a href='"+ctx+"/teacher/student/"+val.id+"'> "+val.name+"</a></li>");
      });
    });


    $.post(ctx+"/student/findCourseByUserId",function(date){
      $.each(date,function(i,val){
        $('#studentCourse').append("<li><a href='"+ctx+"/student/"+val.id+"/viewPaper'> "+val.name+"</a></li>");
        $('#errorAnswer').append("<li><a href='"+ctx+"/student/"+val.id+"/errorQuestion'> "+val.name+"</a></li>");
        $('#grade').append("<li><a href='"+ctx+"/student/"+val.id+"/viewGrade'> "+val.name+"</a></li>");


      });
    })
  }
  $(function(){
  })
</script>
</body>
</html>