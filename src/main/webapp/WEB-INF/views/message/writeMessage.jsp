<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/3/19
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>发送消息</title>
  <link rel="stylesheet" href="${ctx}/static/js/jquery-Validation/css/validationEngine.jquery.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
</head>
<body>
<div class="alert alert-success hide" id="success">
  <strong>添加成功!</strong>
</div>
<div class="alert alert-danger hide" id="failed">
  <strong>添加失败!</strong>
</div>
<h3 class="page-title">
  消息管理
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="${ctx}/message/write">消息管理</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="${ctx}/message/write">发送消息</a>
    </li>
  </ul>
</div>
<div class="row">
  <div class="col-md-2">
    <ul class="ver-inline-menu tabbable margin-bottom-10">
      <li class="active">
        <a  href="${ctx}/message/write">
          <i class="fa fa-briefcase"></i> 发送消息 </a>
							<span class="after">
							</span>
      </li>
      <li>
        <a  href="${ctx}/message/send">
          <i class="fa fa-group"></i> 已发送 </a>
      </li>
      <li>
        <a  href="${ctx}/message/receive">
          <i class="fa fa-leaf"></i> 已接收 </a>
      </li>

    </ul>
  </div>
  <div class="col-md-10">
    <div class="tab-content">
      <div id="tab_1" class="tab-pane active">
        <div id="accordion1" class="panel-group">
          <div class="panel panel-default">
            <div id="accordion1_7" class="panel-collapse">
              <div class="panel-body">
                <form class="form-horizontal" role="form" method="post" id="messageForm">
                  <div class="form-group">
                    <label for="toUser" class="col-sm-2 control-label">收件人</label>
                    <div class="col-sm-6">
                      <input type="text" class="form-control validate[required,minSize[6],maxSize[200]" id="toUser" name="toUser"
                             placeholder="请输入收件人">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">主题：</label>
                    <div class="col-sm-6">
                      <input type="text" class="form-control validate[required,minSize[6],maxSize[40]]" id="title" name="title"
                             placeholder="请输入主题">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="content" class="col-sm-2 control-label">内容：</label>
                    <div class="col-sm-6">
                      <%--<input type="password" class="form-control validate[required,minSize[6],maxSize[20],funcCall[checkPassword]]" id="repassword"--%>
                      <%--placeholder="再次输入新密码">--%>
                      <textarea id="content" name="content" rows="5" cols="40" class="form-control validate[required,maxSize[200]]"></textarea>
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-3">
                      <input type="reset" class="btn btn-default" value="清除">
                      <input type="submit" class="btn btn-default col-sm-offset-1" value="发送">
                    </div>
                  </div>

                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="${ctx}/static/js/jquery-Validation/js/jquery.validationEngine-zh_CN.js"></script>
<script src="${ctx}/static/js/jquery-Validation/js/jquery.validationEngine.js"></script>
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
  $('#messageForm').validationEngine();

</script>

</body>
</html>
