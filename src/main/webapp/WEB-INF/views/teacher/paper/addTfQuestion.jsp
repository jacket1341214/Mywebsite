<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/5
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
  <title>题目添加</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <link rel="stylesheet" href="${ctx}/static/js/star-rating/css/star-rating.css">
  <script src="${ctx}/static/js/star-rating/js/star-rating.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<%--课程管理开始--%>
<div style="margin: auto auto auto auto">
  <%--左侧--%>
  <div style="width: 20%;margin-left: 4.5%;float: left;background: red">
    <c:forEach var="item" items="${questionBanks}">
      <ul>
          <%--<li>题库ID：${questionBank.id}</li>--%>
        <li>题库名称：${item.name}</li>
        <li>题库描述：${item.description}</li>
      </ul>
    </c:forEach>
  </div>
  <%--右侧--%>
  <div style="width: 70%;margin-right: 4.5%;float: right;background: white">
    <ul id="myTab" class="nav nav-tabs">
      <li class="active">
        <a href="#tfQuestion" data-toggle="tab">
          选择题
        </a>
      </li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade in active" id="tfQuestion">
        <div>
        <div>
          <table class="table table-bordered">
            <caption>选择题列表</caption>
            <c:forEach var="item" items="${tfQuestions}" varStatus="status">
              <tr>
                <td><input type="checkbox" value="${item.id}"></td>
                <td>
                  <h4><b>${status.index+1}、</b>${item.content}</h4>

                  <ul>
                    <li><input type="radio" value="1" name="${item.id}"><label>   A.对</label></li>
                    <li><input type="radio" value="2" name="${item.id}"><label>   B.错</label></li>

                  </ul>
                  <ul>
                    <li><label>难度：</label><input type="number" class="rating" step="0.5" data-size="xs" readonly
                                                 value="${item.difficulty}"></li>
                    <li><label>答案：</label>
                      <label>
                        <c:if test="${item.answer==1}">
                          对
                        </c:if>
                        <c:if test="${item.answer==2}">
                          错
                        </c:if>

                      </label></li>
                    <li><label>解释：</label>${item.explains}</li>
                    <li><label>创建时间：</label>
                      <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </li>
                    <li><label>修改时间：</label>
                      <fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </li>
                  </ul>
                </td>


              </tr>
            </c:forEach>

          </table>
        </div>

      </div>

    </div>
  </div>
</div>
<%--课程管理结束--%>
<script language="JavaScript">
  $(function(){
    $('#add').click(function(){
      var ids= $.map($("input[type='checkbox']:checked"),function(item,index){
        return $(item).val();
      });

      $.post(location.href,{ids:ids},function(date){
        if('success'==date.msg){
          layer.msg('成功',{icon:1,time:2000});
        }
        else{
          layer.msg('失败',{icon:2,time:2000});
        }
      });
    })
  })
</script>
</body>
</html>
