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
    <title>查看课程</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
</head>
<body>
<h3 class="page-title">
  课程管理
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">课程管理</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="${ctx}/student/viewCourse">查看课程</a>
    </li>
  </ul>
</div>
<script language="JavaScript">
  function getType(i){
    var type=["其它","公共|必修","公共|选修","学科基础教育|必修","学科基础教育|选修",
      "专业|必修","专业|选修","专业|实践"];
    return type[i];
  }
</script>
<%--课程管理开始--%>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>查看课程
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
          <th>课程名称</th>
          <th>课程性质</th>
          <th>课程描述</th>
          <th>教师名称</th>
          <th>教师名称</th>
          <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${viewCourses}" var="item">
          <tr>
            <td>${item.name}</td>
            <td><script language="JavaScript">
              document.write(getType(${item.type}));
            </script></td>
            <td>${item.description}</td>
            <td>${item.teacherUsername}</td>
            <td>${item.teacherName}</td>
            <td>
              <button class="btn btn-sm blue btn-circle" onclick="deleteCourse('${item.id}')">删除</button></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>



</div>
<%--课程管理结束--%>
<script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
<script src="${ctx}/static/js/layer/layer.js"></script>
<script src="${ctx}/static/mywebsite/common/common.js"></script>
<script language="JavaScript">
  var ctx='${ctx}';
  function deleteCourse(id){
    $.post(ctx+'/student/viewCourse',{id:id},function(date){
      if('success'==date.msg){
        layer.msg('成功',{icon:1,time:2000});
      }
      else{
        layer.msg('失败',{icon:2,time:2000});
      }
    })
  }
</script>
</body>

</html>
