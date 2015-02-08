var homeModule = angular.module("home", [])

.config(['$routeProvider', '$locationProvider', 
	function($routeProvider, $locationProvider) {
		$locationProvider.html5Mode(true);
		$routeProvider.when('/home', { 
			templateUrl: 'home/views/home.tpl.html',
			controller: 'HomeCtrl'
		});	

	}
]);
