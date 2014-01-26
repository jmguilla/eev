<%@ page import="com.jmguilla.eev.EEVQuestions" %>
<%@ page import="com.jmguilla.eev.EEVAnswers" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>List des EEV</title>
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
			<tr ng-repeat="eev in eevs|orderBy:predicate:reverse" ng-cloak>
				<td ng-if="eev.synced == true"><a href="${createLink(controller: 'EEVAnswers', action: 'show')}/{{eev.id}}.html">{{$index}}</a></td>
				<td ng-if="eev.synced == false">{{$index}}</td>
				<td ng-if="eev.synced == true"><span style="color: #3c763d;" class="glyphicon glyphicon-envelope" ng-show="!!pdf_sent[$index] == true"></span><a ng-hide="!!pdf_sent[$index] == true" href="#" ng-click="sendPDF(eev.id, $index)"><img alt="pdf" src="${resource(dir: 'images', file: 'pdfdownload.png')}" width="15px" height="auto"/></a></td>
				<td ng-if="eev.synced == false"></td>
				<td><span ng-if="eev.synced" style="color: #3c763d;" class="glyphicon glyphicon-ok"></span></td>
				<td ng-if="eev.synced == true"><a href="${createLink(controller: 'EEVAnswers', action: 'show')}/{{eev.id}}.html"><span ng-if="!!eev.interviewee == true">{{eev.interviewee}}</span><span ng-if="!!eev.interviewee == false">Inconnu</span></a></td>
				<td ng-if="eev.synced == false"><span ng-if="!!eev.interviewee == true">{{eev.interviewee}}</span><span ng-if="!!eev.interviewee == false">Inconnu</span></td>
				<td ng-if="eev.synced == true"><a href="${createLink(controller: 'EEVAnswers', action: 'show')}/{{eev.id}}.html">{{eev.creationDate|date:'yyyy-MM-dd'}}</a></td>
				<td ng-if="eev.synced == false">{{eev.creationDate|date:'yyyy-MM-dd'}}</td>
				<td><a href="#" ng-click="deleteEEV(eev)"><span class="glyphicon glyphicon-remove" class="glyphicon glyphicon-user" style="color: #a94442;"></a></span></td>
			</tr>
			</table>
		</div>
	</body>
</html>
