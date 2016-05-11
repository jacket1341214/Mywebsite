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
  <script src="${ctx}/static/js/layer/layer.js"></script>
    <script src="${ctx}/static/js/star-rating/js/star-rating.js"></script>
    <script src="${ctx}/static/mywebsite/common/common.js"></script>
</head>
<body>
<h3 class="page-title">
  试题管理
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">试卷名称：${paper.name}</a>
    </li>
  </ul>
</div>
<div class="portlet box blue">
  <div class="portlet-title">
    <div class="caption"><i class="fa fa-cogs"></i>试题管理</div>

  </div>
  <div class="portlet-body">
            <div class="table-toolbar">
              <div class="row">
                <div class="col-md-6">
                  <div>
                    <a class="btn green" id="addQuestion">
                      <i class="fa fa-plus"></i> 手动增加试题</a>
                    <a class="btn green" id="randomAddQuestion">
                      <i class="fa fa-plus"></i> 随机增加试题</a>
                  </div>
                </div>

              </div>
            </div>
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
                  <table class="table table-bordered">
                    <caption>选择题列表</caption>
                    <c:forEach var="singleQuestion" items="${singleQuestions}" varStatus="status">
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
                        <td><button class="btn btn-sm blue btn-circle" type="1" onclick="deleted('${singleQuestion.id}',this)">删除</button></td>


                      </tr>
                    </c:forEach>
                  </table>
                </div>

              </div>
              <div class="tab-pane fade" id="tfQuestion">

                <div>
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
                        <td> <button class="btn btn-sm blue btn-circle" type="2" onclick="deleted('${tfQuestion.id}',this)">删除</button></td>

                      </tr>
                    </c:forEach>

                  </table>
                </div>
              </div>
                <div class="tab-pane fade" id="multipleQuestion">
                    <div>
                        <table class="table table-bordered">
                            <caption>多选题列表</caption>
                            <c:forEach var="item" items="${multipleQuestions}" varStatus="status">
                                <tr>
                                    <td style="padding-left: 20px">
                                        <div class="form-group">
                                            <label><h4><b>${status.index+1}、</b>${item.content}</h4></label>
                                            <div class="radio-list">
                                                <label>
                        <span>
                            <input type="radio" name="${item.id}" value="1">
                        </span>A.${item.a}
                                                </label>
                                                <label>
                        <span><input type="radio" name="${item.id}" value="2">
                          </span>B.${item.b}
                                                </label>
                                                <label>
                        <span><input type="radio" name="${item.id}" value="3">
                        </span>C.${item.c}
                                                </label>
                                                <label>
                       <span><input type="radio" name="${item.id}" value="4">
                       </span>D.${item.d}
                                                </label>
                                                <c:if test="${item.e!=''}">
                                                    <label>
                       <span><input type="radio" name="${item.id}" value="5">
                       </span>E.${item.e}
                                                    </label>
                                                </c:if>
                                                <c:if test="${item.f!=''}">
                                                    <label>
                       <span><input type="radio" name="${item.id}" value="6">
                       </span>F.${item.f}
                                                    </label>
                                                </c:if>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label>难度：</label><input type="number" class="rating" step="0.5" data-size="xs" readonly
                                                                     value="${item.difficulty}"></li>
                                        </div>
                                        <div class="form-group">
                                            <label>答案：</label>
                                            <label>

                                                <script language="JavaScript">

                                                    document.write(getMultipleQuestionAnswer('${item.answer}'));
                                                </script>

                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>解释：</label>${item.explains}
                                        </div>


                                    </td>
                                    <td> <button class="btn btn-sm blue btn-circle" type="3" onclick="deleted('${item.id}',this)">删除</button></td>


                                </tr>
                            </c:forEach>

                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="completeQuestion">
                    <div>
                        <table class="table table-bordered">
                            <caption>填空题列表</caption>
                            <c:forEach var="item" items="${completeQuestions}" varStatus="status">
                                <tr>
                                    <td style="padding-left: 20px">
                                        <div class="form-group">
                                            <label><h4><b>${status.index+1}、</b>${item.content}</h4></label>

                                        </div>

                                        <div class="form-group">
                                            <label>难度：</label><input type="number" class="rating" step="0.5" data-size="xs" readonly
                                                                     value="${item.difficulty}"></li>
                                        </div>
                                        <div class="form-group">
                                            <label>答案：${item.answer}</label>
                                            <label>
                                                    <%--<script language="JavaScript">--%>
                                                    <%--document.write(getTfQuestionAnswer());--%>
                                                    <%--</script>--%>

                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>解释：</label>${item.explains}
                                        </div>


                                    </td>
                                    <td> <button class="btn btn-sm blue btn-circle" type="4" onclick="deleted('${item.id}',this)">删除</button></td>


                                </tr>
                            </c:forEach>

                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="shortAnswerQuestion">
                    <div>
                        <table class="table table-bordered">
                            <caption>简答题列表</caption>
                            <c:forEach var="item" items="${shortAnswerQuestions}" varStatus="status">
                                <tr>
                                    <td style="padding-left: 20px">
                                        <div class="form-group">
                                            <label><h4><b>${status.index+1}、</b>${item.content}</h4></label>

                                        </div>

                                        <div class="form-group">
                                            <label>难度：</label><input type="number" class="rating" step="0.5" data-size="xs" readonly
                                                                     value="${item.difficulty}"></li>
                                        </div>
                                        <div class="form-group">
                                            <label>答案：${item.answer}</label>
                                            <label>
                                                    <%--<script language="JavaScript">--%>
                                                    <%--document.write(getTfQuestionAnswer());--%>
                                                    <%--</script>--%>

                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>解释：</label>${item.explains}
                                        </div>


                                    </td>
                                    <td> <button class="btn btn-sm blue btn-circle" type="5" onclick="deleted('${item.id}',this)">删除</button></td>


                                </tr>
                            </c:forEach>

                        </table>
                    </div>
                </div>
            </div>
  </div>
</div>
<script language="JavaScript">
    function deleted(id,obj){

        $.post(location.href+'/deleteQuestion',{type:$(obj).attr('type'),id:id},function(date){
            if('success'==date.msg){
                layer.msg('更新成功',{icon:1,time:2000});
                $(obj).parent().parent().remove();
            }
            else{ layer.msg('更新失败',{icon:2,time:2000});
            }
        })
    }
  $(function(){
    $('#addQuestion').click(function(){
      window.open(location.href+'/addQuestion');
    });
     $('#randomAddQuestion').click(function(){
          window.open(location.href+'/randomAddQuestion');
      });
  })
</script>
</body>
</html>
