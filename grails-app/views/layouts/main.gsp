<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6" manifest="${resource(file: 'cache.manifest')}"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7" manifest="${resource(file: 'cache.manifest')}"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8" manifest="${resource(file: 'cache.manifest')}"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9" manifest="${resource(file: 'cache.manifest')}"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" manifest="${resource(file: 'cache.manifest')}"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, width=device-width">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
		<!-- Home screen icons -->
		<link rel="apple-touch-icon" sizes="57x57"   href="${resource(dir: 'images/icons', file: 'apple-touch-icon-57x57.png')}" />
		<link rel="apple-touch-icon" sizes="72x72"   href="${resource(dir: 'images/icons', file: 'apple-touch-icon-72x72.png')}" />
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images/icons', file: 'apple-touch-icon-114x114.png')}" />
		<!-- iPhone -->
		<link href="${resource(dir: 'images/start', file: 'apple-touch-startup-image-320x460.png')}" media="(device-width: 320px) and (device-height: 480px) and (-webkit-device-pixel-ratio: 1)" rel="apple-touch-startup-image">
		<!-- iPhone (Retina) -->
		<link href="${resource(dir: 'images/start', file: 'apple-touch-startup-image-640x920.png')}" media="(device-width: 320px) and (device-height: 480px) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">
		<!-- iPhone 5 -->
		<link href="${resource(dir: 'images/start', file: 'apple-touch-startup-image-640x1096.png')}" media="(device-width: 320px) and (device-height: 568px) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">
		<%--
		<!-- iPad (portrait) -->
		<link href="apple-touch-startup-image-768x1004.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: portrait) and (-webkit-device-pixel-ratio: 1)" rel="apple-touch-startup-image">
		<!-- iPad (landscape) -->
		<link href="apple-touch-startup-image-748x1024.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: landscape) and (-webkit-device-pixel-ratio: 1)" rel="apple-touch-startup-image">
		<!-- iPad (Retina, portrait) -->
		<link href="apple-touch-startup-image-1536x2008.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: portrait) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">
		<!-- iPad (Retina, landscape) -->
		<link href="apple-touch-startup-image-1496x2048.png" media="(device-width: 768px) and (device-height: 1024px) and (orientation: landscape) and (-webkit-device-pixel-ratio: 2)" rel="apple-touch-startup-image">
		--%>
		<title><g:layoutTitle default="EEV"/></title>
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<r:require module="angular_app"/>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body ng-app="eev" ng-controller="MainCtrl" ng-init="init()">
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<r:layoutResources />
	</body>
</html>
