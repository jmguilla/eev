<%@ page import="com.jmguilla.eev.EEVQuestions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_no_cache">
		<title>Repondre a un EEV</title>
		<r:require module="angular_app"/>
		<r:require module="bootstrap"/>
	</head>
	<body>
		<g:render template="/shared/nav" />
		<div ng-controller="UserAccountCtrl">
		<g:render template="/shared/alerts" />
		<form role="form" class="col-xs-12 col-md-3">
		  <div class="form-group">
		    <label for="password">PWD actuel</label>
		    <input ng-model="current" type="password" class="form-control" id="password" placeholder="Password actuel">
		  </div>
		  <div class="form-group">
		    <label for="newpwd">Nouveau PWD</label>
		    <input ng-model="newPWD" type="password" class="form-control" id="newpwd" placeholder="Password">
		  </div>
		  <div class="form-group">
		    <label for="newpwdagain">Encore</label>
		    <input ng-model="newPWDAgain" type="password" class="form-control" id="newpwdagain" placeholder="Confirmation">
		  </div>
		  <button type="submit" class="btn btn-default" ng-click="change()">Changer</button>
		</form>
		</div>
	</body>
</html>
