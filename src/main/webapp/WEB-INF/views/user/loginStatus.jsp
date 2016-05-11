<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/3/16
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
  <title>个人信息</title>
  <link rel="stylesheet" type="text/css" href="${ctx}/static/js/jquery-ui/jquery-ui.css"/>
  <link rel="stylesheet" type="text/css" href="${ctx}/static/js/jqGrid/css/ui.jqgrid.css"/>
</head>
<body>
<h3 class="page-title">
  登录情况
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="${ctx}/user/loginStatus">登录情况</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="${ctx}/user/loginStatus">登录情况查询</a>
    </li>
  </ul>
</div>
<%--个人信息开始--%>
<div style="margin: auto auto auto auto">

    <%--<div><input type="button" id="search" value="查询"></div>--%>
    <div>
      <table id="jqgridTable"></table>
      <div id="pager"></div>

  </div>
</div>
<%--个人信息结束--%>
<script src="${ctx}/static/js/jqGrid/js/jquery-1.7.2.min.js"></script>
<script src="${ctx}/static/js/jqGrid/js/i18n/grid.locale-cn.js"></script>
<script src="${ctx}/static/js/jqGrid/js/jquery.jqGrid.src.js"></script>
<script src="${ctx}/static/mywebsite/common/common.js"></script>
<script language="JavaScript">

  var ctx='${ctx}';
  $(function(){

      var $jq = jQuery.noConflict(true);

      var postDate={start:$("#start").val(),end:$("#end").val()};
      $("#jqgridTable").jqGrid('GridUnload');
      $("#jqgridTable").jqGrid({
        url: ctx+'/log/queryLogStatus',
        datatype: "json",
        mtype: "POST",
        colNames: ['id','用户id', '用户名', '动作', 'ip地址', '发生时间'],
        colModel: [
          {name: 'id', index: 'id',hidden:true,align:'center',width:'40px'},
          {name: 'userId', index: 'userId', align: 'center', width: '200px'},
          {name: 'username', index: 'username', align: 'center', width: '100px'},
          {name: 'action', index: 'action', align: 'center', width: '100px'},
          {name: 'ip', index: 'ip', align: 'center', width: '150px'},
          {
            name: 'occurTime', index: 'occurTime', align: 'center', width: '120px',
            formatter:function(v){
              var d=new Date(v);
              return d.format("yyyy-MM-dd hh:mm:ss");
            }
          }
        ],
        multiselect: true,
        autowidth: true,
        height: 410,
        postData:postDate,
        scroll: false,
        width: '100%',
        rowNum: 10,
        rowList: [10, 20, 30],
        pager: '#pager',
        sortname: 'id',
        viewrecords: true,
        caption:'登录情况',
        sortorder: "desc",
        loadComplete:function(){
          var rowNum = $("#jqgridTable").jqGrid('getGridParam','records');

          if (rowNum==0){
            $("#jqgridTable").parent().append("<br/><br/><div style='text-align: center;font-size: 24px;'>没有查询记录!</div>");

          }

        },

        prmNames: {
          page: "pageNumber", rows: "pageSize"
        },
        jsonReader: {
          root: "list",
          page: "pageNumber",
          total: "pages",
          records: "total",
          repeatitems: false
        }
      });
      $("#jqgridTable").jqGrid('navGrid','#pager',{edit : false,add : false,del : false});


  })
</script>
</body>
</html>
