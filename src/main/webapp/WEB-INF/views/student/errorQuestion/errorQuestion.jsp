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
    <title>错题管理</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <link rel="stylesheet" href="${ctx}/static/js/star-rating/css/star-rating.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
  <script src="${ctx}/static/js/star-rating/js/star-rating.js"></script>
  <script src="${ctx}/static/mywebsite/common/common.js"></script>
</head>
<body>
<h3 class="page-title">
  错题管理
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">错题管理</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <a href="#">课程名称：${course.name}</a>

    </li>
  </ul>
</div>
<div class="portlet box blue">
  <div class="portlet-title">
    <div class="caption">
      <i class="fa fa-cogs"></i>查看所有错题
    </div>
    <div class="tools">
      <a href="javascript:;" class="collapse">
      </a>
    </div>
  </div>
  <div class="portlet-body">
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
          <form class="form-horizontal" role="form" method="post">
            <div class="form-group">
              <div class="col-sm-10">
                <table class="table table-bordered">
                  <caption>选择题列表</caption>
                  <c:forEach var="singleQuestion" items="${errorSingleQuestions}" varStatus="status">
                    <tr>
                      <td style="padding-left: 20px">
                        <div class="form-group">
                          <label><h4><b>${status.index+1}、</b>${singleQuestion.content}</h4></label>
                          <div class="radio-list">
                            <label>
                        <span>
                            <input type="radio" name="${singleQuestion.id}" value="1">
                        </span>A.${singleQuestion.a}
                            </label>
                            <label>
                        <span><input type="radio" name="${singleQuestion.id}" value="2">
                          </span>B.${singleQuestion.b}
                            </label>
                            <label>
                        <span><input type="radio" name="${singleQuestion.id}" value="3">
                        </span>C.${singleQuestion.c}
                            </label>
                            <label>
                       <span><input type="radio" name="${singleQuestion.id}" value="4">
                       </span>D.${singleQuestion.d}
                            </label>
                          </div>
                        </div>
                        <div class="form-group">
                          <label>难度：</label><input type="number" class="rating" step="0.5" data-size="xs" readonly
                                                   value="${singleQuestion.difficulty}"></li>
                        </div>
                        <div class="form-group">
                          <label>答案：</label>
                          <label>
                            <script language="JavaScript">
                              document.write(getSingleQuestionAnswer(${singleQuestion.answer}));
                            </script>

                          </label>
                        </div>
                        <div class="form-group">
                          <label>解释：</label>${singleQuestion.explains}
                        </div>

                      </td>
                      <td><input type="button" class="btn btn-sm blue btn-circle" value="删除"
                                 onclick="deleteSingleQuestion('${singleQuestion.id}')">
                        </td>


                    </tr>
                  </c:forEach>
                </table>
              </div>
            </div>
          </form>
        </div>

      </div>
      <div class="tab-pane fade" id="tfQuestion">
        <div>
          <div class="col-sm-12">
            <table class="table table-bordered">
              <caption>判断题列表</caption>
              <c:forEach var="tfQuestion" items="${tfQuestions}" varStatus="status">

                <tr>
                  <td style="padding-left: 20px">
                    <div class="form-group">
                      <label><h4><b>${status.index+1}、</b>${tfQuestion.content}</h4></label>
                      <div class="radio-list">
                        <label>
                        <span>
                            <input type="radio" name="${tfQuestion.id}" value="1">
                        </span> A.对
                        </label>
                        <label>
                        <span><input type="radio" name="${tfQuestion.id}" value="2">
                          </span>B.错
                        </label>
                      </div>
                    </div>

                    <div class="form-group">
                      <label>难度：</label><input type="number" class="rating" step="0.5" data-size="xs" readonly
                                               value="${tfQuestion.difficulty}"></li>
                    </div>
                    <div class="form-group">
                      <label>答案：</label>
                      <label>
                        <script language="JavaScript">
                          document.write(getTfQuestionAnswer(${tfQuestion.answer}));
                        </script>

                      </label>
                    </div>
                    <div class="form-group">
                      <label>解释：</label>${tfQuestion.explains}
                    </div>


                  </td>
                  <td>
                    <input type="button" class="btn btn-sm blue btn-circle" value="删除"
                           onclick="deleteSingleQuestion('${singleQuestion.id}')">
                  </td>

                </tr>
              </c:forEach>

            </table>
          </div>
        </div>

      </div>
      <div class="tab-pane fade in active" id="multipleQuestion"></div>
      <div class="tab-pane fade in active" id="completeQuestion"></div>
      <div class="tab-pane fade in active" id="shortAnswerQuestion"></div>
    </div>
  </div>
</div>


<script language="JavaScript">
  var ctx='${ctx}';
  function deleteSingleQuestion(id){

  }

</script>
</body>

</html>
