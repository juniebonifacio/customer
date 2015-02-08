var preOnboardModule = angular.module("preOnboard", [])

.config(['$routeProvider', '$locationProvider', 
	function($routeProvider, $locationProvider) {
		$locationProvider.html5Mode(true);
		
		$routeProvider.when('/preonboard/:id', { 
			controller: 'PreOnboardCtrl', 
			templateUrl: 'pre_onboard/views/pre_onboard.tpl.html'
		});
	}
]);