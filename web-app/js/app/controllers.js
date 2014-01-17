'use strict';
/* Controllers */
app.controller('MainCtrl', function($scope, $sce, User) {
	$scope.alerts = [];
	$scope.syncing = false;
	$scope.synced = false;
	$scope.init = function(){
		//for caching purposes

    function logEvent(event) {
    	console.log(event);
    }
		
		function syncingBegins(event){
			logEvent('Begining synchronization');
			logEvent(event);
			$scope.syncing = true;
		}
		
		function syncingEnds(event){
			logEvent('Finishing synchronization');
			logEvent(event);
			$scope.syncing = false;
		}
   
    window.applicationCache.addEventListener('checking',logEvent,false);
    window.applicationCache.addEventListener('noupdate',syncingEnds,false);
    window.applicationCache.addEventListener('downloading',syncingBegins,false);
    window.applicationCache.addEventListener('cached',syncingEnds,false);
    window.applicationCache.addEventListener('updateready',syncingEnds,false);
    window.applicationCache.addEventListener('obsolete',syncingEnds,false);
    window.applicationCache.addEventListener('error',syncingEnds,false);
    
    window.onerror = function(m,u,l){
    	logEvent(m+"\n"+u+":"+l);
    };
    
    // $scope.userNavCollapsed = "<button ng-cloak type='button' class='btn navbar-btn btn-default dropdown-toggle hidden-sm hidden-md hidden-lg btn-dropdown-like no-collapse pull-left' data-toggle='dropdown'><span class='glyphicon glyphicon-refresh' style='color: #8a6d3b;'></span></button>";
    // $scope.userNav          = "<button ng-cloak type='button' class='btn navbar-btn btn-default dropdown-toggle hidden-xs btn-dropdown-like pull-left' data-toggle='dropdown'><span class='glyphicon glyphicon-refresh' style='color: #8a6d3b;'></span></button>";
		
		User.widgets({},
		function(data, headers){
			$scope.userNavCollapsed = $sce.trustAsHtml(data.navCollapsed);
			$scope.userNav = $sce.trustAsHtml(data.nav);
		},
		function(httpResponse){
			$scope.alerts.push({type: 'danger', content: 'Un probleme s\'est produit: ' + httpResponse.data});
		});
		if(navigator.onLine && typeof(Storage)=="undefined"){
			$scope.alerts.push({type: 'danger', content: 'Ce navigateur ne permet pas l\'utilisation de cette application sans connexion.'})
			$scope.eevSubmitting = true;
		}else{
			if(typeof(Storage)=="undefined"){
				$scope.alerts.push({type: 'warning', content: 'Ce navigateur ne permet pas l\'utilisation de cette application sans connexion...'})
			}
			$scope.eevSubmitting = false;
		}
	}
});

app.controller('UserAccountCtrl', function($scope, $sce, User) {
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

app.controller('EEVAnswersListCtrl', function($scope, EEVAnswers) {
	$scope.predicate = 'synced';
	$scope.reverse = 'true';
	$scope.deleteEEV = function(eev){
		if(confirm("Supprimer?")){
			EEVAnswers.deleteEEV(eev, $scope);
		}
	};
	EEVAnswers.loadLists($scope);
});

app.controller('EEVAnswersShowCtrl', function($scope, EEVAnswers) {
	$scope.eevDisabled = true;
	$scope.init = function(eevAnswersId){
		$scope.eevAnswersId = eevAnswersId;
		EEVAnswers.loadEEV({eevAnswersId: $scope.eevAnswersId}, $scope);
	};
});

app.controller('EEVFillCtrl', function($scope, EEVQuestions, EEVAnswers) {
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
		$scope.eevSubmitting = true;
		EEVAnswers.answer({
				eevId: $scope.eevId,
				interviewer : $scope.interviewer,
				interviewee : $scope.interviewee,
				answers : $scope.answers
			}, $scope);
	};
});
