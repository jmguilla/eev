'use strict';
/* Controllers */
app.controller('EEVFillCtrl', function($scope, EEVQuestions, EEVAnswers) {
	$scope.answers = {};
	$scope.alerts = [];
	$scope.init = function(eevId, action) {
		$scope.eevId = eevId;
		$scope.action = action;
		if (action.toUpperCase() == "ANSWER") {
			EEVQuestions.get({
				eevId : eevId
			}, function(response, headers) {
				$scope.eev = response;
			}, function(httpResponse) {
				$scope.alerts.push(httpResponse.data)
			});
		} else {
			alert('Not implemented');
		}
	};
	$scope.fill = function() {
		EEVAnswers.answer({}, {
			interviewer : $scope.interviewer,
			interviewee : $scope.interviewee,
			answers : $scope.answers
		}, function(content, headers) {
			$scope.alerts.push(content);
			$scope.eev = content.model.eev;
		}, function(httpResponse) {
			if (httpResponse.data.type != undefined) {
				$scope.alerts.push(httpResponse.data);
			}else{
				$scope.alerts.push({type: 'danger', content: 'Un problème inconnu s\'est produit'});
			}
		})
	};
});
