<%@ page import="com.jmguilla.eev.EEVQuestions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Repondre a un EEV</title>
	</head>
	<body>
		<g:render template="/shared/nav" />
		<div class="col-xs-12" ng-controller="EEVFillCtrl" ng-init="init(${params.id})" ng-cloak>
			<g:render template="/shared/alerts"/>
			<g:render template="/shared/eev" />
		</div>
	</body>
</html>
