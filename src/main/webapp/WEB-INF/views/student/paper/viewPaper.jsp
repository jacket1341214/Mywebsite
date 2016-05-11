<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/3/23
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>查看试卷</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  考试管理
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">考试管理</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="#">课程名称：${course.name}</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="#">查看试卷</a>
    </li>
  </ul>
</div>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>查看试卷
      </div>
      <div class="tools">
        <a href="javascript:;" class="collapse">
        </a>
      </div>
    </div>
    <div class="portlet-body">
      <table class="table table-hover table-bordered">
        <caption>查看所有考试</caption>
        <thead>
        <tr>
          <th>试卷名称</th>
          <th>试卷描述</th>
          <th>题目数量</th>
          <th>总难易度</th>
          <th>操作</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${papers}" var="item">
          <tr>
            <td>${item.name}</td>
            <td>${item.description}</td>
            <td>${item.count}</td>
            <td>${item.difficulty}</td>
            <td>
              <button class="btn btn-sm blue btn-circle" onclick="startExam('${item.id}')">开始考试</button></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>


</div>

<script language="JavaScript">
  var ctx='${ctx}';
  function startExam(id){

    window.open(location.href+"/"+id);
  }
</script>
</body>

</html>
