<%@ page import="com.jmguilla.eev.EEVQuestions" %>
<%@ page import="com.jmguilla.eev.EEVAnswers" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_no_cache">
		<title>List des EEV</title>
		<r:require module="angular_app"/>
		<r:require module="bootstrap"/>
	</head>
	<body>
		<g:render template="/shared/nav"/>
		<div class="col-xs-12" ng-app="eev" ng-controller="EEVAnswersListCtrl">
			<g:render template="/shared/alerts"/>
			<ul>
				<li ng-repeat="eev in eevs"><a href="${createLink(controller: 'EEVAnswers', action: 'show')}/{{eev.id}}">{{eev.eevQuestions.title}} - {{eev.creationDate}}</a></li>
				<h4 ng-if="eevs.length == 0">Aucun listing</h4>
			</ul>
		</div>
	</body>
</html>
