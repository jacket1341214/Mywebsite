<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2015/11/18
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="/static/js/jquery-Validation/css/validationEngine.jquery.css">
  <script language="JavaScript" src="/static/js/jquery/jquery-2.0.0.js"></script>


  <script src="/static/js/jquery-Validation/js/jquery.validationEngine-zh_CN.js">
  </script>
  <script src="/static/js/jquery-Validation/js/jquery.validationEngine.js"></script>
  <script language="JavaScript">
    $(function(){
//    layer.msg('hello');
      alert(123);
      $('#form2').validationEngine();



    })

  </script>


</head>
<body>
<form id="form2">
    <dl>
        <dd>
            <input class="validate[required]">
        </dd>
        <dd>
            <input class="validate[required]">
        </dd>
        <dd>
            <input class="validate[required]">
        </dd>
    </dl>
</form>
</body>
</html>
