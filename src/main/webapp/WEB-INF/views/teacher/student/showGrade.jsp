<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/6
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
  <title>考生管理</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<div style="margin: auto auto auto auto">
  <%--左侧--%>
  <div style="width: 20%;margin-left: 4.5%;float: left;background: red">
    <ul>
      <li><input id="courseId" type="hidden" value="${courseId}">课程名称:${courseName}</li>
    </ul>
    <ul>
      <li><a id="listStudent" href="#">查看考生</a></li>
      <li><a id="showGrade" href="#">查看成绩</a></li>
    </ul>
  </div>
  <%--右侧--%>
  <div style="width: 70%;margin-right: 4.5%;float: right;background: white">
    <div>
      <div class="col-sm-12">
        <table class="table table-bordered" id="paperTable">
          <caption>试卷列表</caption>
          <thead>
          <tr>
            <th>试卷名称</th>
            <th>试卷描述</th>
            <th>试卷类型</th>
            <th>题目数量</th>
            <th>总难易度</th>
            <th>操作</th>

          </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>
<script language="JavaScript">
  var ctx='${ctx}';
  $(function(){
    $('#listStudent').click(function(){
      location.href=ctx+'/teacher/student/'+$('#courseId').val();
    });
    $('#showGrade').click(function(){
      location.href=ctx+'/teacher/student/'+$('#courseId').val()+"/showGrade";
    });
    $.post(ctx+'/teacher/'+$('#courseId').val()+'/listPaper',function(date){
      layer.load();
      $.each(date,function(i,val){
        $('#paperTable').append("<tr><td>"+val.name+"</td><td>"+val.description+
        "</td><td>"+val.type+"</td><td>"+val.count+"</td><td>"+val.difficulty+"</td><td><a href='"+
        ctx+'/teacher/student/'+$('#courseId').val()+'/paper/'+val.id+"'>详细</a></td></tr>");
      });
      setTimeout(function(){
        layer.closeAll('loading');
      }, 1000);
    });


  })
</script>
</body>
</html>
