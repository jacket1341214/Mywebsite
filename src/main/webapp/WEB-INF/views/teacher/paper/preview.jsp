<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/30
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>

<html>
<head>
    <title>预览试卷</title>
</head>
<body>
<script language="JavaScript">
    var a=['一、','二、','三、','四、','五、'];
    var index=0;
</script>
<div style="background: white">
  <table class="table table-bordered">
      <caption><h3><b>${paperName}</b></h3></caption>
      <c:if test="${singleQuestions.size()!=0}">
      <tr><td style="padding-left: 20px">
          <h3><b>
              <script language="JavaScript">
              document.write(a[index]+'选择题');
                  index++;
              </script>
             </b></h3>
      </td></tr>
      </c:if>

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


        </td>


      </tr>
    </c:forEach>
      <c:if test="${tfQuestions.size()!=0}">
          <tr><td style="padding-left: 20px">
              <h3><b>
                  <script language="JavaScript">
                      document.write(a[index]+'判断题');
                      index++;
                  </script>
              </b></h3>
          </td></tr>
      </c:if>
    <c:forEach var="tfQuestion" items="${tfQuestions}" varStatus="status">
      <tr>
        <td style="padding-left: 20px">
          <div class="form-group">
            <label><h4><b>${status.index+1+singleQuestions.size()}、</b>${tfQuestion.content}</h4></label>
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
        </td>
      </tr>
    </c:forEach>
      <c:if test="${multipleQuestions.size()!=0}">
          <tr><td style="padding-left: 20px">
              <h3><b>
                  <script language="JavaScript">
                      document.write(a[index]+'多选题');
                      index++;
                  </script>
              </b></h3>
          </td></tr>
      </c:if>
    <c:forEach var="item" items="${multipleQuestions}" varStatus="status">
      <tr>
        <td style="padding-left: 20px">
          <div class="form-group">
            <label><h4><b>${status.index+1+singleQuestions.size()+tfQuestions.size()}、</b>${item.content}</h4></label>
            <div class="radio-list">
              <label>
                        <span>
                            <input type="checkbox" name="${item.id}" value="1">
                        </span>A.${item.a}
              </label>
              <label>
                        <span><input type="checkbox" name="${item.id}" value="2">
                          </span>B.${item.b}
              </label>
              <label>
                        <span><input type="checkbox" name="${item.id}" value="3">
                        </span>C.${item.c}
              </label>
              <label>
                       <span><input type="checkbox" name="${item.id}" value="4">
                       </span>D.${item.d}
              </label>
                <c:if test="${item.e!=''}">
                    <label>
                       <span><input type="checkbox" name="${item.id}" value="5">
                       </span>E.${item.e}
                    </label>
                </c:if>
                <c:if test="${item.f!=''}">
                    <label>
                       <span><input type="checkbox" name="${item.id}" value="6">
                       </span>F.${item.f}
                    </label>
                </c:if>
            </div>
          </div>



        </td>

      </tr>
    </c:forEach>
      <c:if test="${completeQuestions.size()!=0}">
          <tr><td style="padding-left: 20px">
              <h3><b>
                  <script language="JavaScript">
                      document.write(a[index]+'填空题');
                      index++;
                  </script>
              </b></h3>
          </td></tr>
      </c:if>

    <c:forEach var="item" items="${completeQuestions}" varStatus="status">
      <tr>
        <td style="padding-left: 20px">
          <div class="form-group">
            <label><h4><b>${status.index+1+singleQuestions.size()+tfQuestions.size()
            +multipleQuestions.size()}、</b>${item.content}</h4></label>

          </div>
            <div class="form-group">
                <textarea rows="5" cols="120" name="answer"></textarea>
            </div>



        </td>

      </tr>
    </c:forEach>
      <c:if test="${shortAnswerQuestions.size()!=0}">
          <tr><td style="padding-left: 20px">
              <h3><b>
                  <script language="JavaScript">
                      document.write(a[index]+'简答题');
                      index++;
                  </script>
              </b></h3>
          </td></tr>
      </c:if>

    <c:forEach var="item" items="${shortAnswerQuestions}" varStatus="status">
      <tr>
        <td style="padding-left: 20px">
          <div class="form-group">
            <label><h4><b>${status.index+1+singleQuestions.size()+tfQuestions.size()
              +multipleQuestions.size()+completeQuestions.size()}、</b>${item.content}</h4></label>

          </div>
            <div class="form-group">
                <textarea rows="5" cols="120" name="answer"></textarea>
            </div>



        </td>


      </tr>
    </c:forEach>




  </table>
  <input type="button" class="btn btn-primary" id="submitPaper" value="提交试卷">
</div>
</body>
</html>
