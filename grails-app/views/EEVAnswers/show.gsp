<%@ page import="com.jmguilla.eev.EEVQuestions" %>
<%@ page import="com.jmguilla.eev.EEVAnswers" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_no_cache">
		<title>EEV</title>
		<link type="text/css" href="${createLinkTo(dir:'css',file:'main.css')}" />
		<r:require module="angular_app"/>
		<r:require module="bootstrap"/>
	</head>
	<body>
		<g:render template="/shared/nav" />
		<div class="col-xs-12" ng-app="eev" ng-controller="EEVAnswersEditCtrl" ng-init="init(${params.id})">
			<g:render template="/shared/alerts"/>
			<g:render template="/shared/eev" />
		</div>
	</body>
</html>
