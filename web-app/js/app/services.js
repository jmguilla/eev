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
  return $resource('/eev/EEVAnswers/:actionId/:eevAnswersId.json', {actionId: '', eevId: '@id'}, {
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
});