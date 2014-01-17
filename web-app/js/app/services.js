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
  	deleteEEV:{
  		method: 'DELETE',
  		params:{
  			actionId: 'deleteEEV'
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		}
  	},
  	sendPDF: {
  		method: 'GET',
  		params:{
  			actionId: 'sendPDF'
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json',
  			'X-Requested-With': 'XMLHttpRequest'
  		}
  	},
  	list:{
  		method: 'GET',
  		params:{
  			actionId: 'listJSON'
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json',
  			'X-Requested-With': 'XMLHttpRequest'
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
						scope.alerts.push({type: 'info', content: 'Tentative de synchronisation des données de cette machine effectuée.'});
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
						//status == 0 means fetching of the resource failed
						if(httpResponse.status){
							if (httpResponse.data.type != undefined) {
								scope.alerts.push(httpResponse.data);
							}else{
								scope.alerts.push({type: 'danger', content: 'Un problème inconnu s\'est produit'});
							}
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
			// setting index for potential futur removal by user
			eev.index = pendingAnswers.length;
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
	};
	
	/**
	 * To list available 
	 */
	eevAnswersService.loadLists = function(scope){
	//loading those available from remote server
	scope.eevs = [];
	if(navigator.onLine){
		this.resource.list({},
			function(data, headers){
				for(var index = 0 ; index < data.length; index++){
					data[index].synced = true;
				}
				scope.eevs = scope.eevs.concat(data);
			},
			function(httpResponse){
				//status == 0 means fetching of the resource failed
				if(httpResponse.status){
					if(httpResponse.status == 401){
						scope.alerts.push({type: 'warning', content: 'Pour voir les EEV synchronisés, connectez vous.'});
					}else{
						if (httpResponse.data.type != undefined) {
							scope.alerts.push(httpResponse.data);
						}else{
							scope.alerts.push({type: 'danger', content: 'Un problème inconnu s\'est produit: ' + httpResponse.data});
						}
					}
				}
			});
	}
		
	//check if some are pending
	var pendingAnswers = localStorage.answers;
	if(!!pendingAnswers == true){
		var unsynced = JSON.parse(pendingAnswers);
			for(var index = 0 ; index < unsynced.length; index++){
				unsynced[index].synced = false;
			}
		scope.eevs = scope.eevs.concat(unsynced);
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
	
	eevAnswersService.deleteEEV = function(eev, scope){
		scope.syncing = true;
		if(!!eev.id == true && eev.synced){
			// remote removal
			this.resource.deleteEEV({eevAnswersId: eev.id},
					function(data, headers){
						scope.alerts.push(data)
						for(var index in scope.eevs){
							if(scope.eevs[index].id == eev.id){
								scope.eevs.splice(index, 1);
								break;
							}
						}
						scope.syncing = false;
					},
					function(httpResponse){
						if(httpResponse.data.type != undefined){
							scope.alerts.push(httpResponse.data)
						}else{
							scope.alerts.push({type: 'danger', content: 'Suppression impossible: ' + httpResponse})
						}
						scope.syncing = false;
					});
		}else{
			// local removal
			if(!!eev.index == true){
				//this is an error, should have been set during local storing process
				scope.alerts.push({type: 'danger', content: 'Suppression impossible, pas d\'index associé.'})
				scope.syncing = false;
			}else{
				var pendingAnswers = localStorage.answers;
				if(!!pendingAnswers == true){
					pendingAnswers = JSON.parse(pendingAnswers);
					pendingAnswers.splice(eev.index, 1);
					for(var index in scope.eevs){
						if(scope.eevs[index].index == eev.index){
							scope.eevs.splice(index, 1);
							break;
						}
					}
					localStorage.answers = JSON.stringify(pendingAnswers);
				}
				scope.syncing = false;
			}
		}
	};
	
	eevAnswersService.sendPDF = function(id, scope){
		this.resource.sendPDF({eevAnswersId: id},
				function(data, headers){
					scope.alerts.push(data)
				},
				function(httpResponse){
					if(httpResponse.data.type != undefined){
						scope.alerts.push(httpResponse.data)
					}else{
						scope.alerts.push({type: 'danger', content: 'Envoie impossible: ' + httpResponse})
					}
				});
	};
	
	return eevAnswersService;
});