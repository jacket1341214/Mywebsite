<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/5/2
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>

<html>
<head>
  <title>角色详细</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  角色管理
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">当前角色:${role.code}</a>
    </li>

  </ul>
</div>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>角色详细
      </div>
      <div class="tools">
        <a href="javascript:;" class="collapse">
        </a>
      </div>
    </div>
    <div class="portlet-body">
      <form class="form-horizontal" role="form" method="post">

        <div class="form-group">
          <label for="name" class="col-sm-3 control-label">角色名称</label>
          <div class="col-sm-6">
            <input type="hidden" id="Id" value="${role.id}">
            <input type="text" class="form-control" name="name" id="name"
                   value="${role.name}">
          </div>
        </div>
        <div class="form-group">
          <label for="code" class="col-sm-3 control-label">角色代码</label>
          <div class="col-sm-6">
            <input type="text" class="form-control" id="code" name="code"
                   value="${role.code}">
          </div>
        </div>
        <div class="form-group">
          <label for="description" class="col-sm-3 control-label">角色描述</label>
          <div class="col-sm-6">
            <textarea id="description" name="description" rows="5" cols="40"
                      class="form-control">${role.description}</textarea>
          </div>
        </div>
        <div class="form-group">
          <label for="status" class="col-sm-3 control-label">状态</label>
          <div class="col-sm-6">
            <select id="status" class="form-control" name="status">
              <c:if test="${role.status==0}">
                <option value="0" selected>不可用</option>
                <option value="1">可用</option>
              </c:if>
              <c:if test="${role.status==1}">
                <option value="0">不可用</option>
                <option value="1" selected>可用</option>
              </c:if>
            </select>
          </div>
        </div>

        <div class="form-group">
          <div class="col-sm-offset-4 col-sm-3">

            <input type="submit" class="btn btn-default col-sm-offset-1" value="修改">
          </div>
        </div>

      </form>
    </div>
  </div>
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>角色拥有的权限
      </div>
      <div class="tools">
        <a href="javascript:;" class="collapse">
        </a>
      </div>
    </div>
    <div class="portlet-body">
      <div class="table-toolbar">
        <div class="row">
          <div class="col-md-6">
            <div>
              <a class="btn green" id="addPermission">
                <i class="fa fa-plus"></i> 新增权限</a>


            </div>
          </div>
        </div>
      </div>
      <table class="table table-hover table-bordered">
        <thead>
        <tr>
          <th>权限名称</th>
          <th>权限代码</th>
          <th>权限描述</th>


          <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${permissions}" var="item">
          <tr>
            <td>${item.name}</td>
            <td>${item.code}</td>
            <td>${item.description}</td>
            <td>
              <input type="button"  value="删除" onclick="deletePermission('${item.id}')"
                     class="btn btn-sm blue btn-circle">
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>


</div>


<script language="JavaScript">
  var msg='${msg}';
  if(''!=msg){
    if('success'==msg){
      $('#success').removeClass('hide');
    }
    else{
      $('#failed').removeClass('hide');
    }
  }
  $(function(){
    $('#addPermission').click(function(){
      window.open(location.href+'/addPermission');
    });

  })
  function deletePermission(id){
    $.post(location.href+'/deletePermission',{perId:id},function(date){
      if('success'==date.msg){
        $(this).parent().parent().remove();
      }
      else{
        layer.msg('失败',{icon:2,time:2000});
      }
    })
  }
</script>
</body>
</html>
