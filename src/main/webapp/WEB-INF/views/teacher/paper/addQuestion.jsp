<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/25
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
  <title>试题管理</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <link rel="stylesheet" href="${ctx}/static/js/star-rating/css/star-rating.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/star-rating/js/star-rating.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  手动添加试题
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">试卷名称：${paper.name}</a>
      <input type="hidden" value="${paper.id}" id="paperId">
    </li>
  </ul>
</div>
<div class="portlet box blue">
  <div class="portlet-title">
    <div class="caption"><i class="fa fa-cogs"></i>手动添加试题</div>

  </div>
  <div class="portlet-body">
    <div class="table-toolbar">
      <div class="row">
        <div class="col-md-6 col-md-offset-10">
          <div>
            <a class="btn green" id="addQuestion">
              <i class="fa fa-plus"></i> 新增试题</a>

          </div>
        </div>
      </div>
    </div>
    <div class="row">
    <div class="col-md-2">
      <ul class="ver-inline-menu tabbable margin-bottom-10">
        <li class="active">
          <a  href="#">
            <i class="fa fa-briefcase"></i> 分类列表 </a>
        </li>
      </ul>
      <ul class="ver-inline-menu tabbable margin-bottom-10" id="questionBank">
        <c:forEach var="item" items="${questionBanks}">
          <li>
            <a  href="#" id="${item.id}">
              <i class="fa fa-group"></i> ${item.name}
            </a>
          </li>
        </c:forEach>
      </ul>
    </div>
    <div class="col-md-10">
    <ul id="myTab" class="nav nav-tabs">
      <li class="active">
        <a href="#singleQuestion" data-toggle="tab">
          选择题
        </a>
      </li>
      <li><a href="#tfQuestion" data-toggle="tab">判断题</a></li>
      <li><a href="#multipleQuestion" data-toggle="tab">多项选择题</a></li>
      <li><a href="#completeQuestion" data-toggle="tab">填空题</a></li>
      <li><a href="#shortAnswerQuestion" data-toggle="tab">简答题</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade in active" id="singleQuestion">
        <div>
          <table class="table table-bordered" id="singleQuestionTable">
            <caption>选择题列表</caption>


          </table>
        </div>

      </div>
      <div class="tab-pane fade" id="tfQuestion">

        <div>
          <table class="table table-bordered" id="tfQuestionTable">
            <caption>判断题列表</caption>


          </table>
        </div>
      </div>
      <div class="tab-pane fade" id="multipleQuestion">
        <div>
          <table class="table table-bordered" id="multipleQuestionTable">
            <caption>多选题列表</caption>

          </table>
        </div>
      </div>
      <div class="tab-pane fade" id="completeQuestion">
        <div>
          <table class="table table-bordered" id="completeQuestionTable">
            <caption>填空题列表</caption>

          </table>
        </div>
      </div>
      <div class="tab-pane fade" id="shortAnswerQuestion">
        <div>
          <table class="table table-bordered" id="shortAnswerQuestionTable">
            <caption>简答题列表</caption>

          </table>
        </div>
      </div>
    </div>
    </div>
    </div>
  </div>
</div>

<script language="JavaScript">
  var ctx='${ctx}';
  function addAllQuestion(type,id){
    var url=new String(location.href).split('/');
    var courseId=url[url.length-5];
    switch(type){
      case 1:$.post(ctx+'/teacher/'+courseId+'/paper/'+$('#paperId').val()+'/addSingleQuestion',
              {id:id},function(date){

              });break;
      case 2:$.post(ctx+'/teacher/'+courseId+'/paper/'+$('#paperId').val()+'/addTfQuestion',
              {id:id},function(date){

              });break;
      case 3:$.post(ctx+'/teacher/'+courseId+'/paper/'+$('#paperId').val()+'/addMultipleQuestion',
              {id:id},function(date){

              });break;
      case 4:$.post(ctx+'/teacher/'+courseId+'/paper/'+$('#paperId').val()+'/addCompleteQuestion',
              {id:id},function(date){
              });break;
      case 5:$.post(ctx+'/teacher/'+courseId+'/paper/'+$('#paperId').val()+'/addShortAnswerQuestion',
              {id:id},function(date){
              });break;
    }

  }
  $(function(){
    $('#addQuestion').click(function(){
      if(0==$('input:checked').length){
         layer.msg('您还没有选择题目',{icon:2,time:2000});
      }
      else{
        $('input[type=checkbox]:checked').each(function(i,val){
          var id=$(this).attr('value').split(':');
          addAllQuestion(parseInt(id[0]),id[1]);
        });
        layer.msg('添加成功',{icon:1,time:2000});
      }

    });
    $('#questionBank>li>a').click(function(){
      $('#questionBank').find('li[class=active]').removeClass('active');
      $(this).parent().addClass('active');
      $('#singleQuestionTable').find('tr').remove();
      $('#tfQuestionTable').find('tr').remove();
      $('#multipleQuestionTable').find('tr').remove();
      $('#completeQuestionTable').find('tr').remove();
      $('#shortAnswerQuestionTable').find('tr').remove();
      $.post(ctx+'/teacher/questionBank/'+$(this).attr('id')+'/listSingleQuestion',function(date){

        $.each(date,function(i,val){
          var tr=$('<tr></tr>');
          var html2=$('<td><input type="checkbox" value="1:'+val.id+'"></td>');
          tr.append(html2);
          var html=$(' <td style="padding-left: 20px"><div class="form-group"><label><h4><b>'+(i+1)+
                  '、</b>'+val.content+'</h4></label> <div class="radio-list">'+
                  '<label><span> <input type="radio" name="'+val.id+'" value="1">'+

                  '</span>A.'+val.a+'</label><label><span><input type="radio" name="'+val.id+'" value="2">'+
                  '</span>B.'+val.b+'</label> <label><span><input type="radio" name="'+val.id+'" value="3">'+
                  '</span>C.'+val.c+'</label> <label><span><input type="radio" name="'+val.id+'" value="4">'+
                  '</span>D.'+val.d+'</label> </div></div> <div class="form-group">'+

                  '<label>难度：'+val.difficulty+'</label></li>'+
                  '</div> <div class="form-group"> <label>答案：</label> <label>'+
                  getSingleQuestionAnswer(val.answer)+
                  '</label></div><div class="form-group"><label>解释：</label>'+val.explains+'</div></td>');
          tr.append(html);
          $('#singleQuestionTable').append(tr);

        })

      });
      $.post(ctx+'/teacher/questionBank/'+$(this).attr('id')+'/listTfQuestion',function(date){

        $.each(date,function(i,val){
          var tr=$('<tr></tr>');
          var html2=$('<td><input type="checkbox" value="2:'+val.id+'"></td>');
          tr.append(html2);
          var html=$('<td style="padding-left: 20px"><div class="form-group"><label><h4><b>'+(i+1)+
          '、</b>'+val.content+'</h4></label> <div class="radio-list">'+
          '<label><span> <input type="radio" name="'+val.id+'" value="1">'+
          '</span>A.对</label><label><span><input type="radio" name="'+val.id+'" value="2">'+
          '</span>B.错</label></div></div> <div class="form-group">'+
          '<label>难度：'+val.difficulty+'</label></li>'+
          '</div> <div class="form-group"> <label>答案：</label> <label>'+
          getTfQuestionAnswer(val.answer)+
          '</label></div><div class="form-group"><label>解释：</label>'+val.explains+'</div></td>');
          tr.append(html);
          $('#tfQuestionTable').append(tr);

        })

      })
      $.post(ctx+'/teacher/questionBank/'+$(this).attr('id')+'/listMultipleQuestion',function(date){

        $.each(date,function(i,val){
          var tr=$('<tr></tr>');
          var html2=$('<td><input type="checkbox" value="3:'+val.id+'"></td>');
          tr.append(html2);
          var html3='';
          var html4='';
          if(''!=val.e){
            html3= '<label><span><input type="radio" name="'+val.id+'" value="5">'+
            '</span>E.'+val.e+'</label> ';
          }
          if(''!=val.f){
            html4= '<label><span><input type="radio" name="'+val.id+'" value="6">'+
            '</span>F.'+val.f+'</label> ';
          }
          var html=$('<td style="padding-left: 20px"><div class="form-group"><label><h4><b>'+(i+1)+
          '、</b>'+val.content+'</h4></label> <div class="radio-list">'+
          '<label><span> <input type="radio" name="'+val.id+'" value="1">'+

          '</span>A.'+val.a+'</label><label><span><input type="radio" name="'+val.id+'" value="2">'+
          '</span>B.'+val.b+'</label> <label><span><input type="radio" name="'+val.id+'" value="3">'+
          '</span>C.'+val.c+'</label> <label><span><input type="radio" name="'+val.id+'" value="4">'+
          '</span>D.'+val.d+'</label> '+html3 + html4+

          '</div></div> <div class="form-group">'+

          '<label>难度：'+val.difficulty+'</label></li>'+
          '</div> <div class="form-group"> <label>答案：</label> <label>'+
          getMultipleQuestionAnswer(val.answer)+
          '</label></div><div class="form-group"><label>解释：</label>'+val.explains+'</div></td>');
          tr.append(html);
          $('#multipleQuestionTable').append(tr);

        })

      })
      $.post(ctx+'/teacher/questionBank/'+$(this).attr('id')+'/listCompleteQuestion',function(date){

        $.each(date,function(i,val){
          var tr=$('<tr></tr>');
          var html2=$('<td><input type="checkbox" value="4:'+val.id+'"></td>');
          tr.append(html2);
          var html=$('<td style="padding-left: 20px"><div class="form-group"><label><h4><b>'+(i+1)+
          '、</b>'+val.content+'</h4></label>'+

          '</div> <div class="form-group">'+
          '<label>难度：'+val.difficulty+'</label></li>'+
          '</div> <div class="form-group"> <label>答案：'+val.answer+'</label> <label>'+

          '</label></div><div class="form-group"><label>解释：</label>'+val.explains+'</div></td>');
          tr.append(html);
          $('#completeQuestionTable').append(tr);

        })

      })
      $.post(ctx+'/teacher/questionBank/'+$(this).attr('id')+'/listShortAnswerQuestion',function(date){

        $.each(date,function(i,val){
          var tr=$('<tr></tr>');
          var html2=$('<td><input type="checkbox" value="5:'+val.id+'"></td>');
          tr.append(html2);
          var html=$('<td style="padding-left: 20px"><div class="form-group"><label><h4><b>'+(i+1)+
          '、</b>'+val.content+'</h4></label> '+

          '</div> <div class="form-group">'+
          '<label>难度：'+val.difficulty+'</label></li>'+
          '</div> <div class="form-group"> <label>答案：'+val.answer+'</label> <label>'+

          '</label></div><div class="form-group"><label>解释：</label>'+val.explains+'</div></td>');
          tr.append(html);
          $('#shortAnswerQuestionTable').append(tr);

        })

      })

    });

  })
</script>
</body>
</html>

