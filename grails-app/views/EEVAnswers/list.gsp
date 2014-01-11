<%@ page import="com.jmguilla.eev.EEVQuestions" %>
<%@ page import="com.jmguilla.eev.EEVAnswers" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>List des EEV</title>
		<r:require module="angular_app"/>
		<r:require module="bootstrap"/>
	</head>
	<body>
		<g:render template="/shared/nav"/>
		<div class="col-xs-12" ng-app="eev" ng-controller="EEVAnswersListCtrl">
			<g:render template="/shared/alerts"/>
			<h4>En attente de synchronisation</h4>
			<ol ng-cloak>
				<li ng-repeat="eev in pendingEevs">
				<span ng-if="!!eev.interviewee == true">{{eev.interviewee}}</span>
				<span ng-if="!!eev.interviewee == false">Vendeur inconnu</span>
				</li>
				<h4 ng-if="pendingEevs.length == 0">Aucun listing</h4>
			</ol>
			<h4>Disponibles sur le serveur</h4>
			<ol ng-cloak>
				<li ng-repeat="eev in eevs">
				<a ng-if="!!eev.interviewee == true" href="${createLink(controller: 'EEVAnswers', action: 'show')}/{{eev.id}}.html">{{eev.interviewee}} - {{eev.creationDate}}</a>
				<a ng-if="!!eev.interviewee == false" href="${createLink(controller: 'EEVAnswers', action: 'show')}/{{eev.id}}.html">Vendeur inconnu - {{eev.creationDate}}</a>
				&nbsp;<a href="${createLink(controller: 'EEVAnswers', action: 'show')}/{{eev.id}}.pdf" target="_blank">pdf</a>
				</li>
				<h4 ng-if="eevs.length == 0">Aucun listing</h4>
			</ol>
		</div>
	</body>
</html>
