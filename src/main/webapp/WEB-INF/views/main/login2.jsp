<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2015/11/15
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/static/js/bootstrap/css/bootstrap.css">

  <link rel="stylesheet" href="/static/js/layer/skin/layer.css">

  <script language="JavaScript" src="/static/js/jquery/jquery-1.11.2.js"></script>


  <script language="JavaScript" src="/static/js/bootstrap/js/bootstrap.js"></script>
  <script src="/static/js/layer/layer.js"></script>
  <script src="/static/js/md5/md5.js"></script>
  <script src="/static/js/md5/Base64.js"></script>
  <script language="JavaScript">
    $(function(){
//    layer.msg('hello');
//      $('#form2').validate();

      $('#sb').click(function(){
        if($('#username').val()=='')
          layer.msg('请输入用户名',{icon:2});
        else
        if( $('#password').val()=='')
          layer.msg('请输入用户名',{icon:2});
        else{
          $('#password').val(base64encode($('#password').val()));
          $('#form1').submit();
        }
      })

    });
    var a=base64encode("123");
    alert(base64decode(a));
  </script>
</head>
<body>





<div style="text-align: center;margin-top: 10%"><h3>表单</h3></div>
<hr style="height:3px;border:none;border-top:3px ridge black;width: 60%;" />
<div style="padding: 0 20% 0 20%;margin:0 10% 0 20% ">

<form id="form1" class="form-horizontal" role="form" method="post">
  <div class="form-group">
    <label for="username" class="col-md-2 control-label">账号</label>
    <div class="col-sm-10">
      <input type="text"  id="username" name="username"
             placeholder="请输入用户名">
    </div>
  </div>
  <div class="form-group">
    <label for="password" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="password"  id="password" name="password"
             placeholder="请输入密码">
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div style="color: red;font-size: large">${msg}</div>
      <div class="checkbox">
        <label>
          <input type="checkbox" name="rememberMe" id="rememberMe"> 记住我
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" id="sb" class="btn btn-default">登录</button>
    </div>
  </div>

</form>
</div>

<hr style="height:3px;border:none;border-top:3px ridge black;width: 60%;" />

<a href="validate">validate</a>
<script src="/static/js/md5/Base64.js"></script>
<script>
  $(function(){

  })
</script>

</body>
</html>
