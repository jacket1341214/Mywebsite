<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/6
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>考试管理</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  考试管理
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">${courseName}</a>
      <input id="courseId" type="hidden" value="${courseId}">
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="#">试卷管理</a>
    </li>
  </ul>
</div>
<div class="portlet box blue">
  <div class="portlet-title">
    <div class="caption">
      <i class="fa fa-cogs"></i>试卷管理
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
            <a class="btn green" id="addPaper">
              <i class="fa fa-plus"></i> 新增试卷                                    </a>
          </div>
        </div>

      </div>
    </div>
    <table class="table table-bordered" id="paperTable">

      <tr>
        <th>试卷名称</th>
        <th>试卷描述</th>
        <th>试卷状态</th>
        <th>题目数量</th>
        <th>总难易度</th>
        <th>操作</th>

      </tr>
      </thead>

    </table>
  </div>
</div>


<div id="paper" class="hide" style="width: 600px">
  <form class="form-horizontal" role="form" method="post" >
    <div class="form-group"></div>
    <div class="form-group"></div>
    <div class="form-group">
      <label for="paperName" class="col-sm-3 control-label">试卷名：</label>
      <div class="col-sm-7">
        <input type="text" class="form-control validate[required,minSize[6],maxSize[50]" id="paperName">


      </div>
    </div>
    <div class="form-group">
      <label for="paperDescription" class="col-sm-3 control-label">描述：</label>
      <div class="col-sm-7">

      <textarea rows="4" class="form-control validate[required,minSize[6],maxSize[200]]"  id="paperDescription"></textarea>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-3 col-sm-4">
        <input type="reset" id="paperReset" class="btn btn-primary" value="清除">
        <input type="button" id="paperSubmit" class="btn btn-primary col-sm-offset-1" value="提交">
      </div>
    </div>

  </form>
</div>
<a></a>
<script language="JavaScript">
  var ctx='${ctx}';
  $(function(){
//    $('#paperTable').append(showDetail);
    $('#listPaper').click(function(){
      location.href=ctx+'/exam/'+$('#courseId').val();
    });
    $('#paperStatus').click(function(){
      location.href=ctx+'/exam/'+$('#courseId').val()+"/paperStatus";
    });
    $.post(ctx+'/teacher/'+$('#courseId').val()+'/listPaper',function(date){
      layer.load();
      $.each(date,function(i,val){
        $('#paperTable').append("<tr><td>"+val.name+"</td><td>"+val.description+
        "</td><td>"+val.status+"</td><td>"+val.count+"</td><td>"+val.difficulty+"</td><td><a class='btn btn-sm blue btn-circle' onclick='showDetail(this)' href='"+
        ctx+'/teacher/'+$('#courseId').val()+'/paper/'+val.id+"'>详细</a></td></tr>");
      });
      setTimeout(function(){
        layer.closeAll('loading');
      }, 1000);
    });
    $('#addPaper').click(function(){
      $('#paper').removeClass('hide');
      layer.open({
        title: '创建试卷',
        type: 1,
        area: ['620px', '300px'], //宽高
        skin: 'layui-layer-demo', //样式类名
        closeBtn: 2, //显示关闭按钮
        shade: false,
        scrollbar: false,
        content: $('#paper'),
        cancel: function(index){}
      });



      //parent.layer.close(index);
    });
    $('#paperSubmit').click(function(){
      $.post(ctx+'/teacher/'+$('#courseId').val()+'/addPaper',{name:$('#paperName').val(),description:$('#paperDescription').val()},
              function(date){
                if('success'==date.msg){
                  layer.msg('成功',{icon:1,time:2000});
                }
                else{
                  layer.msg('失败',{icon:2,time:2000});
                }
                window.setTimeout(function(){
                  layer.closeAll();
                  $('#paperReset').click();
                },2000);
              });
    });
  })

//  function showDetail(obj){
//    var html2='<div class="row static-info"><div class="col-md-5">';
//    var html3=' </div><div class="col-md-7">';
//    var html=' <tr> <td colspan="6"> <div class="portlet">'
//            +'<div class="portlet-title"><div class="caption"><a href="#"><i class="fa fa-chevron-circle-up">'
//            +'</i>关闭</a> </div> <div class="actions btn-set">'
//            +'<a class="btn green">试卷详情</a>'
//            +'<a class="btn default">查看考试记录</a>'
//            +'<a class="btn default">编辑</a>'
//            +'<a class="btn default">试题管理</a>'
//            +'<a class="btn default">删除试卷</a>'
//            +'<a class="btn default">预览</a>'
//            +'</div> </div><div class="portlet-body"><div class="row">'
//    +'<div class="col-sm-8 col-sm-offset-2"> <div class="portlet yellow-crusta box">'
//    +'<div class="portlet-title"> <div class="caption">试卷详情</div>'
//    +'</div><div class="portlet-body">'
//    +html2+'试卷名称:'+html3+'0'+'</div></div>'
//    +html2+'试卷描述:'+html3+'0'+'</div></div>'
//            +html2+'题目数量:'+html3+'0'+'</div></div>'
//            +html2+'难度:'+html3+'0'+'</div></div>'
//            +html2+'状态:'+html3+'0'+'</div></div>'
//            +html2+'开始时间:'+html3+'0'+'</div></div>'
//            +html2+'结束时间:'+html3+'0'+'</div></div>'
//            +html2+'创建时间:'+html3+'0'+'</div></div>'
//            +html2+'修改时间:'+html3+'0'+'</div></div>'
//                    +'</div></div></div></div></div></div></td></tr>';
//    return html;
//  }
</script>
</body>
</html>
