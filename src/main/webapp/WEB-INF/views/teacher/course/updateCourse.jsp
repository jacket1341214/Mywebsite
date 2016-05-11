<%--
  Created by IntelliJ IDEA.
  User: jacket
  Date: 2016/3/23
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>
<html>
<head>
    <title>更新课程信息</title>
  <link rel="stylesheet" href="${ctx}/static/js/layer/skin/layer.css">
  <script src="${ctx}/static/js/layer/layer.js"></script>
</head>
<body>
<div>
  <div class="portlet box blue">
    <div class="portlet-title">
      <div class="caption">
        <i class="fa fa-cogs"></i>更新课程信息
      </div>
      <div class="tools">
        <a href="javascript:;" class="collapse">
        </a>

      </div>
    </div>
    <div class="portlet-body">
      <form class="form-horizontal" role="form">
        <div class="form-group">
          <label for="name" class="col-sm-4 control-label">课程名：</label>
          <div class="col-sm-5">
            <input type="hidden" id="courseId" value="${course.id}">
            <input type="text" class="form-control validate[required,minSize[6],maxSize[20]"
                   id="name"  value="${course.name}">
          </div>
        </div>
        <div class="form-group">
          <label for="description" class="col-sm-4 control-label">类型：</label>
          <div class="col-sm-5">
            <select class="form-control" name="type" id="type">
              <option value="0" selected>其它</option>
              <option value="1">公共|必修</option>
              <option value="2">公共|选修</option>
              <option value="3">学科基础教育|必修</option>
              <option value="4">学科基础教育|选修</option>
              <option value="5">专业|必修</option>
              <option value="6">专业|选修</option>
              <option value="7">专业|实践</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label for="description" class="col-sm-4 control-label">描述：</label>
          <div class="col-sm-5">
            <input type="text" class="form-control validate[required,minSize[6],maxSize[20]]"
                   id="description" name="description" value="${course.description}">
          </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-4 control-label">状态：</label>
          <div class="col-sm-5">
            <div>
              <c:if test="${course.status==1}">
                <input type="radio"  name="status" value="1" checked>可用
                <input type="radio"  name="status" value="0">不可用
              </c:if>
              <c:if test="${course.status!=1}">
                <input type="radio"  name="status" value="1" >可用
                <input type="radio"  name="status" value="0" checked>不可用
              </c:if>
            </div>

          </div>
        </div>

        <div class="form-group">
          <div class="col-sm-offset-4 col-sm-3">
            <input type="reset" class="btn btn-primary" value="清除">
            <input type="button" id="submitBt" class="btn btn-primary col-sm-offset-1" value="提交"
                    >
          </div>
        </div>

      </form>
    </div>
  </div>

</div>
<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery-1.11.0.min.js"></script>
<script src="${ctx}/static/js/layer/layer.js"></script>
<script language="JavaScript">
  var ctx='${ctx}';
  $('select[name=type]').find('option').eq(${course.type}).attr('selected',true);
  $(function(){
    $('#submitBt').click(function(){
      var postDate={id:$('#courseId').val(),type:$('#type').val(),name:$('#name').val(),
        description:$('#description').val(),status:$('input:checked').val()};
      $.post(ctx+'/teacher/updateCourse',postDate,function(date){
        if('success'==date.msg){
          layer.msg('更新成功',{icon:1,time:2000});
        }
        else{ layer.msg('更新失败',{icon:2,time:2000});
        }
      });
    })

  })


</script>
</body>
</html>
