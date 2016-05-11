<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/3/23
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>查看题库</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  题库管理
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">${courseName}
        <input type="hidden" value="${courseId}" id="courseId">
    </a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="#">题库管理</a>
    </li>
  </ul>
</div>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>分类列表
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
              <a class="btn green" id="addQuestion">
                <i class="fa fa-plus"></i> 新增试题                                    </a>

              <a id="questionBank" class="btn default">
                <i class="fa fa-plus  fa-lg"></i> 新增分类                                    </a>

              <a href="#delete" class="btn default"><i class="fa fa-trash-o fa-lg"></i> 删除试题</a>

            </div>
          </div>
          <div class="col-md-6">
            <div class="btn-group pull-right">
              <div id="sample_1_filter" class="dataTables_filter">
                <label>
                  <input type="search" class="form-control input-small input-inline" placeholder="搜索"></label>
              </div>
            </div>
          </div>
        </div>
      </div>
      <table class="table table-bordered" id="questionBankTable">
        <thead>
        <tr>
          <th>分类名称</th>
          <th>分类描述</th>

          <th>操作</th>

        </tr>
        </thead>
      </table>

    </div>
  </div>


</div>

<div>
  <div id="question" class="hide" style="width: 600px;">
    <form class="form-horizontal" role="form" method="post" >
      <div class="form-group"></div>
      <div class="form-group"></div>
      <div class="form-group">
        <label for="name" class="col-sm-3 control-label">分类名称：</label>
        <div class="col-sm-5">
          <input type="text" class="form-control validate[required,minSize[6],maxSize[20]" id="name" name="name">
        </div>
      </div>
      <div class="form-group">
        <label for="description" class="col-sm-3 control-label">分类描述：</label>
        <div class="col-sm-5">
          <textarea rows="4" cols="40" id="description" name="description" class="form-control validate[required]" name="content"></textarea>


        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-4">
          <input type="reset" id="questionBankReset" class="btn btn-default" value="清除">
          <input type="button" id="questionBankSubmit" class="btn btn-default col-sm-offset-1" value="提交">
        </div>
      </div>

    </form>
  </div>

</div>
<script language="JavaScript">
  var ctx='${ctx}';
  $(function(){
    layer.use('extend/layer.ext.js', function(){
      layer.ext = function(){
        layer.prompt({})
      };
      layer.ext = function(){
        layer.open({})
      };
    });
    $('#addQuestion').click(function(){
      location=location.href+'/addQuestion';
    });
    $.post(ctx+'/teacher/'+$('#courseId').val()+'/listQuestionBank',function(date){
      layer.load();
      $.each(date,function(i,val){
        $('#questionBankTable').append("<tr><td>"+val.name+"</td><td>"+val.description+
        "</td><td><a class='btn btn-sm blue btn-circle' href='"+
        ctx+'/teacher/'+$('#courseId').val()+'/questionBank/'+val.id+"'>详细</a></td></tr>");
      });

    });
    $.post(ctx+'/teacher/'+$('#courseId').val()+'/listPaper',function(date){
      layer.load();
      $.each(date,function(i,val){
        $('#paperTable').append("<tr><td>"+val.name+"</td><td>"+val.description+
        "</td><td>"+val.type+"</td><td>"+val.count+"</td><td>"+val.difficulty+"</td><td><a href='"+
        ctx+'/teacher/'+$('#courseId').val()+'/paper/'+val.id+"'>详细</a></td></tr>");
      });
      window.setTimeout(function(){
        layer.closeAll();
      },2000);
    });
    $('#questionBank').click(function(){
      $('#question').removeClass('hide');
      layer.open({
        title: '创建分类',
        type: 1,
        area: ['620px', '300px'], //宽高
        skin: 'layui-layer-demo', //样式类名
        closeBtn: 2, //显示关闭按钮
        shade: false,
        scrollbar: false,
        content: $('#question'),
        cancel: function(index){}
      });

      });

    $('#questionBankSubmit').click(function(){
      $.post(ctx+'/teacher/'+$('#courseId').val()+'/questionBank',{name:$('#name').val(),description:$('#description').val()},
      function(date){
        if('success'==date.msg){
          layer.msg('成功',{icon:1,time:2000});
        }
        else{
          layer.msg('失败',{icon:2,time:2000});
        }
        window.setTimeout(function(){
          layer.closeAll();
          $('#questionBankReset').click();
        },2000);


      });
    });



  })
</script>
</body>

</html>
