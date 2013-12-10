'use strict';
/* Controllers */

app.controller('EEVAnswersEditCtrl', function($scope, EEVAnswers) {
	$scope.alerts = [];
	$scope.eevDisabled = true;
	$scope.init = function(eevAnswersId){
		$scope.eevAnswersId = eevAnswersId;
		var data = EEVAnswers.getEEV({eevAnswersId: $scope.eevAnswersId},
		function(data, headers){
			$scope.eev = data.eev;
			$scope.answers = data.answers;
			$scope.interviewee = data.interviewee;
			$scope.interviewer = data.interviewer;
		},
		function(httpResponse){
			if (httpResponse.data.type != undefined) {
				$scope.alerts.push(httpResponse.data);
			}else{
				$scope.alerts.push({type: 'danger', content: 'Un problème inconnu s\'est produit'});
			}
		});
	}
});

app.controller('EEVFillCtrl', function($scope, EEVQuestions, EEVAnswers) {
	$scope.alerts = [];
	$scope.answers = {};
	$scope.init = function(eevId) {
		$scope.eevId = eevId;
		EEVQuestions.get({
			eevId : eevId
		}, function(response, headers) {
			$scope.eev = response;
		}, function(httpResponse) {
			$scope.alerts.push(httpResponse.data)
		});
	};
	$scope.fill = function() {
		EEVAnswers.answer({}, {
			eevId: $scope.eevId,
			interviewer : $scope.interviewer,
			interviewee : $scope.interviewee,
			answers : $scope.answers
		}, function(content, headers) {
			$scope.alerts.push(content);
			$scope.eev = content.model.eev;
			$scope.answers = {};
			$scope.interviewer = undefined;
			$scope.interviewee = undefined;
		}, function(httpResponse) {
			if (httpResponse.data.type != undefined) {
				$scope.alerts.push(httpResponse.data);
			}else{
				$scope.alerts.push({type: 'danger', content: 'Un problème inconnu s\'est produit'});
			}
		})
	};
});
