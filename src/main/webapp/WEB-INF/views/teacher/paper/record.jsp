<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/26
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>查看考试记录</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  查看考试记录
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">试卷名称：${paper.name}</a>
      <input id="paperId" type="hidden" value="${paper.id}">
    </li>
  </ul>
</div>
<div class="portlet box blue">
  <div class="portlet-title">
    <div class="caption">
      <i class="fa fa-cogs"></i>查看考试记录
    </div>
    <div class="tools">
      <a href="javascript:;" class="collapse">
      </a>
    </div>
  </div>
  <div class="portlet-body">
    <table class="table table-hover table-bordered">
      <thead>
      <tr>
        <th>用户名</th>
        <th>昵称</th>
        <th>分数</th>
        <th>完成时间</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${viewGrades}" var="item">
        <tr>
          <td>${item.username}</td>
          <td>${item.name}</td>
          <td>${item.score}</td>
          <td><fmt:formatDate value="${item.completeTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>


        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
