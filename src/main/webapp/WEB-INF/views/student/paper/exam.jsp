<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/4
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>开始考试</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
    <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
    <script src="${ctx}/static/mywebsite/common/common.js"></script>
    <script src="${ctx}/static/js/layer/layer.js"></script>
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
          <td style="padding-left: 20px" type="1">
            <div class="form-group">
              <label><h4>
                  <b>${status.index+1}、</b>
              ${singleQuestion.content}
                  (<b><label class="score">${singleQuestion.score}</label></b>分)
              </h4></label>
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

              <div class="form-group hide">
                  <label class="answer">${singleQuestion.answer}</label>
              </div>
              <div class="explain hide">
              <div class="form-group">
                  <label>正确答案：</label>
                  <label>
                      <script language="JavaScript">
                          document.write(getSingleQuestionAnswer(${singleQuestion.answer}));
                      </script>
                  </label>
                  <span class="glyphicon glyphicon-ok hide"></span>
                  <span class="glyphicon glyphicon-remove hide"></span>
              </div>
              <div class="form-group">
                  <label>解释：</label>${singleQuestion.explains}
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
        <td style="padding-left: 20px" type="2">
          <div class="form-group">
            <label><h4><b>${status.index+1+singleQuestions.size()}、</b>${tfQuestion.content}
                (<b><label class="score">${tfQuestion.score}</label></b>分)
            </h4></label>
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
            <div class="form-group hide">
                <label class="answer">${tfQuestion.answer}</label>


            </div>
            <div class="explain hide">
                <div class="form-group">
                    <label>正确答案：</label>
                    <label>
                        <script language="JavaScript">
                            document.write(getTfQuestionAnswer(${tfQuestion.answer}));
                        </script>

                    </label>
                    <span class="glyphicon glyphicon-ok hide"></span>
                    <span class="glyphicon glyphicon-remove hide"></span>
                </div>
                <div class="form-group">
                    <label>解释：</label>${tfQuestion.explains}
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
        <td style="padding-left: 20px" type="3">
          <div class="form-group">
            <label><h4><b>${status.index+1+singleQuestions.size()+tfQuestions.size()}、</b>${item.content}
                (<b><label class="score">${item.score}</label></b>分)
            </h4></label>
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

            <div class="form-group hide">
                <label class="answer">${item.answer}</label>

            </div>
            <div class="explain hide">
                <div class="form-group">
                    <label>正确答案：</label>
                    <label>
                        <script language="JavaScript">
                            document.write(getMultipleQuestionAnswer('${item.answer}'));
                        </script>

                    </label>
                    <span class="glyphicon glyphicon-ok hide"></span>
                    <span class="glyphicon glyphicon-remove hide"></span>
                </div>
                <div class="form-group">
                    <label>解释：</label>${item.explains}
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
        <td style="padding-left: 20px" type="4">
          <div class="form-group">
            <label><h4><b>${status.index+1+singleQuestions.size()+tfQuestions.size()
                    +multipleQuestions.size()}、</b>${item.content}
                (<b><label class="score">${item.score}</label></b>分)
            </h4></label>

          </div>
            <div class="form-group">
                <textarea rows="5" cols="120" name="${item.id}"></textarea>
            </div>
            <div class="form-group hide">
                <label class="answer">${item.answer}</label>

            </div>
            <div class="explain hide">
                <div class="form-group">
                    <label>正确答案：${item.answer}</label>
                    <label>得分：<span class="grade"></span>分</label>
                </div>
                <div class="form-group">
                    <label>解释：</label>${item.explains}
                </div>
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
        <td style="padding-left: 20px" type="5">
          <div class="form-group">
            <label><h4><b>${status.index+1+singleQuestions.size()+tfQuestions.size()
              +multipleQuestions.size()+completeQuestions.size()}、</b>${item.content}
                (<b><label class="score">${item.score}</label></b>分)
            </h4></label>

          </div>
            <div class="form-group">
                <textarea rows="5" cols="120" name="${item.id}"></textarea>
            </div>
            <div class="form-group hide">
                <label class="answer">${item.answer}</label>

            </div>
            <div class="explain hide">
                <div class="form-group">
                    <label>正确答案：${item.answer}</label>
                    <label>得分：<span class="grade"></span>分</label>
                </div>
                <div class="form-group">
                    <label>解释：</label>${item.explains}
                </div>
            </div>
        </td>


      </tr>
    </c:forEach>



  </table>
  <input type="button" class="btn btn-primary" id="submitPaper" value="提交试卷">
</div>
<script language="JavaScript">
  $(function(){
    $('#submitPaper').click(function() {
        var grade=0;
        var answer;
        $('td').each(function(i){
            switch (parseInt($(this).attr('type'))){
                case 1: answer=$(this).find('input[type=radio]:checked');
                    console.log('-----单选题-----');

                    if($(answer).length!=0){

                            if($(this).find('.answer').text()==$(answer).eq(0).val()){
                                grade=grade+parseInt($(this).find('.score').text());
                                $(this).find('.explain').removeClass('hide');
                                $(this).find('.glyphicon-ok').removeClass('hide');
                            }

                            else{
                                addErrorQuestion(1,$(answer).eq(0).attr('name'));
                                $(this).find('.explain').removeClass('hide');
                                $(this).find('.glyphicon-remove').removeClass('hide');
                            }
                        }
                        else{
                            addErrorQuestion(1,$(answer).eq(0).attr('name'));
                            $(this).find('.explain').removeClass('hide');
                            $(this).find('.glyphicon-remove').removeClass('hide');
                        }
                        console.log('第'+i+'题：'+grade);
                    break;

                case 2: answer=$(this).find('input[type=radio]:checked');
                    console.log('-----判断题-----');

                    if($(answer).length!=0){
                        if($(this).find('.answer').text()==$(answer).eq(0).val()){
                            grade=grade+parseInt($(this).find('.score').text());
                            $(this).find('.explain').removeClass('hide');
                            $(this).find('.glyphicon-ok').removeClass('hide');
                        }
                        else{
                            addErrorQuestion(2,$(answer).eq(0).attr('name'));
                            $(this).find('.explain').removeClass('hide');
                            $(this).find('.glyphicon-remove').removeClass('hide');
                        }
                    }
                    else{
                        addErrorQuestion(2,$(answer).eq(0).attr('name'));
                        $(this).find('.explain').removeClass('hide');
                        $(this).find('.glyphicon-remove').removeClass('hide');
                    }

                    console.log('第'+i+'题：'+grade);
                    break;

                case 3: answer=$(this).find('input[type=checkbox]:checked');
                    console.log('-----多选题-----');

                    if($(answer).length!=0){
                        var s='';
                        for(var i=0;i<$(answer).length;i++)
                        s=s+$(answer).eq(i).val();
                        if($(this).find('.answer').text()==s){
                            grade=grade+parseInt($(this).find('.score').text());
                            $(this).find('.explain').removeClass('hide');
                            $(this).find('.glyphicon-remove').removeClass('hide');
                        }

                        else{
                            addErrorQuestion(3,$(answer).eq(0).attr('name'));
                            $(this).find('.explain').removeClass('hide');
                            $(this).find('.glyphicon-remove').removeClass('hide');
                        }
                    }
                    else{
                        addErrorQuestion(3,$(answer).eq(0).attr('name'));
                        $(this).find('.explain').removeClass('hide');
                        $(this).find('.glyphicon-remove').removeClass('hide');
                    }
                    console.log('第'+i+'题：'+grade);
                    break;
                case 4:answer=$(this).find('.answer').text();
                       var arr=answer.split(';');
                        var sum=0;
                    console.log('-----填空题-----');
                    for(var i=0;i<arr.length;i++){
                            console.log(arr[i]);
                           if($(this).find('textarea').val().indexOf(arr[i])>=0){
                               sum=sum+1;
                           }
                        }
                        if(sum!=arr.length){
                            addErrorQuestion(4,$(this).find('.answer').attr('name'));
                        }
                    $(this).find('.explain').removeClass('hide');
                    $(this).find('.explain').find('.grade').text(sum);
                        break;
                case 5:answer=$(this).find('.answer').text();
                    var arr=answer.split(';');
                    var avg=parseInt(Math.ceil(parseInt($(this).find('.score').text())/arr.length));
                    var sum=0;
                    console.log('-----简答题-----');
                    for(var i=0;i<arr.length;i++){
                        console.log(arr[i]);
                        if($(this).find('textarea').val().indexOf(arr[i])>=0){
                            sum=sum+avg;
                        }
                    }
                    if(sum!=parseInt($(this).find('.score').text())){
                        addErrorQuestion(5,$(this).find('.answer').attr('name'));
                    }
                    $(this).find('.explain').removeClass('hide');
                    $(this).find('.explain').find('.grade').text(sum);
                    break;
            }
        });


    })
    })
    function addErrorQuestion(type,id){
        //$.post(location.href+'/addErrorQuestion',{id:id,type:type},function(date){

        //})

    }
</script>
</body>
</html>
