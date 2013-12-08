'use strict';
/* Controllers */
app.controller('EEVFillCtrl', function($scope, EEV) {
	$scope.alerts = [];
  $scope.radioModel = 'Middle';
	$scope.init = function(eevId, action) {
	  $scope.radioModel = 'Middle';
		$scope.my = function(){
			alert();
		}
		$scope.eevId = eevId;
		$scope.action = action;
		if (action.toUpperCase() == "ANSWER") {
			EEV.getTemplate({
				eevId : eevId
			}, function(response, headers) {
				$scope.eev = response;
			}, function(httpResponse) {
				$scope.alerts.push(httpResponse.data)
			});
		} else {
			EEV.get({
				eevId : eevId
			}, function(response, headers) {
				$scope.eev = response;
			}, function(httpResponse) {
				$scope.alerts.push(httpResponse.data)
			});
		}
	};
	$scope.fill = function() {
		EEV.save({
			eevId : $scope.eevId,
			actionId: $scope.action
		}, $scope.eev, function(content, headers) {
			$scope.alerts.push(content);
			$scope.eev = content.model.eev;
		}, function(httpResponse) {
			$scope.alerts.push(httpResponse.data);
			$scope.eev = httpResponse.data.model.eev;
		})
	};
});
