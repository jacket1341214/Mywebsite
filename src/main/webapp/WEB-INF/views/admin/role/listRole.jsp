<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/29
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>

<html>
<head>
    <title>角色管理</title>
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
      <a href="#">角色管理</a>
      <i class="fa fa-angle-right"></i>
    </li>

  </ul>
</div>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>查看角色
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
              <a class="btn green" id="addRole">
                <i class="fa fa-plus"></i> 增加角色</a>

            </div>
          </div>

        </div>
      </div>
      <table class="table table-hover table-bordered">
        <thead>
        <tr>
          <th>角色名称</th>
          <th>角色代码</th>
          <th>角色描述</th>
          <th>状态</th>

          <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${roles}" var="item">
          <tr>
            <td>${item.name}</td>
            <td>${item.code}</td>
            <td>${item.description}</td>
            <td>${item.status==1?"可用":"不可用"}</td>

            <td>
              <input type="button" value="详情"
                     class="btn btn-sm blue btn-circle" onclick="showDetail('${item.id}')"></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>


</div>
<div id="role" style="width: 650px" class="hide">
  <form class="form-horizontal" role="form" method="post" id="messageForm">
    <div class="form-group"></div>
    <div class="form-group"></div>
    <div class="form-group">
      <label for="name" class="col-sm-3 control-label">角色名称</label>
      <div class="col-sm-6">
        <input type="text" class="form-control validate[required,minSize[6],maxSize[20]" id="name"
               >
      </div>
    </div>
    <div class="form-group">
      <label for="code" class="col-sm-3 control-label">角色代码</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="code"
               >
      </div>
    </div>
    <div class="form-group">
      <label for="description" class="col-sm-3 control-label">角色描述</label>
      <div class="col-sm-6">
        <textarea id="description" name="content" rows="5" cols="40" class="form-control"></textarea>
      </div>
    </div>
    <div class="form-group">
      <label for="status" class="col-sm-3 control-label">状态</label>
      <div class="col-sm-6">
        <select id="status" class="form-control">
          <option value="0">不可用</option>
          <option value="1">可用</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-4 col-sm-3">
        <input type="reset" class="btn btn-default" value="清除">
        <input type="button" id="roleSubmit" class="btn btn-default col-sm-offset-1" value="发送">
      </div>
    </div>

  </form>
</div>

<script language="JavaScript">
  $(function(){
    $('#addRole').click(function(){
      $('#role').removeClass('hide');
      layer.open({
        type: 1,
        title:'增加角色',
        scrollbar: false,
        area: ['680px', '400px'],
        content: $('#role')
      });
    });
    $('#roleSubmit').click(function(){
      var postDate={name:$('#name').val(),code:$('#code').val(),
        description:$('#description').val(),status:$("#status").val()};
      $.post(location.href,postDate,function(date){
        if('success'==date.msg){
          layer.msg('提交成功',{icon:1,time:2000});
        }
        else{
          layer.msg('提交失败',{icon:2,time:2000});
        }
      });
      setTimeout(function(){
        layer.closeAll();
      }, 2000);
    })
  })
  function showDetail(id){
    window.open(ctx+'/admin/role/'+id);
  }
</script>
</body>
</html>
