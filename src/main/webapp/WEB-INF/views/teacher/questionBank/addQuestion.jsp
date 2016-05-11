<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/22
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>添加试题</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <link rel="stylesheet" href="${ctx}/static/js/star-rating/css/star-rating.css">
  <link rel="stylesheet" href="${ctx}/static/js/jquery-Validation/css/validationEngine.jquery.css">

  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
  <script src="${ctx}/static/js/star-rating/js/star-rating.js"></script>
</head>
<body>
<h3 class="page-title">
  题库管理
</h3>
<div class="alert alert-success hide" id="success">
  <strong>添加成功!</strong>
</div>
<div class="alert alert-danger hide" id="failed">
  <strong>添加失败!</strong>
</div>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">${courseName}
      </a>
      <input type="hidden" value="${courseId}" id="courseId">
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="#">题库管理</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="#">添加试题</a>
    </li>
  </ul>
</div>
<div class="portlet box blue tabbable">
  <div class="portlet-title">
    <div class="caption">
      <i class="fa fa-gift"></i>添加试题
    </div>
  </div>
  <div class="portlet-body">
      <ul class="nav nav-pills">
        <li>&nbsp;</li>
        <li class="active">
          <a href="#question1" data-toggle="tab">
            单选题 </a>
        </li>
        <li>
          <a href="#question2" data-toggle="tab">
            多选题 </a>
        </li>
        <li>
          <a href="#question3" data-toggle="tab">
            判断题 </a>
        </li>
        <li>
          <a href="#question4" data-toggle="tab">
            填空题 </a>
        </li>
        <li>
          <a href="#question5" data-toggle="tab">
            简答题 </a>
        </li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane" id="question2">
          <form class="form-horizontal" role="form" method="post" id="multipleQuestionForm">
          <div class="form-group" style="margin-left: 10px">
            <h2>试题</h2>
            <textarea rows="5" cols="40" class="validate[required,maxSize[200]]" name="content"></textarea>

          </div>
          <div class="form-group" style="margin-left: 10px">
            <h2>答案选项</h2>
          </div>

          <div class="form-group" style="margin-left: 10px">
            <div class="answer_heading">
              <h5>(A)</h5>
              <textarea rows="5" cols="40" name="A"></textarea>
            </div>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <div class="answer_heading">
              <h5>(B)</h5>
              <textarea rows="5" cols="40" name="B"></textarea>
            </div>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <div class="answer_heading">
              <h5>(C)</h5>
              <textarea rows="5" cols="40" name="C"></textarea>
            </div>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <div class="answer_heading">
              <h5>(D)</h5>
              <textarea rows="5" cols="40" name="D"></textarea>
            </div>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <div class="answer_heading">
              <h5>(E)</h5>
              <textarea rows="5" cols="40" name="E" placeholder="可不填"></textarea>
            </div>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <div class="answer_heading">
              <h5>(F)</h5>
              <textarea rows="5" cols="40" name="F" placeholder="可不填"></textarea>
            </div>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <h5>难易度</h5>

            <input type="number" class="rating form-control validate[required,minSize[6],maxSize[20]]"
                   data-size="md" step="0.5" min="0" max="5" value="1" name="difficulty">

          </div>
          <div class="form-group" style="margin-left: 10px">
            <div>
              <h5>正确答案</h5>
              <input type="hidden" name="answer">
              <label class="btn btn-circle btn-default"><input type="checkbox"  value="1">(A)</label>
              <label class="btn btn-circle btn-default"><input type="checkbox"  value="2">(B)</label>
              <label class="btn btn-circle btn-default"><input type="checkbox"  value="3">(C)</label>
              <label class="btn btn-circle btn-default"><input type="checkbox"  value="4">(D)</label>
              <label class="btn btn-circle btn-default"><input type="checkbox"  value="5">(E)</label>
              <label class="btn btn-circle btn-default"><input type="checkbox"  value="6">(F)</label>



            </div>

          </div>
          <div class="form-group" style="margin-left: 10px">
              <h5>本题解释</h5>
            <textarea rows="5" cols="40" name="explains"></textarea>
          </div>
          <div class="form-group" style="margin-left: 10px">
              <h5>试题类别</h5>
            <span>
              <select class="form-control selectCategory" name="bankId">
              </select>
            </span>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <a class="btn btn-default btn-sm category"><i class="fa fa-plus-circle"></i>  新建类别</a>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <div>
              <h5>可获得分数</h5>
            </div>
            <input class="form-control" type="number"   value="1" min="1" max="5" name="score">
          </div>
          <div class="form-group" style="margin-left: 10px;">
            <input type="button" value="保存" class="btn btn-primary" id="multipleQuestionSubmit">
          </div>
          <div class="form-group">&nbsp;</div>
          </form>
        </div>
        <div class="tab-pane active" id="question1">
          <form class="form-horizontal" role="form" method="post" id="singleQuestionForm">
          <div class="form-group" style="margin-left: 10px">
            <h2>试题</h2>
            <textarea rows="5" cols="40" name="content" class="validate[required,maxSize[100]]"></textarea>

          </div>
          <div class="form-group" style="margin-left: 10px">
            <h2>答案选项</h2>
          </div>

          <div class="form-group" style="margin-left: 10px">

              <h5>(A)</h5>
              <textarea rows="5" cols="40" name="A" class="validate[required,maxSize[100]]"></textarea>

          </div>
          <div class="form-group" style="margin-left: 10px">
                <h5>(B)</h5>
              <textarea rows="5" cols="40" name="B" class="validate[required,maxSize[100]]"></textarea>

          </div>
          <div class="form-group" style="margin-left: 10px">

              <h5>(C)</h5>
              <textarea rows="5" cols="40" name="C" class="validate[required,maxSize[100]]"></textarea>

          </div>
          <div class="form-group" style="margin-left: 10px">

              <h5>(D)</h5>
              <textarea rows="5" cols="40" name="D" class="validate[required,maxSize[100]]"></textarea>

          </div>
          <div class="form-group" style="margin-left: 10px">
            <h5>难易度</h5>

              <input type="number" class="rating form-control validate[required,min[1],max[5]]"
                     data-size="md" step="0.5" min="0" max="5" value="1" name="difficulty">

          </div>
          <div class="form-group" style="margin-left: 10px">
            <div>
              <h5>正确答案</h5>
              <label class="btn btn-circle btn-default"><input type="checkbox" name="answer" value="1">(A)</label>
              <label class="btn btn-circle btn-default"><input type="checkbox" name="answer" value="2">(B)</label>
              <label class="btn btn-circle btn-default"><input type="checkbox" name="answer" value="3">(C)</label>
              <label class="btn btn-circle btn-default"><input type="checkbox" name="answer" value="4">(D)</label>

            </div>

          </div>

          <div class="form-group" style="margin-left: 10px">
            <h5>本题解释</h5>
            <textarea rows="5" cols="40" name="explains" class="validate[required,maxSize[100]]"></textarea>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <h5>试题类别</h5>
            <span>
              <select class="form-control selectCategory" name="bankId">

              </select>
            </span>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <a class="btn btn-default btn-sm category"><i class="fa fa-plus-circle"></i>  新建类别</a>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <div>
              <h5>可获得分数</h5>
            </div>
            <input class="form-control" type="number"   name="score" value="1" min="1" max="5" >
          </div>
          <div class="form-group" style="margin-left: 10px;">
            <input type="button" id="singleQuestionSubmit" value="保存" class="btn btn-primary">
          </div>
          <div class="form-group">&nbsp;</div>
            </form>
        </div>
        <div class="tab-pane" id="question3">
          <form class="form-horizontal" role="form" method="post" id="tfQuestionForm">
          <div class="form-group" style="margin-left: 10px">
            <h2>试题</h2>
            <textarea rows="5" cols="40" name="content"></textarea>

          </div>
          <div class="form-group" style="margin-left: 10px">
            <h5>难易度</h5>

            <input type="number" class="rating form-control validate[required,minSize[6],maxSize[20]]"
                   data-size="md" step="0.5" min="0" max="5" value="1" name="difficulty">

          </div>
          <div class="form-group" style="margin-left: 10px">
            <div>
              <h5>正确答案</h5>
              <label class="btn btn-circle btn-default"><input type="checkbox" name="answer" value="1">对</label>
              <label class="btn btn-circle btn-default"><input type="checkbox" name="answer" value="2">错</label>
            </div>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <h5>本题解释</h5>
            <textarea rows="5" cols="40" name="explains"></textarea>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <h5>试题类别</h5>
            <span>
              <select class="form-control selectCategory" name="bankId">

              </select>
            </span>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <a class="btn btn-default btn-sm category"><i class="fa fa-plus-circle"></i>  新建类别</a>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <div>
              <h5>可获得分数</h5>
            </div>
            <input class="form-control" type="number"   value="1" min="1" max="5" name="score">
          </div>
          <div class="form-group" style="margin-left: 10px;">
            <input type="button" id="tfQuestionSubmit" value="保存" class="btn btn-primary">
          </div>
          <div class="form-group">&nbsp;</div>
          </form>
        </div>
        <div class="tab-pane" id="question4">
          <form class="form-horizontal" role="form" method="post" id="completeQuestionForm">
            <div class="form-group" style="margin-left: 10px">
              <h2>试题</h2>
              <textarea rows="5" cols="40" name="content"></textarea>

            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>难易度</h5>

              <input type="number" class="rating form-control validate[required,minSize[6],maxSize[20]]"
                     data-size="md" step="0.5" min="0" max="5" value="1" name="difficulty">

            </div>
            <div class="form-group" style="margin-left: 10px">
              <div>
                <h5>正确答案</h5>
                <p class="note note-success">如果你的题含有不止一个空，请以";"隔开,同一个空有几个答案,请以","隔开。。</p>
                <textarea rows="5" cols="40" name="answer"></textarea>

              </div>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>本题解释</h5>
              <textarea rows="5" cols="40" name="explains"></textarea>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>试题类别</h5>
            <span>
              <select class="form-control selectCategory" name="bankId">

              </select>
            </span>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <a class="btn btn-default btn-sm category"><i class="fa fa-plus-circle"></i>  新建类别</a>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <div>
                <h5>可获得分数</h5>
              </div>
              <input class="form-control" type="number"   value="1" min="1" max="5" name="score">
            </div>
            <div class="form-group" style="margin-left: 10px;">
              <input type="button" id="completeQuestionSubmit" value="保存" class="btn btn-primary">
            </div>
            <div class="form-group">&nbsp;</div>
          </form>


        </div>
        <div class="tab-pane" id="question5">
          <form class="form-horizontal" role="form" method="post" id="shortAnswerQuestionForm">
            <div class="form-group" style="margin-left: 10px">
              <h2>试题</h2>
              <textarea rows="5" cols="40" name="content"></textarea>

            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>难易度</h5>

              <input type="number" class="rating form-control validate[required,minSize[6],maxSize[20]]"
                     data-size="md" step="0.5" min="0" max="5" value="1" name="difficulty">

            </div>
            <div class="form-group" style="margin-left: 10px">
              <div>
                <h5>正确答案</h5>
                <p class="note note-success">如果你的题含有不止一个关键字，请以";"隔开,同一个关键字有几个其它选择,请以","隔开。。</p>
                <textarea rows="5" cols="40" name="answer"></textarea>

              </div>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>本题解释</h5>
              <textarea rows="5" cols="40" name="explains"></textarea>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>试题类别</h5>
            <span>
              <select class="form-control selectCategory" name="bankId">

              </select>
            </span>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <a class="btn btn-default btn-sm category"><i class="fa fa-plus-circle"></i>  新建类别</a>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <div>
                <h5>可获得分数</h5>
              </div>
              <input class="form-control" type="number"   value="1" min="1" max="5" name="score">
            </div>
            <div class="form-group" style="margin-left: 10px;">
              <input type="button" id="shortAnswerSubmit" value="保存" class="btn btn-primary">
            </div>
            <div class="form-group">&nbsp;</div>
          </form>

        </div>
      </div>

  </div>
</div>

<div id="question" class="hide" style="width: 600px;">
  <form class="form-horizontal" role="form" method="post" >
    <div class="form-group"></div>
    <div class="form-group"></div>
    <div class="form-group">
      <label for="name" class="col-sm-3 control-label">分类名称：</label>
      <div class="col-sm-4">
        <input type="text" class="form-control validate[required,minSize[6],maxSize[20]" id="name" name="name">
      </div>
    </div>
    <div class="form-group">
      <label for="description" class="col-sm-3 control-label">分类描述：</label>
      <div class="col-sm-4">
        <input type="text" class="form-control validate[required,minSize[6],maxSize[20]]"  id="description" name="description">
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
<script src="${ctx}/static/js/jquery-Validation/js/jquery.validationEngine-zh_CN.js"></script>
<script src="${ctx}/static/js/jquery-Validation/js/jquery.validationEngine.js"></script>
<script language="JavaScript">
  var ctx='${ctx}';
  var msg='${msg}';
  if(''!=msg){
    if('success'==msg){
      $('#success').removeClass('hide');
    }
    else{
      $('#failed').removeClass('hide');
    }
  }
  $(function(){
    html="";
    <c:forEach items="${questionBanks}" var="item">
    html=html+"<option value='${item.id}'>${item.name}</option>";
    </c:forEach>

    $('.selectCategory').each(function(i,item){
      $(this).append(html);
    });
    $('.category').click(function(){
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
      if(''==$('#name').val()){
        layer.tips('分类名称不能为空', '#name');
        return;
      }
      if(''==$('#description').val()){
        layer.tips('分类描述不能为空', '#description');
        return;
      }
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
    $('#multipleQuestionSubmit').click(function(){
      $('#multipleQuestionForm').attr('action',ctx+'/teacher/'+$('#courseId').val()+'/addMultipleQuestion');
      var answer='';
      $('#multipleQuestionForm').find('input[type=checkbox]:checked').each(function(){
        answer=answer+$(this).val();


      });
      $('#multipleQuestionForm').find('input[name=answer]').eq(0).val(answer);

      $('#multipleQuestionForm').submit();
    });
    $('#singleQuestionSubmit').click(function(){
      $('#singleQuestionForm').attr('action',ctx+'/teacher/'+$('#courseId').val()+'/addSingleQuestion');
      $('#singleQuestionForm').submit();
    });
    $('#tfQuestionSubmit').click(function(){
      $('#tfQuestionForm').attr('action',ctx+'/teacher/'+$('#courseId').val()+'/addTfQuestion');
      $('#tfQuestionForm').submit();
    });
    $('#completeQuestionSubmit').click(function(){
      $('#completeQuestionForm').attr('action',ctx+'/teacher/'+$('#courseId').val()+'/addCompleteQuestion');
      $('#completeQuestionForm').submit();
    });
    $('#shortAnswerSubmit').click(function(){
      $('#shortAnswerQuestionForm').attr('action',ctx+'/teacher/'+$('#courseId').val()+'/addShortAnswerQuestion');
      $('#shortAnswerQuestionForm').submit();
    });
  })
  //$('textArea').addClass('validate[required]');
  $('#shortAnswerQuestionForm').validationEngine();
  $('#completeQuestionForm').validationEngine();
  $('#multipleQuestionForm').validationEngine();
  $('#singleQuestionForm').validationEngine();
  $('#tfQuestionForm').validationEngine();
</script>
</body>
</html>
