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
		<div class="col-xs-12" ng-app="eev" ng-controller="EEVFillCtrl" ng-init="init(${params.id}, '${params.action}')">
			<div class="row">
				<div class="col-xs-12">
					<div ng-repeat="alert in alerts" class="alert alert-{{alert.type}} alert-dismissable">
					  <button ng-click="alerts.splice($index, 1)" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					  <span ng-bind-html="alert.content"></span>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12"><h3>{{eev.title}}</h3></div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<form role="form">
					<div class="form-group">
					  <label for="interviewee">Email Interviewe</label>
					  <div>
					  	<input ng-model="eev.interviewee.email" type="text" class="form-control" id="interviewee" placeholder="Email interviewe">
					  </div>
					</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<button ng-click="fill()" type="button" class="btn btn-default">Repondre</button>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div ng-repeat="group in eev.groups" class="panel panel-primary">
					<div class="panel-heading">{{group.title}}</div>
					<div class="panel-body">
						<table class="table table-hover">
							<tr><td></td><td>:D</td><td>:)</td><td>:|</td><td>:(</td></tr>
							<tr ng-repeat="row in group.rows|orderBy:'rank'">
								<td>{{row.question.question}}</td>
								<td><input type="radio" ng-model="row.answer.answer" value="0"/></td>
								<td><input type="radio" ng-model="row.answer.answer" value="1"/></td>
								<td><input type="radio" ng-model="row.answer.answer" value="2"/></td>
								<td><input type="radio" ng-model="row.answer.answer" value="3"/></td>
							</tr>
						</table>
					</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<button ng-click="fill()" type="button" class="btn btn-default">Repondre</button>
				</div>
			</div>
		</div>
	</body>
</html>
