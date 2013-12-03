'use strict';
/* Controllers */
app.controller('eevShowCtrl', function($scope, EEV) {
	$scope.alerts = []
	$scope.init = function(eevId){
		$scope.eevId = eevId;
		EEV.get({eevId: eevId},
		function(response, headers){
			$scope.eev = response;
		},
		function(httpResponse){
			$scope.alerts.push(httpResponse.data)
		});
	}
	$scope.answer = function(){
		$scope.eev.answer()
	}
  $scope.alerts = []
});
