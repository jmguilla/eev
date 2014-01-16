<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6" manifest="${resource(file: 'cache.manifest')}"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7" manifest="${resource(file: 'cache.manifest')}"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8" manifest="${resource(file: 'cache.manifest')}"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9" manifest="${resource(file: 'cache.manifest')}"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" manifest="${resource(file: 'cache.manifest.todo')}"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
