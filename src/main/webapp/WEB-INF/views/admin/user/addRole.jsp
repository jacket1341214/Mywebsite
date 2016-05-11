<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/5/2
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>

<html>
<head>
  <title>为用户添加角色</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  为用户添加角色
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">当前用户:${user.username}</a>

    </li>

  </ul>
</div>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>所有角色
      </div>
      <div class="tools">
        <a href="javascript:;" class="collapse">
        </a>
      </div>
    </div>
    <div class="portlet-body">
      <div class="table-toolbar">
        <div class="row">
          <div class="col-md-5 col-md-offset-6">
            <div class="pull-right">
              <a class="btn green" id="addRole">
                <i class="fa fa-plus"></i> 增加角色</a>

            </div>
          </div>

        </div>
      </div>
      <table class="table table-hover table-bordered">
        <caption>角色列表</caption>
        <thead>
        <tr>
          <th></th>
          <th>角色名称</th>
          <th>角色代码</th>
          <th>角色描述</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${roles}" var="item">
          <tr>
            <td><input type="checkbox" value="${item.id}"></td>
            <td>${item.name}</td>
            <td>${item.code}</td>
            <td>${item.description}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>

    </div>
  </div>


</div>


<script language="JavaScript">
  var ctx='${ctx}';
  $(function(){
$('#addRole').click(function(){
  if($('input[type=checkbox]').length==0){
    layer.msg('您没有选中任何权限');
  }
  else{
    $('input[type=checkbox]').each(function(i){
      $.post(location.href,{roleId:$(this).val()},function(date){
      })
    })
  }
  layer.msg('提交成功',{icon:1,time:2000});
})
  })

</script>
</body>
</html>
