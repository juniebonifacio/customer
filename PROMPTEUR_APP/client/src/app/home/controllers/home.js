authenticationModule.controller('HomeCtrl', ['$scope', function ($scope) {
	console.log("HELLO FROM SOLUTIO HOME!");

	// Defaults
	$scope.showMain = "home";

	$scope.changeMain = function(page) {
		$scope.showMain = page;
	};
}]);

