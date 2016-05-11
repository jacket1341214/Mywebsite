<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/4/29
  Time: 13:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>随机组卷</title>
  <script language="JavaScript" src="${ctx}/static/js/jquery/jquery-1.11.2.js"></script>
</head>
<body>
<h3 class="page-title">
  随机组卷
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="#">试卷名称：${paper.name}</a>
      <i class="fa fa-angle-right"></i>
    </li>
  </ul>
</div>
<div class="portlet box blue">
  <div class="portlet-title">
    <div class="caption">
      <i class="fa fa-cogs"></i>随机组卷
    </div>
    <div class="tools">
      <a href="javascript:;" class="collapse">
      </a>
    </div>
  </div>
  <div class="portlet-body">
    <div class="alert alert-success">
      <div class="form-group">
        <label class="col-md-3 control-label">题型选择</label>
        <div class="col-md-9">
          <div class="checkbox-list">
            <label class="checkbox-inline">
                <span><input type="checkbox" value="1"></span>
              选择题
            </label>
            <label class="checkbox-inline">
                <span><input type="checkbox"  value="2"></span>
              判断题 </label>
            <label class="checkbox-inline">
                <span><input type="checkbox"  value="3"></span>
               多项选择题 </label>
            <label class="checkbox-inline">
              <span><input type="checkbox"  value="4"></span>
              填空题 </label>
            <label class="checkbox-inline">
              <span><input type="checkbox"  value="5"></span>
              简答题 </label>
          </div>
        </div>
      </div>
    </div>
    <div class="alert alert-success">
      <div class="form-group">
        <label class="col-md-3 control-label">分类选择</label>
        <div class="col-md-9">
          <div class="checkbox-list">
            <c:forEach var="item" items="${questionBanks}">
              <label class="checkbox-inline">
                <span><input type="checkbox" value="${item.id}"></span>
                  ${item.name}
              </label>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>
    <form action="#" class="form-horizontal">
      <div class="form-body">
        <div class="form-group">
          <label class="col-md-2 control-label">试卷总分值</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="100">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">选择题分值</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="20" id="single">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label"> 判断题分值</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="10" id="tf">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label"> 多项选择题分值</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="20" id="multiple">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">填空题分值</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="10" score="4" id="complete">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label"> 简答题分值</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="40" id="short">
          </div>
        </div>
      </div>
      <div class="form-body">
        <div class="form-group">
          <label class="col-md-2 control-label">试卷总题数</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="39">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">选择题数量</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="10" id="singleCount">
          </div>
        </div>
        <c:forEach var="item" items="${questionBanks}">
          <div class="form-group">
            <label class="col-md-4 control-label"> ${item.name}中数量</label>
            <div class="col-md-4">
              <input type="number" class="form-control" name="${item.id}" flag="1">
            </div>
          </div>
        </c:forEach>
        <div class="form-group">
          <label class="col-md-3 control-label"> 判断题数量</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="10" id="tfCount">
          </div>
        </div>
        <c:forEach var="item" items="${questionBanks}">
          <div class="form-group">
            <label class="col-md-4 control-label"> ${item.name}中数量</label>
            <div class="col-md-4">
              <input type="number" class="form-control" name="${item.id}" flag="2">
            </div>
          </div>
        </c:forEach>
        <div class="form-group">
          <label class="col-md-3 control-label"> 多项选择题数量</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="10" id="multipleCount">
          </div>
        </div>
        <c:forEach var="item" items="${questionBanks}">
          <div class="form-group">
            <label class="col-md-4 control-label"> ${item.name}中数量</label>
            <div class="col-md-4">
              <input type="number" class="form-control" name="${item.id}" flag="3">
            </div>
          </div>
        </c:forEach>
        <div class="form-group">
          <label class="col-md-3 control-label">填空题数量</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="5" id="completeCount">
          </div>
        </div>
        <c:forEach var="item" items="${questionBanks}">
          <div class="form-group">
            <label class="col-md-4 control-label"> ${item.name}中数量</label>
            <div class="col-md-4">
              <input type="number" class="form-control" name="${item.id}" flag="4">
            </div>
          </div>
        </c:forEach>
        <div class="form-group">
          <label class="col-md-3 control-label"> 简答题数量</label>
          <div class="col-md-4">
            <input type="number" class="form-control" value="4" id="shortCount">
          </div>
        </div>
        <c:forEach var="item" items="${questionBanks}">
          <div class="form-group">
            <label class="col-md-4 control-label"> ${item.name}中数量</label>
            <div class="col-md-4">
              <input type="number" class="form-control" name="${item.id}" flag="5">
            </div>
          </div>
        </c:forEach>
      </div>
      <div class="form-actions">
        <div class="row">
          <div class="col-md-offset-3 col-md-9">
            <button type="button" class="btn green" id="formSubmit">提交</button>
            <button type="reset" class="btn default">清除</button>
          </div>
        </div>
      </div>
    </form>

  </div>

</div>
<script language="JavaScript">
  $(function(){
    $('#formSubmit').click(function(){
      var single=$('#single').val()/$('#singleCount').val();
      var tf=$('#tf').val()/$('#tfCount').val();
      var multiple=$('#multiple').val()/$('#multipleCount').val();
      var complete=$('#complete').val()/$('#completeCount').val();
      var short=$('#short').val()/$('#shortCount').val();
      $('input[flag=1]').each(function(i){
        if(''!=$(this).val()){
          var postDate={bankId:$(this).attr('name'),score:single,type:1,count:$(this).val()};
          $.post(location.href,postDate,function(date){})
        }
      });
      $('input[flag=2]').each(function(i){
        if(''!=$(this).val()){
          var postDate={bankId:$(this).attr('name'),score:single,type:2,count:$(this).val()};
          $.post(location.href,postDate,function(date){})
        }
      });
      $('input[flag=3]').each(function(i){
        if(''!=$(this).val()){
          var postDate={bankId:$(this).attr('name'),score:single,type:3,count:$(this).val()};
          $.post(location.href,postDate,function(date){})
        }
      });
      $('input[flag=4]').each(function(i){
        if(''!=$(this).val()){
          var postDate={bankId:$(this).attr('name'),score:single,type:4,count:$(this).val()};
          $.post(location.href,postDate,function(date){})
        }
      });
      $('input[flag=5]').each(function(i){
        if(''!=$(this).val()){
          var postDate={bankId:$(this).attr('name'),score:single,type:5,count:$(this).val()};
          $.post(location.href,postDate,function(date){})
        }
      });

      
    });
  })
</script>
</body>
</html>
