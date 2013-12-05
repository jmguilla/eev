'use strict';
/* Controllers */
app.controller('eevAnswerCtrl', function($scope, EEV) {
	$scope.alerts = []
	$scope.init = function(eevId){
		$scope.eevId = eevId;
		EEV.getTemplate({eevId: eevId},
		function(response, headers){
			$scope.eev = response;
		},
		function(httpResponse){
			$scope.alerts.push(httpResponse.data)
		});
	};
	$scope.answer = function(){
		EEV.answer({eevId: ''}, $scope.eev,
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
