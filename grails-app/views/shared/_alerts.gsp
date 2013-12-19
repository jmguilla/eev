<div class="row">
	<div class="col-xs-12">
		<g:if test='${flash.message}'>
		<div class="alert alert-info alert-dismissable slide">
		  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		  <span>${flash.message}</span>
		</div>
		</g:if>
		<div ng-repeat="alert in alerts" class="alert alert-{{alert.type}} alert-dismissable slide" ng-cloak>
		  <button ng-click="alerts.splice($index, 1)" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		  <span ng-bind-html="alert.content"></span>
		</div>
	</div>
</div>