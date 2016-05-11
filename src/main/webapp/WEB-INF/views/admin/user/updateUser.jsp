<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/6
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>用户信息管理</title>
  <script language="JavaScript" src="${ctx}/static/js/layer/layer.js"></script>
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>

</head>
<body>
<h3 class="page-title">
  用户信息管理
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">当前用户:${user.username}</a>
    </li>

  </ul>
</div>
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>用户信息
      </div>
      <div class="tools">
        <a href="javascript:;" class="collapse">
        </a>
      </div>
    </div>
    <div class="portlet-body">
      <form class="form-horizontal" method="post">
        <div class="form-group hide">
          <label for="id" class="col-sm-2 control-label">id</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" id="id" value="${user.id}">
          </div>
        </div>
        <div class="form-group">
          <label for="username" class="col-sm-2 control-label">账号</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" readonly id="username"
                   value="${user.username}">
          </div>
        </div>
        <div class="form-group">
          <label for="name" class="col-sm-2 control-label">昵称</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" name="name" id="name" readonly
                   value="${user.name}">
          </div>
        </div>
        <div class="form-group">
          <label for="Email" class="col-sm-2 control-label">Email</label>
          <div class="col-sm-5">
            <input type="email" class="form-control" name="email" id="Email" readonly
                   value="${user.email}">
          </div>
        </div>
        <div class="form-group">
          <label for="phone" class="col-sm-2 control-label">电话</label>
          <div class="col-sm-5">
            <input type="text" class="form-control"  name="phone" id="phone" readonly
                   value="${user.phone}">
          </div>
        </div>
        <div class="form-group">
          <label for="create" class="col-sm-2 control-label">创建时间</label>
          <div class="col-sm-5">
            <input type="text" class="form-control " readonly id="create"
                   value="<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">修改时间</label>
          <div class="col-sm-5">
            <input type="email" class="form-control" readonly
                   value="<fmt:formatDate value="${user.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-3 col-sm-5">
            <input type="button" id="deleteBt" class="btn btn-default hide" value="删除">
            <input type="button" id="recoverBt" class="btn btn-default hide" value="恢复">
            <input type="button" id="lockBt" class="btn btn-default hide" value="锁定">
            <input type="button" id="unlockBt" class="btn btn-default hide" value="解除锁定">
            <%--<button type="submit" class="btn btn-primary btn">保存</button>--%>
          </div>
        </div>


      </form>
    </div>
  </div>
<div class="portlet box blue">
  <div class="portlet-title">
    <div class="caption">
      <i class="fa fa-cogs"></i>用户角色管理
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
              <i class="fa fa-plus"></i> 新增角色</a>


          </div>
        </div>
      </div>
    </div>
    <table class="table table-hover table-bordered">
      <caption>角色列表</caption>
      <thead>
      <tr>
        <th>角色名称</th>
        <th>角色代码</th>
        <th>角色描述</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${roles}" var="item">
        <tr>
          <td>${item.name}</td>
          <td>${item.code}</td>
          <td>${item.description}</td>
          <td>
            <input type="button"  value="删除" onclick="deleteRole('${item.id}')"
                   class="btn btn-sm blue btn-circle">
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>


<script language="JavaScript">
  var deleted='${user.deleted==1}';
  var lock='${user.status==1}';
  $(function(){
    if('true'==deleted){
      $('#recoverBt').removeClass('hide');
    }else{
      $('#deleteBt').removeClass('hide');
    }
    if('true'==lock){
      $('#unlockBt').removeClass('hide');
    }else{
      $('#lockBt').removeClass('hide');
    }
    $('#deleteBt').click(function(){
      $.post(location.href,{deleted:1},function(date){
        if('success'==date.msg){
          layer.msg('更新成功',{icon:1,time:2000});
        }

        else{ layer.msg('更新失败',{icon:2,time:2000});
        }
      });
    });
    $('#recoverBt').click(function(){
      $.post(location.href,{deleted:0},function(date){
        if('success'==date.msg){
          layer.msg('更新成功',{icon:1,time:2000});
        }
        else{ layer.msg('更新失败',{icon:2,time:2000});
        }
      });
    });
    $('#lockBt').click(function(){
      $.post(location.href,{status:1},function(date){
        if('success'==date.msg){
          layer.msg('更新成功',{icon:1,time:2000});
        }

        else{ layer.msg('更新失败',{icon:2,time:2000});
        }
      });
    });
    $('#unlockBt').click(function(){
      $.post(location.href,{status:0},function(date){
        if('success'==date.msg){
          layer.msg('更新成功',{icon:1,time:2000});
        }

        else{ layer.msg('更新失败',{icon:2,time:2000});
        }
      });
    });
    $('#addRole').click(function(){
      window.open(location.href+'/addRole');
    });
  })
  function deleteRole(id){
    $.post(location.href+'/deleteRole',{roleId:id},function(date){
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
