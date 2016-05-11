
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
  <title>Metronic | Dashboard - Dashboard</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1" name="viewport"/>
  <meta content="" name="description"/>
  <meta content="" name="author"/>
  <!-- BEGIN GLOBAL MANDATORY STYLES -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
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
</head>

<body class="page-header-fixed page-quick-sidebar-over-content">
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
  <!-- BEGIN HEADER INNER -->
  <div class="page-header-inner">
    <!-- BEGIN LOGO -->
    <div class="page-logo">
      <a href="index.html">
        <img src="${ctx}/static/js/metronic/assets/admin/layout/img/logo.png" alt="logo" class="logo-default"/>
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
					<span class="badge badge-default">
					4 </span>
          </a>
          <ul class="dropdown-menu">
            <li>
              <p>
                You have 12 new messages
              </p>
            </li>
            <li class="external">
              <a href="inbox.html">
                See all messages <i class="m-icon-swapright"></i>
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
              <a href="extra_profile.html">
                <i class="icon-user"></i> 个人信息 </a>
            </li>

            <li class="divider">
            </li>

            <li>
              <a href="login.html">
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
              <a href="index.html">
                <i class="icon-bar-chart"></i>
                选择课程</a>
            </li>
            <li class="active">
              <a href="index_2.html">
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
          <ul class="sub-menu">
            <li>
              <a href="ecommerce_index.html">
                <i class="icon-home"></i>
                专业必修
                <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <li>
                  <a href="ecommerce_index.html">
                    <i class="icon-home"></i>
                    计算机网络</a>
                </li>

              </ul>
            </li>


          </ul>
        </li>
        <li>
          <a href="javascript:;">
            <i class="icon-rocket"></i>
            <span class="title">错题管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu">
            <li>
              <a href="layout_horizontal_sidebar_menu.html">
                计算机网络</a>
            </li>

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
          <ul class="sub-menu">
            <li class="tooltips" data-container="body" data-placement="right" data-html="true" data-original-title="Complete eCommerce Frontend Theme For Metronic Admin">
              <a href="http://xiujie.cn/preview/index.php?theme=metronic_frontend&page=shop-index.html" target="_blank">
							<span class="title">
							计算机网络 </span>
              </a>
            </li>

          </ul>
        </li>
        <!-- END FRONTEND THEME LINKS -->
        <li>
          <a href="javascript:;">
            <i class="icon-diamond"></i>
            <span class="title">课程管理</span>
            <span class="arrow "></span>
          </a>

        </li>
        <li>
          <a href="javascript:;">
            <i class="icon-puzzle"></i>
            <span class="title">题库管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu">
            <li>
              <a href="components_pickers.html">
                计算机网络</a>
            </li>

          </ul>
        </li>
        <li>
          <a href="javascript:;">
            <i class="icon-settings"></i>
            <span class="title">考试管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu">
            <li>
              <a href="form_controls.html">
                计算机网络</a>
            </li>

          </ul>
        </li>
        <li>
          <a href="javascript:;">
            <i class="icon-logout"></i>
            <span class="title">考生管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu">

            <li>
              <a href="quick_sidebar_push_content.html">
                计算机网络</a>
            </li>

          </ul>
        </li>
        <li>
          <a href="javascript:;">
            <i class="icon-envelope-open"></i>
            <span class="title">权限管理</span>
            <span class="arrow "></span>
          </a>
        </li>
        <li>
          <a href="javascript:;">
            <i class="icon-docs"></i>
            <span class="title">问卷管理</span>
            <span class="arrow "></span>
          </a>
          <ul class="sub-menu">
            <li>
              <a href="page_portfolio.html">
                <i class="icon-feed"></i>
                <span class="badge badge-warning badge-roundless">new</span>Portfolio</a>
            </li>
            <li>
              <a href="page_timeline.html">
                <i class="icon-clock"></i>
                <span class="badge badge-info">4</span>Timeline</a>
            </li>
            <li>
              <a href="page_coming_soon.html">
                <i class="icon-flag"></i>
                Coming Soon</a>
            </li>
            <li>
              <a href="page_blog.html">
                <i class="icon-speech"></i>
                Blog</a>
            </li>
            <li>
              <a href="page_blog_item.html">
                <i class="icon-link"></i>
                Blog Post</a>
            </li>
            <li>
              <a href="page_news.html">
                <i class="icon-eye"></i>
                <span class="badge badge-success">9</span>News</a>
            </li>
            <li>
              <a href="page_news_item.html">
                <i class="icon-bell"></i>
                News View</a>
            </li>
            <li>
              <a href="page_about.html">
                <i class="icon-users"></i>
                About Us</a>
            </li>
            <li>
              <a href="page_contact.html">
                <i class="icon-envelope-open"></i>
                Contact Us</a>
            </li>
            <li>
              <a href="page_calendar.html">
                <i class="icon-calendar"></i>
                <span class="badge badge-danger">14</span>Calendar</a>
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



    </div>
  </div>
  <!-- END CONTENT -->

</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
  <div class="page-footer-inner">
    2014 &copy;  by jacket.li
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
<script src="${ctx}/static/js/metronic/assets/global/plugins/respond.min.js"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/excanvas.min.js"></script>
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
<script src="${ctx}/static/js/metronic/assets/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
<!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
<script src="${ctx}/static/js/metronic/assets/global/plugins/fullcalendar/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/global/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${ctx}/static/js/metronic/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/admin/pages/scripts/index.js" type="text/javascript"></script>
<script src="${ctx}/static/js/metronic/assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
  jQuery(document).ready(function() {
    Metronic.init(); // init metronic core componets
    Layout.init(); // init layout
    QuickSidebar.init(); // init quick sidebar
    Demo.init(); // init demo features
    Index.init();
    Index.initDashboardDaterange();
    Index.initCalendar(); // init index page's custom scripts
    Index.initCharts(); // init index page's custom scripts
    Index.initChat();
    Index.initMiniCharts();
    Index.initIntro();
    Tasks.initDashboardWidget();
  });
</script>
<!-- END JAVASCRIPTS -->
</body>

<!-- END BODY -->
</html>
