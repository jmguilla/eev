'use strict';
/* Services */
angular.module('eevServices', ['ngResource']).
factory('EEVQuestions', function($resource){
  return $resource('/eev/EEVQuestions/:actionId/:eevId.json', {actionId: '', eevId: '@id'}, {
  	get:{
  		method: 'GET',
  		params: {
  			actionId: 'get',
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		}
  	}
  });
}).

factory('EEVAnswers', function($resource){
  return $resource('/eev/EEVAnswers/:actionId/:eevId.json', {actionId: '', eevId: '@id'}, {
  	answer:{
  		method: 'POST',
  		params:{
  			actionId: 'answer'
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		}
  	}
  });
});