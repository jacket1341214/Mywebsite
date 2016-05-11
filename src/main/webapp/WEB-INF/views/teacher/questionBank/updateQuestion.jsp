<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/5/3
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>更新试题</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <link rel="stylesheet" href="${ctx}/static/js/star-rating/css/star-rating.css">
  <link rel="stylesheet" href="${ctx}/static/js/jquery-Validation/css/validationEngine.jquery.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
  <script src="${ctx}/static/js/star-rating/js/star-rating.js"></script>
  <script src="${ctx}/static/mywebsite/common/common.js"></script>

</head>
<body>
<h3 class="page-title">
  更新试题
</h3>
<div class="alert alert-success hide" id="success">
  <strong>更新成功!</strong>
</div>
<div class="alert alert-danger hide" id="failed">
  <strong>更新失败!</strong>
</div>
<div style="margin: auto auto auto auto">
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>更新试题
      </div>
      <div class="tools">
        <a href="javascript:;" class="collapse">
        </a>

      </div>
    </div>
    <div class="portlet-body">
      <c:choose>
        <c:when test="${type=='1'}">
          <form class="form-horizontal" role="form" method="post" id="singleQuestionForm">
            <div class="form-group" style="margin-left: 10px">
              <h2>试题</h2>
              <textarea rows="5" cols="40" name="content" class="validate[required,maxSize[100]]">${question.content}</textarea>

            </div>
            <div class="form-group" style="margin-left: 10px">
              <h2>答案选项</h2>
            </div>

            <div class="form-group" style="margin-left: 10px">

              <h5>(A)</h5>
              <textarea rows="5" cols="40" name="A" class="validate[required,maxSize[100]]">${question.a}
              </textarea>

            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>(B)</h5>
              <textarea rows="5" cols="40" name="B" class="validate[required,maxSize[100]]">${question.b}
              </textarea>

            </div>
            <div class="form-group" style="margin-left: 10px">

              <h5>(C)</h5>
              <textarea rows="5" cols="40" name="C" class="validate[required,maxSize[100]]">${question.c}
              </textarea>

            </div>
            <div class="form-group" style="margin-left: 10px">

              <h5>(D)</h5>
              <textarea rows="5" cols="40" name="D" class="validate[required,maxSize[100]]">${question.d}
              </textarea>

            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>难易度</h5>

              <input type="number" class="rating form-control validate[required,min[1],max[5]]"
                     data-size="md" step="0.5" min="0" max="5" value="${question.difficulty}" name="difficulty">

            </div>
            <div class="form-group" style="margin-left: 10px">
              <label>答案：</label>
              <label>
                <script language="JavaScript">
                  document.write(getSingleQuestionAnswer(${question.answer}));
                </script>

              </label>

            </div>

            <div class="form-group" style="margin-left: 10px">
              <h5>本题解释</h5>
              <textarea rows="5" cols="40" name="explains" class="validate[required,maxSize[100]]">${question.explains}
              </textarea>
            </div>


            <div class="form-group" style="margin-left: 10px">
              <div>
                <h5>可获得分数</h5>
              </div>
              <input class="form-control" type="number"   name="score" value="${question.score}" min="1" max="5" >
            </div>
            <div class="form-group" style="margin-left: 10px;">
              <input type="submit" value="保存" class="btn btn-primary">
            </div>
            <div class="form-group">&nbsp;</div>
          </form>

        </c:when>
        <c:when test="${type=='2'}">
          <form class="form-horizontal" role="form" method="post" id="tfQuestionForm">
            <div class="form-group" style="margin-left: 10px">
              <h2>试题</h2>
              <textarea rows="5" cols="40" name="content">${question.content}</textarea>

            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>难易度</h5>

              <input type="number" class="rating form-control validate[required,minSize[6],maxSize[20]]"
                     data-size="md" step="0.5" min="0" max="5" value="${question.difficulty}" name="difficulty">

            </div>
            <div class="form-group" style="margin-left: 10px">
              <div>
                <h5>正确答案</h5>
                <label>答案:</label>
                <label>
                  <script language="JavaScript">
                    document.write(getTfQuestionAnswer(${question.answer}));
                  </script>

                </label>
              </div>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>本题解释</h5>
              <textarea rows="5" cols="40" name="explains">${question.explains}
              </textarea>
            </div>


            <div class="form-group" style="margin-left: 10px">
              <div>
                <h5>可获得分数</h5>
              </div>
              <input class="form-control" type="number"   value="${question.score}" min="1" max="5" name="score">
            </div>
            <div class="form-group" style="margin-left: 10px;">
              <input type="button" id="tfQuestionSubmit" value="保存" class="btn btn-primary">
            </div>
            <div class="form-group">&nbsp;</div>
          </form>

        </c:when>
        <c:when test="${type=='3'}">
          <form class="form-horizontal" role="form" method="post" id="multipleQuestionForm">
            <div class="form-group" style="margin-left: 10px">
              <h2>试题</h2>
              <textarea rows="5" cols="40"  name="content">${question.content}</textarea>

            </div>
            <div class="form-group" style="margin-left: 10px">
              <h2>答案选项</h2>
            </div>

            <div class="form-group" style="margin-left: 10px">
              <div class="answer_heading">
                <h5>(A)</h5>
                <textarea rows="5" cols="40" name="A">${question.a}</textarea>
              </div>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <div class="answer_heading">
                <h5>(B)</h5>
                <textarea rows="5" cols="40" name="B">${question.b}</textarea>
              </div>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <div class="answer_heading">
                <h5>(C)</h5>
                <textarea rows="5" cols="40" name="C">${question.c}</textarea>
              </div>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <div class="answer_heading">
                <h5>(D)</h5>
                <textarea rows="5" cols="40" name="D">${question.d}</textarea>
              </div>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <div class="answer_heading">
                <h5>(E)</h5>
                <textarea rows="5" cols="40" name="E" placeholder="可不填">${question.e}</textarea>
              </div>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <div class="answer_heading">
                <h5>(F)</h5>
                <textarea rows="5" cols="40" name="F" placeholder="可不填">${question.f}</textarea>
              </div>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>难易度</h5>

              <input type="number" class="rating form-control validate[required,minSize[6],maxSize[20]]"
                     data-size="md" step="0.5" min="0" max="5" value="${question.difficulty}" name="difficulty">

            </div>
            <div class="form-group" style="margin-left: 10px">
              <div>
                <h5>正确答案</h5>
                <label>
                  <script language="JavaScript">
                    document.write(getMultipleQuestionAnswer(${item.answer}));
                  </script>

                </label>



              </div>

            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>本题解释</h5>
              <textarea rows="5" cols="40" name="explains">${question.explains}</textarea>
            </div>


            <div class="form-group" style="margin-left: 10px">
              <div>
                <h5>可获得分数</h5>
              </div>
              <input class="form-control" type="number"   value="${question.score}" min="1" max="5" name="score">
            </div>
            <div class="form-group" style="margin-left: 10px;">
              <input type="submit" value="保存" class="btn btn-primary">
            </div>
            <div class="form-group">&nbsp;</div>
          </form>

        </c:when>
        <c:when test="${type=='4'}">          <form class="form-horizontal" role="form" method="post" id="completeQuestionForm">
          <div class="form-group" style="margin-left: 10px">
            <h2>试题</h2>
            <textarea rows="5" cols="40" name="content">${question.content}</textarea>

          </div>
          <div class="form-group" style="margin-left: 10px">
            <h5>难易度</h5>

            <input type="number" class="rating form-control validate[required,minSize[6],maxSize[20]]"
                   data-size="md" step="0.5" min="0" max="5" value="${question.difficulty}" name="difficulty">

          </div>
          <div class="form-group" style="margin-left: 10px">
            <div>
              <h5>正确答案</h5>
              <p class="note note-success">如果你的题含有不止一个空，请以";"隔开,同一个空有几个答案,请以","隔开。。</p>
              <textarea rows="5" cols="40" name="answer">${question.answer}</textarea>

            </div>
          </div>
          <div class="form-group" style="margin-left: 10px">
            <h5>本题解释</h5>
            <textarea rows="5" cols="40" name="explains">${question.explains}</textarea>
          </div>


          <div class="form-group" style="margin-left: 10px">
            <div>
              <h5>可获得分数</h5>
            </div>
            <input class="form-control" type="number"   value="${question.score}" min="1" max="5" name="score">
          </div>
          <div class="form-group" style="margin-left: 10px;">
            <input type="submit"  value="保存" class="btn btn-primary">
          </div>
          <div class="form-group">&nbsp;</div>
        </form>
        </c:when>
        <c:when test="${type=='5'}">
          <form class="form-horizontal" role="form" method="post" id="shortAnswerQuestionForm">
            <div class="form-group" style="margin-left: 10px">
              <h2>试题</h2>
              <textarea rows="5" cols="40" name="content">${question.content}</textarea>

            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>难易度</h5>

              <input type="number" class="rating form-control validate[required,minSize[6],maxSize[20]]"
                     data-size="md" step="0.5" min="0" max="5" value="${question.difficulty}" name="difficulty">

            </div>
            <div class="form-group" style="margin-left: 10px">
              <div>
                <h5>正确答案</h5>
                <p class="note note-success">如果你的题含有不止一个关键字，请以";"隔开,同一个关键字有几个其它选择,请以","隔开。。</p>
                <textarea rows="5" cols="40" name="answer">${question.answer}</textarea>

              </div>
            </div>
            <div class="form-group" style="margin-left: 10px">
              <h5>本题解释</h5>
              <textarea rows="5" cols="40" name="explains">${question.explains}</textarea>
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

        </c:when>
        <c:otherwise></c:otherwise>
      </c:choose>

    </div>
  </div>


</div>
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
</script>
</body>
</html>
