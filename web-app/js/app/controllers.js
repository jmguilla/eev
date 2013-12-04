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
	};
	$scope.save = function(){
		if($scope.eev.template == true){
			$scope.eev.id = null;
		}
		EEV.save({eevId: ''}, $scope.eev,
		function(content, headers){
			$scope.alerts.push(content)
			$scope.eev = content.model.eev
		},
		function(httpResponse){
			$scope.alerts.push(httpResponse.data)
			$scope.eev = httpResponse.data.model.eev
		})
	};
});
