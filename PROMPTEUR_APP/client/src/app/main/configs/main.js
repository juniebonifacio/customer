/*
 * Copyright (c) 2013  uPraxis Global Limited
 * All rights reserved. No part of this code or any of its contents may be reproduced, copied, modified or adapted.
 */
var mainModule = angular.module("main", ['resources.crm'])

.config(['$routeProvider', '$locationProvider', 
	function($routeProvider, $locationProvider) {
		$locationProvider.html5Mode(true);
		
		$routeProvider.when('/redirect/:id', { 
			controller: 'MainCtrl',
			templateUrl: 'main/views/main.tpl.html'
		});
	}
]);
