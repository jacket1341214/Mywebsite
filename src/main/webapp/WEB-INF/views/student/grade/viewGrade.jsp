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
    <title>成绩查询</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  成绩查询
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">成绩查询</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <c:forEach items="${grades}" var="item" begin="0" end="0">
        <a href="#">课程名称：${item.courseName}</a>
      </c:forEach>
    </li>
  </ul>
</div>
<%--课程管理开始--%>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>查看课程成绩
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

          <th>试卷名称</th>

          <th>分数</th>
          <th>完成时间</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${grades}" var="item">
          <tr>

            <td>${item.paperName}</td>
            <td>${item.score}</td>
            <td><fmt:formatDate value="${item.completeTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>


</div>

<script language="JavaScript">
  var ctx='${ctx}';
  function updateCourse(id){
   location.href=ctx+"/teacher/updateCourse?courseId="+id;
  }
</script>

</body>

</html>
