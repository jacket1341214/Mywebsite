<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/2
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>试卷管理</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<h3 class="page-title">
  试卷详情
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">试卷名称：${paper.name}</a>
      <input id="paperId" type="hidden" value="${paper.id}">
    </li>
  </ul>
</div>

    <div class="portlet box blue">
      <div class="portlet-title">
        <div class="caption">试卷详情</div>
        <div class="actions btn-set">
          <a class="btn green" id="paperDetail">试卷详情</a>
          <a class="btn default" id="record">查看考试记录</a>
          <a class="btn default" id="edit">编辑</a>
          <a class="btn default" id="questionManage">试题管理</a>
          <a class="btn default" id="delete">删除试卷</a>
          <a class="btn default" id="preview">预览</a>
          <a class="btn default" id="answer">答案卷</a>
        </div>
      </div>
      <div class="portlet-body">
        <div class="row">
          <div class="col-sm-8 col-sm-offset-2">
            <div class="portlet blue box">
              <div class="portlet-title">
              </div>
              <div class="portlet-body">
                <div class="row static-info">
                  <div class="col-md-5">
                    试卷名称:
                  </div>
                  <div class="col-md-7">
                    0                                            </div>
                </div>
                <div class="row static-info">
                  <div class="col-md-5">
                    试卷描述:
                  </div>
                  <div class="col-md-7">
                    0                                            </div>
                </div>
                <div class="row static-info">
                  <div class="col-md-5">
                    题目数量:
                  </div>
                  <div class="col-md-7">
                    0.0%                                            </div>
                </div>
                <div class="row static-info">
                  <div class="col-md-5">
                    难度:
                  </div>
                  <div class="col-md-7">
                    0.0%                                            </div>
                </div>
                <div class="row static-info">
                  <div class="col-md-5">
                    状态:
                  </div>
                  <div class="col-md-7">
                    可用                                           </div>
                </div>
                <div class="row static-info">
                  <div class="col-md-5">
                    开始时间:
                  </div>
                  <div class="col-md-7">
                    0.0%                                            </div>
                </div>
                <div class="row static-info">
                  <div class="col-md-5 ">
                    结束时间:
                  </div>
                  <div class="col-md-7 ">
                    0                                            </div>
                </div>
                <div class="row static-info">
                  <div class="col-md-5 name">
                    创建时间:
                  </div>
                  <div class="col-md-7 value">
                    0.0%                                            </div>
                </div>
                <div class="row static-info">
                  <div class="col-md-5">
                    修改时间:
                  </div>
                  <div class="col-md-7">
                    0.0%                                            </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>


<script language="JavaScript">
  var ctx='${ctx}';
  $(function(){
    $('#add').click(function(){
      window.open(location.href+'/addSingleQuestion');
    });
    $('#add2').click(function(){
      window.open(location.href+'/addTfQuestion');
    });
    $('#paperDetail').click(function(){
      window.open(location.href+'/addTfQuestion');
    });
    $('#record').click(function(){
      var url=new String(location.href).split('/');
      var courseId=url[url.length-3];
      window.open(ctx+'/teacher/student/'+courseId+'/paper/'+$('#paperId').val());
    });
    $('#edit').click(function(){
      window.open(location.href+'/addTfQuestion');
    });
    $('#questionManage').click(function(){
      window.open(location.href+'/questionManage');
    });
    $('#delete').click(function(){
      window.open(location.href+'/addTfQuestion');
    });
    $('#preview').click(function(){
      window.open(location.href+'/preview');
    });
    $('#answer').click(function(){
      window.open(location.href+'/previewAnswer');
    });
  })
</script>
</body>
</html>
