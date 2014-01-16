'use strict';
/* App config */
/*app.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
	  $routeProvider.when('/gymlib/user/:actionId/:userId', {controller: 'UserCtrl'});
}]);
*/
        function logEvent(event) {
        	console.log(event);
        }
       
        window.applicationCache.addEventListener('checking',logEvent,false);
        window.applicationCache.addEventListener('noupdate',logEvent,false);
        window.applicationCache.addEventListener('downloading',logEvent,false);
        window.applicationCache.addEventListener('cached',logEvent,false);
        window.applicationCache.addEventListener('updateready',logEvent,false);
        window.applicationCache.addEventListener('obsolete',logEvent,false);
        window.applicationCache.addEventListener('error',logEvent,false);
        
        window.onerror=function(m,u,l){
        	alert(m+"\n"+u+":"+l);
        	};
