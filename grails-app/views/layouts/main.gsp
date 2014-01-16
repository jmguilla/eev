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
		<meta name="apple-mobile-web-app-capable" content="yes"/>
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
		<!-- Home screen icons -->
		<link rel="apple-touch-icon" sizes="57x57"   href="${resource(dir: 'images/icons', file: 'apple-touch-icon-57x57.png')}" />
		<link rel="apple-touch-icon" sizes="72x72"   href="${resource(dir: 'images/icons', file: 'apple-touch-icon-72x72.png')}" />
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images/icons', file: 'apple-touch-icon-114x114.png')}" />
		<!-- iPad -->
		<!-- Portrait -->
		<%--<link rel="apple-touch-startup-image" href="starts/ipad-768x1024.jpg" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)" />
		<link rel="apple-touch-startup-image" href="starts/ipad-1536x2048.jpg" media="screen and (min-device-width: 481px) and (max-device-width: 2048px) and (orientation:portrait)" />
		<!-- Landscape -->
		<link rel="apple-touch-startup-image" href="starts/ipad-landscape.jpg" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)" />
		<!-- For iPhone 5 and iPod touch (5th generation) -->
		<link rel="apple-touch-startup-image" href="starts/iphone-640x1136.jpg" media="screen and (max-device-width: 640px) and (max-device-height: 1136px)" />
		<!-- For other iPhone and iPod touch devices: -->
		<link rel="apple-touch-startup-image" href="starts/iphone-640x960.jpg" media="screen and (max-device-width: 640px) and (max-device-height: 960px)" />
		<link rel="apple-touch-startup-image" href="starts/iphone-320x480.jpg" media="screen and (max-device-width: 320px)" />--%>
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
