mainModule.controller('MainCtrl', ['$scope', '$routeParams', '$location', 'Crm', 'PreOnboard', 'FormService', function ($scope, $routeParams, $location, Crm, PreOnboard, FormService) {
	$scope.message = 'Redirecting....';
	
	var params = { id : $routeParams.id};

	function getRoutes(key){
		FormService.getForm(key, function(path){
			console.log("Redirecting to... ",path);
			$location.path(path + $routeParams.id);				
		});
	}

	function kickStart(){
		PreOnboard.kickStart(params, function(object){
			if(typeof object !== 'undefined'){
				console.log("object", object.formKey);
				getRoutes(object.formKey);
			}
		});
	}

	Crm.create(params, function(callback){
		if(typeof callback !== 'undefined'){
			console.log("callback", callback);
			kickStart(params);
		}
	});

}]);
