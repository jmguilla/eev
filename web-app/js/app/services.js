'use strict';
/* Services */
angular.module('eevServices', ['ngResource']).
factory('EEV', function($resource){
  return $resource('/eev/EEV/:actionId/:eevId.json', {actionId: '', eevId: '@id'}, {
  	get:{
  		method: 'GET',
  		params: {
  			actionId: 'get',
  		},
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		}
  	},
  	save: {
		  method: 'POST',
		  params: {
			  actionId: 'save',
		  },
  		headers: {
  			'Content-Type': 'application/json',
  			'Accept': 'application/json'
  		}
	  }
  });
});