'use strict';
/* Controllers */
app.controller('UserAccountCtrl', function($scope, $sce, User) {
	$scope.alerts = [];
	$scope.change = function(){
		User.updatePWD({},{current: $scope.current, newPWD: $scope.newPWD, newPWDAgain: $scope.newPWDAgain},
		function(data, headers){
			$scope.alerts.push(data);
		},
		function(httpResponse){
			$scope.alerts.push(httpResponse.data);
		});
	}
});

app.controller('NavCtrl', function($scope, $sce, User) {
	$scope.init = function(){
		User.widgets({},
		function(data, headers){
			$scope.nav = $sce.trustAsHtml(data.nav);
		},
		function(httpResponse){
			alert('Un probleme s\'est produit.');
		});
	}
});
app.controller('EEVAnswersListCtrl', function($scope, EEVAnswers) {
	$scope.alerts = [];
	var data = EEVAnswers.list({},
			function(data, headers){
				$scope.eevs = data;
			},
			function(httpResponse){
				if (httpResponse.data.type != undefined) {
					$scope.alerts.push(httpResponse.data);
				}else{
					$scope.alerts.push({type: 'danger', content: 'Un problème inconnu s\'est produit'});
				}
			});
});
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
		$scope.eevSubmitting = false;
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
		$scope.eevSubmitting = true;
		EEVAnswers.answer({}, {
			eevId: $scope.eevId,
			interviewer : $scope.interviewer,
			interviewee : $scope.interviewee,
			answers : $scope.answers
		}, function(content, headers) {
			$scope.eevSubmitting = false;
			$scope.alerts.push(content);
			$scope.eev = content.model.eev;
			$scope.answers = {};
			$scope.interviewer = '';
			$scope.interviewee = '';
		}, function(httpResponse) {
			$scope.eevSubmitting = false;
			if (httpResponse.data.type != undefined) {
				$scope.alerts.push(httpResponse.data);
			}else{
				$scope.alerts.push({type: 'danger', content: 'Un problème inconnu s\'est produit'});
			}
		})
	};
});
