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
    <title>收信息</title>
  <link rel="stylesheet" type="text/css" href="${ctx}/static/js/jquery-ui/jquery-ui.css"/>
  <link rel="stylesheet" type="text/css" href="${ctx}/static/js/jqGrid/css/ui.jqgrid.css"/>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script src="${ctx}/static/js/jqGrid/js/jquery-1.7.2.min.js"></script>
  <script src="${ctx}/static/js/jqGrid/js/i18n/grid.locale-cn.js"></script>
  <script src="${ctx}/static/js/jqGrid/js/jquery.jqGrid.src.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  消息管理
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="${ctx}/message/receive">消息管理</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="${ctx}/message/receive">已接收</a>
    </li>
  </ul>
</div>
<div class="row">
  <div class="col-md-2">
    <ul class="ver-inline-menu tabbable margin-bottom-10">
      <li>
        <a  href="${ctx}/message/write">
          <i class="fa fa-briefcase"></i> 发送消息 </a>
							<span class="after">
							</span>
      </li>
      <li>
        <a  href="${ctx}/message/send">
          <i class="fa fa-group"></i> 已发送 </a>
      </li>
      <li class="active">
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
                <%--<div><input type="button" id="search" value="查询"></div>--%>
                <div>
                  <table id="jqgridTable"></table>
                  <div id="pager"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="showMessage" style="width: 650px" class="hide">
  <form class="form-horizontal" role="form" method="post" id="messageForm">
    <div class="form-group"></div>
    <div class="form-group"></div>

    <div class="form-group">
      <label for="title" class="col-sm-3 control-label">主题：</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="title" name="title" readonly
               placeholder="请输入主题">
      </div>
    </div>
    <div class="form-group">
      <label for="content" class="col-sm-3 control-label">内容：</label>
      <div class="col-sm-6">
        <textarea id="content" name="content" rows="5" cols="40" class="form-control" readonly></textarea>
      </div>
    </div>



  </form>
</div>
<script src="${ctx}/static/mywebsite/common/common.js"></script>

<script language="JavaScript">

  var ctx='${ctx}';
  $(function(){

      var $jq = jQuery.noConflict(true);
      var postDate={start:$("#start").val(),end:$("#end").val()};
      $("#jqgridTable").jqGrid('GridUnload');
      $("#jqgridTable").jqGrid({
        url: ctx+'/message/receive',
        datatype: "json",
        mtype: "POST",
        colNames: ['id','发送人', '主题', '内容', '发送时间', '状态','操作'],
        colModel: [
          {name: 'id', index: 'id',hidden:true,align:'center',width:'25px'},
          {name: 'fromUser', index: 'fromUser', align: 'center', width: '150px',height:'40px'},
          {name: 'title', index: 'title', align: 'center', width: '150px'},
          {name: 'content', index: 'content', hidden:true,align: 'center', width: '150px'},
          {name: 'date', index: 'date', align: 'center', width: '150px',
            formatter:function(v){
              var d=new Date(v);
              return d.format("yyyy-MM-dd hh:mm:ss");
            }
          },
          {
            name: 'toStatus', index: 'toStatus', align: 'center', width: '150px',
            formatter:function(v){
              var s=["未读","已读"];

              return s[parseInt(v)-1];
            }
          },
          {
            name: 'id', index: 'id', align: 'center', width: '150px',
            formatter:function(v){


              return '<input type="button" onclick="showMessage(this)" class="btn btn-sm blue btn-circle" value="查看" id="'+v+'">'+
                      '  <input type="button" onclick="deleteMessage(this)" class="btn btn-sm blue btn-circle" value="删除" id="'+v+'">';
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
        caption:'已接收消息',
        viewrecords: true,
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
  function showMessage(obj){
    var id=$(obj).attr('id');
    var rowData = $("#jqgridTable").jqGrid('getRowData', id);
    $('#title').val();
    $('#content').val();
    $('#title').val(rowData.title);
    $('#content').val(rowData.content);
    $('#showMessage').removeClass('hide');
    layer.open({
      type: 1,
      title:'发送消息',
      scrollbar: false,
      area: ['680px', '400px'],
      content: $('#showMessage')
    });
    $.post(ctx+'/message/setReadMessage',{id:id},function(date){

    })
  }
  function deleteMessage(obj){
    var id=$(obj).attr('id');

    $.post(ctx+'/message/deleteMessage',{id:id},function(date){
      if('success'==date.msg){
        layer.msg('删除成功',{icon:1,time:1000});
      }
      else{
        layer.msg('删除失败',{icon:2,time:1000});
      }

    })
  }
</script>
</body>
</html>
