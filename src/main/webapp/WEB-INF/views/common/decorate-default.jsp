<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2015/11/17
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap 实例 - 固定到顶部
    <sitemesh:write property='title' /></title>
  <link rel="stylesheet" href="/static/js/bootstrap/css/bootstrap.css">
  <script language="JavaScript" src="/static/js/jquery/jquery-1.11.2.js"></script>


  <script language="JavaScript" src="/static/js/bootstrap/js/bootstrap.js"></script>
  <sitemesh:write property='head' />
</head>
<body>
<div>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div id="navbar" class="navbar-collapse collapse">
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#about">About</a></li>
      <li><a href="#contact">Contact</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li class="divider"></li>
          <li class="dropdown-header">Nav header</li>
          <li><a href="#">Separated link</a></li>
        </ul>
      </li>
    </ul>
  </div><!--/.nav-collapse -->

</nav>
</div>
<div style="margin: 4% auto auto auto;width: 80%;">
demo.html的body将被填充到这儿：
  <sitemesh:write property='body' />
</div>
</body>
</html>