<%@ page import="com.jmguilla.eev.EEV" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Repondre a un EEV</title>
		<r:require module="angular_app"/>
		<r:require module="bootstrap"/>
	</head>
	<body>
		<div ng-app="eev" ng-controller="eevShowCtrl" ng-init="init(${eevInstance.id})">
			<div ng-repeat="alert in alerts" class="alert alert-{{alert.type}} alert-dismissable">
			  <button ng-click="alerts.splice($index, 1)" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			  {{alert.content}}
			</div>
			<form role="form">
			<div class="form-group">
			  <label class="col-xs-12" for="interviewee">Email Interviewe</label>
			  <div class="col-xs-12">
			  	<input ng-model="eev.interviewee.email" type="email" class="form-control" id="interviewee" placeholder="Email interviewe">
			  </div>
			</div>
			</form>
			<button ng-click="save()" type="button" class="btn btn-default">Sauver</button>
			<div ng-repeat="group in eev.groups" class="panel panel-primary">
			<div class="panel-heading">{{group.title}}</div>
			<div class="panel-body">
				<table class="table table-hover">
					<tr><td></td><td>:D</td><td>:)</td><td>:|</td><td>:(</td></tr>
					<tr ng-repeat="row in group.rows">
						<td>{{row.question.question}}</td>
						<td><input type="radio" ng-model="row.answer" value="0"/></td>
						<td><input type="radio" ng-model="row.answer" value="1"/></td>
						<td><input type="radio" ng-model="row.answer" value="2"/></td>
						<td><input type="radio" ng-model="row.answer" value="3"/></td>
					</tr>
				</table>
			</div>
			</div>
			<button ng-click="save()" type="button" class="btn btn-default">Sauver</button>
		</div>
	</body>
</html>
