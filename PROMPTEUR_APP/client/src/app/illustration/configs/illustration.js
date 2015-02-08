var widgetModule = angular.module("illustration", ['resources.preOnboard'])

.config(['$routeProvider', '$locationProvider', 
	function($routeProvider, $locationProvider) {
		$locationProvider.html5Mode(true);
		$routeProvider.when('/illustration', { 
			templateUrl: 'illustration/views/illustration.tpl.html',
			controller: 'IllustrationCtrl'
		});	

	}
]);
