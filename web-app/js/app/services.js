'use strict';
/* Services */
angular.module('eevServices', ['ngResource']).
factory('User', function($resource){
	return $resource('/eev/user/:actionId/:userId.json', {actionId: '', userId: '@id'}, {
		widgets: {
			method: 'GET',
			params: {
				actionId: 'widgets'
			},
			headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
			}
		},
		updatePWD: {
			method: 'POST',
			params: {
				actionId: 'updatePWD'
			},
			headers: {
	  			'Content-Type': 'application/json',
	  			'Accept': 'application/json'
			}
		}
	});
}).

factory('EEVQuestions', function($resource){
  return $resource('/eev/EEVQuestions/:actionId/:eevId.json', {actionId: '', eevId: '@id'}, {
  	get:{
  		method: 'GET',
  		params: {
  			actionId: 'get'
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		}
  	}
  });
}).

factory('EEVAnswers', function($resource){
	var eevAnswersService = new Object();
	eevAnswersService.resource = $resource('/eev/EEVAnswers/:actionId/:eevAnswersId.json', {actionId: '', eevId: '@id'}, {
  	answer:{
  		method: 'POST',
  		params:{
  			actionId: 'answer'
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		}
  	},
  	getEEV:{
  		method: 'GET',
  		params:{
  			actionId: 'getEEV'
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		}
  	},
  	list:{
  		method: 'GET',
  		params:{
  			actionId: 'list'
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		},
  		isArray: true
  	}
  });
	
	/**
	 * The synchronization method
	 */
	eevAnswersService.sync = function(scope, _this){
		if(navigator.onLine){
			var pendingAnswers = localStorage.answers;
			if(!!pendingAnswers == true){
				scope.syncing = true;
				var updateSync = function(scope){
					scope.numberInSync--;
					if(scope.numberInSync <= 0){
						localStorage.answers = JSON.stringify(pendingAnswers);
						scope.syncing = false;
						scope.alerts.push({type: 'info', content: 'Les données de cette machine ont été synchronisées.'});
					}
				};
				scope.numberInSync = 0;
				pendingAnswers = JSON.parse(pendingAnswers);
				var len = pendingAnswers.length
				while (len--) {
					scope.numberInSync++;
					_this.resource.answer({}, pendingAnswers[len], function(content, headers) {
						//success, what shall we do?
						pendingAnswers.splice(len, 1);
						updateSync(scope, pendingAnswers);
					}, function(httpResponse) {
						//danger, what shall we do?
						updateSync(scope, pendingAnswers);
						if (httpResponse.data.type != undefined) {
							scope.alerts.push(httpResponse.data);
						}else{
							scope.alerts.push({type: 'danger', content: 'Un problème inconnu s\'est produit'});
						}
					});
				}
			}
		}else{
			//so far, does nothing
		}
	};

	/**
	 * Proxying submition of an eev. If running online, an attempt to sync is done
	 */
	eevAnswersService.answer = function(eev, scope){
		var storeLocally = function(){
			var pendingAnswers = localStorage.answers;
			if(!!pendingAnswers == true){
				pendingAnswers = JSON.parse(pendingAnswers);
			}else{
				pendingAnswers = [];
			}
			pendingAnswers.push(eev);
			localStorage.answers = JSON.stringify(pendingAnswers);
		};
		if(navigator.onLine){
			this.resource.answer({}, eev, function(content, headers) {
				scope.eevSubmitting = false;
				scope.alerts.push(content);
				scope.eev = content.model.eev;
				scope.answers = {};
				scope.interviewer = '';
				scope.interviewee = '';
			}, function(httpResponse) {
				storeLocally();
				scope.eevSubmitting = false;
				if (httpResponse.data.type != undefined) {
					scope.alerts.push({type: httpResponse.data.type, content: 'EEV enregistré sur l\'appareil en raison d\'un problème: ' + httpResponse.data.content});
				}else{
					scope.alerts.push({type: 'warning', content: 'EEV enregistré sur l\'appareil en raison d\'un problème: ' + httpResponse.data});
				}
			});
		}else{
			storeLocally();
			scope.eevSubmitting = false;
			scope.alerts.push({type: 'success', content: 'EEV enregistré sur l\'appareil. Il sera synchronisé plus tard.'});
		}
		this.sync(scope, this);
	};
	
	/**
	 * To list available 
	 */
	eevAnswersService.loadLists = function(scope){
	//loading those available from remote server
	this.resource.list({},
			function(data, headers){
				scope.eevs = data;
			},
			function(httpResponse){
				if (httpResponse.data.type != undefined) {
					scope.alerts.push(httpResponse.data);
				}else{
					scope.alerts.push({type: 'danger', content: 'Un problème inconnu s\'est produit: ' + httpResponse.data});
				}
			});
	
	//check if some are pending
	var pendingAnswers = localStorage.answers;
	if(!!pendingAnswers == true){
		scope.pendingEevs = JSON.parse(pendingAnswers);
	}else{
		scope.pendingEevs = [];
	}
	
	//triggering sync in any case
	this.sync(scope, this);
	};
	
	eevAnswersService.loadEEV = function(id, scope){
		this.resource.getEEV(id,
				function(data, headers){
					scope.eev = data.eev;
					scope.answers = data.answers;
					scope.interviewee = data.interviewee;
					scope.interviewer = data.interviewer;
				},
				function(httpResponse){
					if (httpResponse.data.type != undefined) {
						scope.alerts.push(httpResponse.data);
					}else{
						scope.alerts.push({type: 'danger', content: 'Un problème inconnu s\'est produit: ' + httpResponse.data});
					}
				});

		//triggering sync in any case
		this.sync(scope, this);
	};
	return eevAnswersService;
});