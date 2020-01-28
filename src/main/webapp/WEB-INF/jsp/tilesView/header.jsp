<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 전남콘텐츠기업육성센터 - 관리자 </title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<style type="text/css">
		#paging {padding:0 0 0 0; text-align:center; width:100%;}
		#paging ul {display:inline;}
		#paging li {display:inline; list-style-type:none; padding:0 10px 0 10px; font-family: Tahoma; font-size:11px; color: #333333;}
		#paging li.pre10 {padding:0 2px 0 2px;}
		#paging li.pre1 {padding:0 2px 0 2px;}
		#paging li.next10 {padding:0 2px 0 2px;}
		#paging li.next1 {padding:0 2px 0 2px;}
		#paging li.line {background:url(../../images/egovframework/example/paging_line.gif) 0 2px no-repeat;}
		#paging li.first {padding:0 5px 0 0;}
		#paging li.last {background:url(../../images/egovframework/example/paging_line.gif) 0 2px no-repeat; padding:0 5px 0 0;}
	</style>
	
	<!-- #CSS Links -->
	<style>
    	/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
		.ui-datepicker-trigger{cursor: pointer;}
		/*datepicer input 롤오버 시 손가락 모양 표시*/
		.hasDatepicker{cursor: pointer;}	
    </style>
    
<!--     <link rel="stylesheet" type="text/css" href="../assets/jqGrid/css/jquery-ui.css" />
    <link rel="stylesheet" type="text/css"  href="../assets/jqGrid/css/ui.jqgrid.css" />
 해당 위치에서 파일을 찾을 수 없음-->
    	
<!-- 	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
	
	<link rel="stylesheet" type="text/css" media="screen" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" media="screen" href="../css/font-awesome.min.css">
	
	<link rel="stylesheet" type="text/css" media="screen" href="../css/sub.css">
	
	<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
	<link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-production-plugins.min.css">
	<link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-production.min.css">
	<link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-skins.min.css">
	
	<!-- SmartAdmin RTL Support -->
	<link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-rtl.min.css"> 
	
	<!-- We recommend you use "your_style.css" to override SmartAdmin
	     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
	<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->
	
	<!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
	<link rel="stylesheet" type="text/css" media="screen" href="../css/demo.min.css">
	
	<!-- #FAVICONS -->
	<link rel="shortcut icon" href="../img/favicon/favicon.ico" type="image/x-icon">
	<link rel="icon" href="../img/favicon/favicon.ico" type="image/x-icon">
	
	<!-- #GOOGLE FONT -->
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
	
	<!-- #APP SCREEN / ICONS -->
	<!-- Specifying a Webpage Icon for Web Clip 
		 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
	<link rel="apple-touch-icon" href="../img/splash/sptouch-icon-iphone.png">
	<link rel="apple-touch-icon" sizes="76x76" href="../img/splash/touch-icon-ipad.png">
	<link rel="apple-touch-icon" sizes="120x120" href="../img/splash/touch-icon-iphone-retina.png">
	<link rel="apple-touch-icon" sizes="152x152" href="../img/splash/touch-icon-ipad-retina.png">
	
	<!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	
	<!-- Startup image for web apps -->
	<link rel="apple-touch-startup-image" href="../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
	<link rel="apple-touch-startup-image" href="../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
	<link rel="apple-touch-startup-image" href="../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
	<!-- Basic Styles -->
	
</head>
<body>
	<!-- #HEADER -->
	<header id="header">
		<div id="logo-group">
			<!-- PLACE YOUR LOGO HERE -->
			<span id="logo" style="margin-top:8px;"> <img src="../img/admin_logo.png" alt="SmartAdmin" style="width: 196px;"> </span>
			<!-- END LOGO PLACEHOLDER -->
		</div>

		<!-- #TOGGLE LAYOUT BUTTONS -->
		<!-- pulled right: nav area -->
		<div class="pull-right">
			<!-- collapse menu button -->
			<div id="hide-menu" class="btn-header pull-right">
				<span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
			</div>
			<!-- end collapse menu -->
			
			<!-- logout button -->
			<div id="logout" class="btn-header transparent pull-right">
				<span> <a href="login.html" title="Sign Out" data-action="userLogout" data-logout-msg="You can improve your security further after logging out by closing this opened browser"><i class="fa fa-sign-out"></i></a> </span>
			</div>
			<!-- end logout button -->

			<!-- fullscreen button -->
			<div id="fullscreen" class="btn-header transparent pull-right">
				<span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
			</div>
			<!-- end fullscreen button -->
			
		</div>
		<!-- end pulled right: nav area -->
	</header>
	<!-- END HEADER -->
</body>
</html>