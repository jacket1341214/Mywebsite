
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/base-jsp/taglibs.jsp"%>

<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
  <meta charset="utf-8"/>
  <title><sitemesh:write property='title' /></title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1" name="viewport"/>
  <meta content="" name="description"/>
  <meta content="" name="author"/>
  <!-- BEGIN GLOBAL MANDATORY STYLES -->
  <%--<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>--%>
  <link href="${ctx}/static/js/metronic/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/js/metronic/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/js/metronic/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/js/metronic/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/js/metronic/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
  <!-- END GLOBAL MANDATORY STYLES -->
  <!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
  <link href="${ctx}/static/js/metronic/assets/global/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/js/metronic/assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/js/metronic/assets/global/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
  <!-- END PAGE LEVEL PLUGIN STYLES -->
  <!-- BEGIN PAGE STYLES -->
  <link href="${ctx}/static/js/metronic/assets/admin/pages/css/tasks.css" rel="stylesheet" type="text/css"/>
  <!-- END PAGE STYLES -->
  <!-- BEGIN THEME STYLES -->
  <link href="${ctx}/static/js/metronic/assets/global/css/components.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/js/metronic/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/js/metronic/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/js/metronic/assets/admin/layout/css/themes/darkblue.css" rel="stylesheet" type="text/css" id="style_color"/>
  <link href="${ctx}/static/js/metronic/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
  <!-- END THEME STYLES -->
  <link rel="shortcut icon" href="favicon.ico"/>
  <sitemesh:write property='head' />
</head>

<body class="page-header-fixed page-quick-sidebar-over-content">
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
  <!-- BEGIN HEADER INNER -->
  <div class="page-header-inner">
    <!-- BEGIN LOGO -->
    <div class="page-logo">
      <a href="#">
        基于MVC的网上考试系统的设计和实现
        <%--<img src="${ctx}/static/js/metronic/assets/admin/layout/img/logo.png" alt="logo" class="logo-default"/>--%>
      </a>
      <div class="menu-toggler sidebar-toggler hide">
        <!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
      </div>
    </div>
    <!-- END LOGO -->
    <!-- BEGIN RESPONSIVE MENU TOGGLER -->
    <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
    </a>
    <!-- END RESPONSIVE MENU TOGGLER -->
    <!-- BEGIN TOP NAVIGATION MENU -->
    <div class="top-menu">
      <ul class="nav navbar-nav pull-right">

        <!-- BEGIN INBOX DROPDOWN -->
        <li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
            <i class="icon-envelope-open"></i>
					<span class="badge badge-default" id="messageCount">
					4 </span>
          </a>
          <ul class="dropdown-menu">
            <li>
              <p id="message">

              </p>
            </li>
            <li class="external">
              <a href="${ctx}/message/receive">
                查看所有消息 <i class="m-icon-swapright"></i>
              </a>
            </li>
          </ul>
        </li>
        <!-- END INBOX DROPDOWN -->
        <li>&nbsp;</li>

        <!-- BEGIN USER LOGIN DROPDOWN -->
        <li class="dropdown dropdown-user">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
            <img alt="" class="img-circle" src="${ctx}/static/js/metronic/assets/admin/layout/img/avatar3_small.jpg"/>
					<span class="username username-hide-on-mobile">
					jacket </span>
            <i class="fa fa-angle-down"></i>
          </a>
          <ul class="dropdown-menu">
            <li>
              <a href="${ctx}/user/userInfo">
                <i class="icon-user"></i> 个人信息 </a>
            </li>
            <li>
              <a href="${ctx}/user/loginStatus">
                <i class="icon-user"></i> 登录情况 </a>
            </li>
            <li>
              <a href="${ctx}/user/updatePassword">
                <i class="icon-user"></i> 修改密码 </a>
            </li>

            <li class="divider">
            </li>

            <li>
              <a href="${ctx}/user/logout">
                <i class="icon-key"></i> 退出 </a>
            </li>
          </ul>
        </li>
        <!-- END USER LOGIN DROPDOWN -->
        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>

      </ul>
    </div>
    <!-- END TOP NAVIGATION MENU -->
  </div>
  <!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
  <!-- BEGIN SIDEBAR -->
  <div class="page-sidebar-wrapper">
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
      <!-- BEGIN SIDEBAR MENU -->
      <ul class="page-sidebar-menu page-sidebar-menu-light page-sidebar-menu-hover-submenu" data-auto-scroll="true" data-slide-speed="200">
        <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
        <li class="sidebar-toggler-wrapper">
          <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
          <div class="sidebar-toggler">
          </div>
          <!-- END SIDEBAR TOGGLER BUTTON -->
        </li>

        <li>
          <a href="javascript:;">
            <i class="icon-home"></i>
            <span class="title">课程管理</span>
            <span class="selected"></span>
            <span class="arrow open"></span>
          </a>
          <ul class="sub-menu">
            <li>
              <a href="${ctx}/student/chooseCourse">
                <i class="icon-bar-chart"></i>
                选择课程</a>
            </li>
            <li>
              <a href="${ctx}/student/viewCourse">
                <i class="icon-bulb"></i>
                查看已选课程</a>
            </li>

          </ul>
        </li>
        <li>
          <a href="javascript:;">
            <i class="icon-basket"></i>
            <span class="title">考试管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu" id="studentCourse">
          </ul>
        </li>
        <li>
          <a href="javascript:;">
            <i class="icon-rocket"></i>
            <span class="title">错题管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu" id="errorAnswer">


          </ul>
        </li>
        <!-- BEGIN FRONTEND THEME LINKS -->
        <li>
          <a href="javascript:;">
            <i class="icon-star"></i>
					<span class="title">
					成绩查询 </span>
					<span class="arrow">
					</span>
          </a>
          <ul class="sub-menu" id="grade">

          </ul>
        </li>
        <!-- END FRONTEND THEME LINKS -->
        <li>
          <a href="javascript:;">
            <i class="icon-diamond"></i>
            <span class="title">课程管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu">
            <li>
              <a href="${ctx}/teacher/createCourse">
                创建课程</a>
            </li>
            <li>
              <a href="${ctx}/teacher/viewCourse">
               查看课程</a>
            </li>

          </ul>

        </li>
        <li>
          <a href="javascript:;">
            <i class="icon-puzzle"></i>
            <span class="title">题库管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu" id="course">

          </ul>
        </li>
        <li>
          <a href="javascript:;">
            <i class="icon-settings"></i>
            <span class="title">考试管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu" id="exam">

          </ul>
        </li>
        <li>
          <a href="javascript:;">
            <i class="icon-logout"></i>
            <span class="title">考生管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu" id="student">
          </ul>
        </li>
        <li>
          <a href="${ctx}/admin/listUser">
            <i class="icon-envelope-open"></i>
            <span class="title">用户权限管理</span>
            <span class="arrow "></span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="icon-envelope-open"></i>
            <span class="title">角色权限管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu">
            <li>
              <a href="${ctx}/admin/listRole">
                <i class="icon-envelope-open"></i>
                <span class="title">角色管理</span>
                </a>
            </li>
            <li>
              <a href="${ctx}/admin/listPermission">
                <i class="icon-envelope-open"></i>
                <span class="title">权限管理</span>
              </a>
            </li>

          </ul>
        </li>



      </ul>
      <!-- END SIDEBAR MENU -->
    </div>
  </div>
  <!-- END SIDEBAR -->
  <!-- BEGIN CONTENT -->
  <div class="page-content-wrapper">
    <div class="page-content">

      <sitemesh:write property='body' />

    </div>
  </div>
  <!-- END CONTENT -->

</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
  <div class="page-footer-inner">
    2016 &copy;  by jacket.li
  </div>
  <div class="page-footer-tools">
		<span class="go-top">
		<i class="fa fa-angle-up"></i>
		</span>
  </div>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<!--<script src="${ctx}/static/js/metronic/assets/global/plugins/respond.min.js"></script>-->
<!--<script src="${ctx}/static/js/metronic/assets/global/plugins/excanvas.min.js"></script>-->
<![endif]-->
<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<%--<script src="${ctx}/static/js/metronic/assets/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>--%>
<%--<script src="${ctx}/static/js/metronic/assets/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>--%>
<%--<script src="${ctx}/static/js/metronic/assets/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>--%>
<%--<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery.pulsate.min.js" type="text/javascript"></script>--%>
<%--<script src="${ctx}/static/js/metronic/assets/global/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>--%>
<%--<script src="${ctx}/static/js/metronic/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>--%>
<!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
<%--<script src="${ctx}/static/js/metronic/assets/global/plugins/fullcalendar/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>--%>
<%--<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>--%>
<%--<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>--%>
<%--<script src="${ctx}/static/js/metronic/assets/global/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>--%>
<%--<!-- END PAGE LEVEL PLUGINS -->--%>
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${ctx}/static/js/metronic/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/admin/pages/scripts/index.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script src="${ctx}/static/mywebsite/common/common.js"></script>
<script>
  jQuery(document).ready(function() {
    Metronic.init(); // init metronic core componets
    Layout.init(); // init layout
    QuickSidebar.init(); // init quick sidebar
    Demo.init(); // init demo features
    Index.init();
   // Index.initDashboardDaterange();
   // Index.initCalendar(); // init index page's custom scripts
  //  Index.initCharts(); // init index page's custom scripts
   // Index.initChat();
   // Index.initMiniCharts();
   // Index.initIntro();
   // Tasks.initDashboardWidget();
  });
  var ctx='${ctx}';



  window.onload = function(){
    $.get(ctx+"/message/getUnreadMessage",function(date){
      $('#messageCount').text(date.msg);
      $('#message').text('您有'+date.msg+'条未读消息');
    });
    $.post(ctx+"/teacher/findCourseByUserId",function(date){
      var html="";
      $.each(date,function(i,val){

        if( 0==$('#course').children('li[value='+val.type+']').length){
          html=html+"<li value='"+val.type+"'><a href='javascript:;'><span class='title'>";
          html=html+getType(parseInt(val.type))+"</span><span class='arrow'></span></a>";
          html=html+"</li>";
          $('#course').append(html);
          $('#exam').append(html);
          $('#student').append(html);

          html="<ul class='sub-menu'><li><a href='"+ ctx
          +"/teacher/"+val.id+"'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li></ul>";

          $('#course').children('li[value='+val.type+']').eq(0).append(html);

          html="<ul class='sub-menu'><li><a href='"+ ctx
          +"/exam/"+val.id+"'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li></ul>";
          $('#exam').children('li[value='+val.type+']').eq(0).append(html);

          html="<ul class='sub-menu'><li><a href='"+ ctx
          +"/teacher/student/"+val.id+"'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li></ul>";
          $('#student').children('li[value='+val.type+']').eq(0).append(html);
        }
        else{

          html="<li><a href='"+ ctx
          +"/teacher/"+val.id+"'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li>";

          $('#course').children('li[value='+val.type+']>ul').eq(0).append(html);

          html="<li><a href='"+ ctx
          +"/exam/"+val.id+"'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li>";
          $('#exam').children('li[value='+val.type+']>ul').eq(0).append(html);

          html="<li><a href='"+ ctx
          +"/teacher/student/"+val.id+"'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li>";
          $('#student').children('li[value='+val.type+']>ul').eq(0).append(html);
        }

      });
    });


    $.post(ctx+"/student/findCourseByUserId",function(date){
      var html="";
      $.each(date,function(i,val){
        if( 0==$('#studentCourse').children('li[value='+val.type+']').length){
          html=html+"<li value='"+val.type+"'><a href='javascript:;'><span class='title'>";
          html=html+getType(parseInt(val.type))+"</span><span class='arrow'></span></a>";
          html=html+"</li>";
          $('#studentCourse').append(html);
         //0 $('#errorAnswer').append(html);
          $('#grade').append(html);

          html="<ul class='sub-menu'><li><a href='"+ ctx
          +"/student/"+val.id+"/viewPaper'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li></ul>";

          $('#studentCourse').children('li[value='+val.type+']').eq(0).append(html);

          html="<ul class='sub-menu'><li><a href='"+ ctx
          +"/student/"+val.id+"/errorQuestion'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li></ul>";
         // $('#errorAnswer').children('li[value='+val.type+']').eq(0).append(html);

          html="<ul class='sub-menu'><li><a href='"+ ctx
          +"/student/"+val.id+"/viewGrade'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li></ul>";
          $('#grade').children('li[value='+val.type+']').eq(0).append(html);
        }
        else{

          html="<li><a href='"+ ctx
          +"/student/"+val.id+"/viewPaper'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li>";

          $('#studentCourse').children('li[value='+val.type+']>ul').eq(0).append(html);

          html="<li><a href='"+ ctx
          +"/student/"+val.id+"/errorQuestion'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li>";
         // $('#errorAnswer').children('li[value='+val.type+']>ul').eq(0).append(html);

          html="<li><a href='"+ ctx
          +"/student/"+val.id+"/viewGrade'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li>";
          $('#grade').children('li[value='+val.type+']>ul').eq(0).append(html);
        }
      });
    })
    $.post(ctx+'/student/errorQuestion',function(date){
      var html="";
      $.each(date,function(i,val){
        if( 0==$('#errorAnswer').children('li[value='+val.type+']').length){
          html=html+"<li value='"+val.type+"'><a href='javascript:;'><span class='title'>";
          html=html+getType(parseInt(val.type))+"</span><span class='arrow'></span></a>";
          html=html+"</li>";

          $('#errorAnswer').append(html);



          html="<ul class='sub-menu'><li><a href='"+ ctx
          +"/student/"+val.id+"/errorQuestion'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li></ul>";
           $('#errorAnswer').children('li[value='+val.type+']').eq(0).append(html);


        }
        else{



          html="<li><a href='"+ ctx
          +"/student/"+val.courseId+"/errorQuestion'> "+"<span class='title'>"
          +val.name+"</span><span class='arrow'></span></li>";
           $('#errorAnswer').children('li[value='+val.type+']>ul').eq(0).append(html);


        }
      });
    })
  }
</script>
<!-- END JAVASCRIPTS -->
</body>

<!-- END BODY -->
</html>
