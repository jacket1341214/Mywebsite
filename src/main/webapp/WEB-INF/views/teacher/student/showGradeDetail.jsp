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
    <title>学生成绩</title>
</head>
<body>
<%--课程管理开始--%>
<div style="margin: auto auto auto auto">
  <%--左侧--%>
  <div style="width: 20%;margin-left: 4.5%;float: left;background: red">

  </div>
  <%--右侧--%>
  <div style="width: 70%;margin-right: 4.5%;float: right;background: white">
    <div>
      <div class="col-sm-12">
        <table class="table table-bordered" id="studentTable">
          <caption>学生成绩</caption>
          <thead>
          <tr>
            <th>用户名</th>
            <th>昵称</th>
            <%--<th>试卷类型</th>--%>
            <%--<th>题目数量</th>--%>
            <%--<th>总难易度</th>--%>
            <th>分数</th>
            <th>完成时间</th>
          </tr>
          </thead>
          <c:forEach items="${viewGrades}" var="item">
            <tr>
              <td>${item.username}</td>
              <td>${item.name}</td>
              <td>${item.score}</td>

              <td><fmt:formatDate value="${item.completeTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
          </c:forEach>
        </table>
      </div>
    </div>

  </div>
</div>
<%--课程管理结束--%>
</body>
</html>
