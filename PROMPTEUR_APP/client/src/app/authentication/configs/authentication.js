var authenticationModule = angular.module("authentication", [])

.config(['$routeProvider', '$locationProvider', 
	function($routeProvider, $locationProvider) {
		$locationProvider.html5Mode(true);
		$routeProvider.when('/login', { 
			templateUrl: 'authentication/views/login.tpl.html',
			controller: 'AuthenticationCtrl'
		});	

	}
]);
