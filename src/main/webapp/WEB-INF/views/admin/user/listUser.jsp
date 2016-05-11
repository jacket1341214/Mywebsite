<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/6
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>权限管理</title>
  <link rel="stylesheet" type="text/css" href="${ctx}/static/js/jquery-ui/jquery-ui.css"/>
  <link rel="stylesheet" type="text/css" href="${ctx}/static/js/jqGrid/css/ui.jqgrid.css"/>
  <script src="${ctx}/static/js/jqGrid/js/jquery-1.7.2.min.js"></script>
  <script src="${ctx}/static/js/jqGrid/js/i18n/grid.locale-cn.js"></script>
  <script src="${ctx}/static/js/jqGrid/js/jquery.jqGrid.src.js"></script>
</head>
<body>
<h3 class="page-title">
  权限管理
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="${ctx}/message/write">权限管理</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="${ctx}/message/write">查看所有用户</a>
    </li>
  </ul>
</div>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>查看所有用户
      </div>
      <div class="tools">
        <a href="javascript:;" class="collapse">
        </a>
      </div>
    </div>
    <div class="portlet-body">

      <div>
        <table id="jqgridTable"></table>
        <div id="pager"></div>
      </div>
    </div>
  </div>


</div>

<script src="${ctx}/static/mywebsite/common/common.js"></script>
<script language="JavaScript">

  var ctx='${ctx}';
  $(function(){

      var postDate={start:$("#start").val(),end:$("#end").val()};
      var $jq = jQuery.noConflict(true);
      $("#jqgridTable").jqGrid('GridUnload');
      $("#jqgridTable").jqGrid({
        url: ctx+'/admin/listUser',
        datatype: "json",
        mtype: "POST",
        colNames: ['id','用户名', '用户名称', '是否锁定', '是否删除', '详细'],
        colModel: [
          {name: 'id', index: 'id',hidden:true,align:'center',width:'25px'},
          {name: 'username', index: 'username', align: 'center', width: '150px'},
          {name: 'name', index: 'name', align: 'center', width: '150px'},
          {name: 'status', index: 'status', align: 'center', width: '150px',
            formatter:function(v){

              return '1'==v?'是':'否';
            }},
          {name: 'deleted', index: 'ip', align: 'center', width: '150px',
           formatter:function(v){
             return '1'==v?'是':'否';
           }},
          {
            name: 'id', index: 'id', align: 'center', width: '150px',
            formatter:function(v){
              return "<a class='btn btn-sm blue btn-circle' href='"+ctx+"/admin/updateUser/"+v+"'>详细</a>";
            }
          }
        ],
        multiselect: true,
        autowidth: true,
        height: 361,
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
