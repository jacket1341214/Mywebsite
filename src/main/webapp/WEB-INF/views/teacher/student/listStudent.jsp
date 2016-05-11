<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/6
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>考生管理</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  查看考生
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
      <i class="fa fa-home"></i>
      <a href="#">课程名称:${courseName}</a>
    <input id="courseId" type="hidden" value="${courseId}">
    </li>
  </ul>
</div>
<div class="portlet box blue">
  <div class="portlet-title">
    <div class="caption">
      <i class="fa fa-cogs"></i>查看考生记录
    </div>
    <div class="tools">
      <a href="javascript:;" class="collapse">
      </a>
    </div>
  </div>
  <div class="portlet-body">
    <table class="table table-bordered" id="studentTable">
      <thead>
      <tr>
        <th>用户名</th>
        <th>昵称</th>
        <th>操作</th>
      </tr>
      </thead>
    </table>

  </div>
</div>
<div id="sendMessage" style="width: 650px" class="hide">
  <form class="form-horizontal" role="form" method="post" id="messageForm">
    <div class="form-group"></div>
    <div class="form-group"></div>
    <div class="form-group">
      <label for="toUser" class="col-sm-3 control-label">收件人</label>
      <div class="col-sm-6">
        <input type="text" class="form-control validate[required,minSize[6],maxSize[20]" id="toUser" name="toUser"
               placeholder="请输入收件人">
      </div>
      <div class="col-sm-2 hide" style="color: red" id="flag"><span class="glyphicon glyphicon-remove-circle"></span>用户名不可用</div>
    </div>
    <div class="form-group">
      <label for="title" class="col-sm-3 control-label">主题：</label>
      <div class="col-sm-6">
        <input type="text" class="form-control validate[required,minSize[6],maxSize[20]]" id="title" name="title"
               placeholder="请输入主题">
      </div>
    </div>
    <div class="form-group">
      <label for="content" class="col-sm-3 control-label">内容：</label>
      <div class="col-sm-6">
        <textarea id="content" name="content" rows="5" cols="40" class="form-control"></textarea>
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-4 col-sm-3">
        <input type="reset" class="btn btn-default" value="清除">
        <input type="button" id="messageSubmit" class="btn btn-default col-sm-offset-1" value="发送">
      </div>
    </div>

  </form>
</div>


<script language="JavaScript">
  var ctx='${ctx}';
  $(function(){
    $.post(ctx+'/teacher/student/'+$('#courseId').val()+'/listStudent',function(date){
      layer.load();
      $.each(date,function(i,val){
        $('#studentTable').append("<tr><td>"+val.username+"</td><td>"+val.name+
       "</td><td><a href='#' class='btn green' onclick='sendMessage(this)' id='"+val.username+"'>发送消息</a></td></tr>");
      });
      setTimeout(function(){
        layer.closeAll('loading');
      }, 1000);
    });
    $('td>a').click(function(){
      alert($(this).attr('id'));
    });
    $('#messageSubmit').click(function(){
      var postDate={toUser:$('#toUser').val(),title:$('#title').val(),content:$('#content').val()};
      $.post(ctx+'/message/write',postDate,function(){

      });
      layer.msg('发送成功',{icon:1,time:2000});
      setTimeout(function(){
        layer.closeAll();
      }, 2000);
    })
  })

  function sendMessage(obj){
    $('#toUser').val($(obj).attr('id'));
    $('#toUser').attr('readonly',true);
    $('#sendMessage').removeClass('hide');
    layer.open({
      type: 1,
      title:'发送消息',
      scrollbar: false,
      area: ['680px', '400px'],
      content: $('#sendMessage')
    });
  }
</script>
</body>
</html>
