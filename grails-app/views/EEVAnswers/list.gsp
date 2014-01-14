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
			<table class="table table-condensed" ng-cloak>
			<tr>
				<td>#</td>
				<td>PDF</td>
				<td><a href="#" ng-click="predicate = 'synced'; reverse=!reverse">Sync</a></td>
				<td><a href="#" ng-click="predicate = 'interviewee'; reverse=!reverse">Vendeur</a></td>
				<td><a href="#" ng-click="predicate = 'creationDate'; reverse=!reverse">Date</a></td>
				<td></td>
			</tr>
			<tr ng-repeat="eev in eevs|orderBy:predicate:reverse">
				<td>{{$index}}</td>
				<td><a ng-if="eev.synced" href="${createLink(controller: 'EEVAnswers', action: 'show')}/{{eev.id}}.pdf" target="_blank"><img alt="pdf" src="${resource(dir: 'images', file: 'pdfdownload.png')}" width="15px" height="auto"/></a></td>
				<td><span ng-if="eev.synced" style="color: #3c763d;" class="glyphicon glyphicon-ok"></span></td>
				<td><span ng-if="!!eev.interviewee == true">{{eev.interviewee}}</span><span ng-if="!!eev.interviewee == false">Inconnu</span></a></td>
				<td>{{eev.creationDate|date:'yyyy-MM-dd'}}</td>
				<td><a href="#" ng-click="deleteEEV(eev)"><span class="glyphicon glyphicon-remove" class="glyphicon glyphicon-user" style="color: #a94442;"></a></span></td>
			</tr>
			</table>
		</div>
	</body>
</html>
