<div class="row">
	<div class="col-xs-12">
		<div ng-repeat="alert in alerts" class="alert alert-{{alert.type}} alert-dismissable">
		  <button ng-click="alerts.splice($index, 1)" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		  <span ng-bind-html="alert.content"></span>
		</div>
	</div>
</div>