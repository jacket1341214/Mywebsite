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
    <title>创建课程</title>
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
      <a href="${ctx}/teacher/createCourse">创建课程</a>
    </li>
  </ul>
</div>
<%--课程管理开始--%>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>创建课程
      </div>
      <div class="tools">
        <a href="javascript:;" class="collapse">
        </a>

      </div>
    </div>
    <div class="portlet-body">
      <form class="form-horizontal" role="form" method="post">
        <div class="form-group">
          <label for="name" class="col-sm-4 control-label">课程名：</label>
          <div class="col-sm-5">
            <input type="text" class="form-control validate[required,minSize[6],maxSize[20]" id="name" name="name">
          </div>
        </div>
        <div class="form-group">
          <label for="description" class="col-sm-4 control-label">类型：</label>
          <div class="col-sm-5">
            <select class="form-control" name="type">
              <option value="0">其它</option>
              <option value="1">公共|必修</option>
              <option value="2">公共|选修</option>
              <option value="3">学科基础教育|必修</option>
              <option value="4">学科基础教育|选修</option>
              <option value="5">专业|必修</option>
              <option value="6">专业|选修</option>
              <option value="7">专业|实践</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label for="description" class="col-sm-4 control-label">描述：</label>
          <div class="col-sm-5">
            <input type="text" class="form-control validate[required,minSize[6],maxSize[20]]"  id="description" name="description">
          </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-4 control-label">状态：</label>
          <div class="col-sm-5">
            <div>
              <input type="radio"  name="status" value="1" checked>可用
              <input type="radio"  name="status" value="0">不可用
            </div>

          </div>
        </div>

        <div class="form-group">
          <div class="col-sm-offset-4 col-sm-3">
            <input type="reset" class="btn btn-primary" value="清除">
            <input type="submit" class="btn btn-primary col-sm-offset-1" value="提交">
          </div>
        </div>

      </form>
    </div>
  </div>

</div>
<%--课程管理结束--%>
</body>
</html>
