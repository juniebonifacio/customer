widgetModule.controller('IllustrationCtrl', ['$scope', 'PreOnboard', 'Reference',  function ($scope, PreOnboard, Reference) {
	console.log("HELLO FROM SOLUTIO WIDGET!");

	(function getReferences (){
		Reference.getInformationSource(function(source){
			$scope.source = source;
		});
	})();

	function formatParams(object){
		var params = {
			user: {
				firstName      : object.firstName,
				lastName       : object.lastName,
				emailAddress   : object.emailAddress
			},
			member : {
				clientMaster : { id : "729eaffa-a5a4-11e3-baa7-000c29cb0374" }
			},
			details : {
				refUmbInformationSource  : object.source,
				basis                    : object.basis
			}
		};

		return params;
	}

	/*Start of Scope Functions*/
	$scope.checkVal = function () {
		if($scope.form){
			$scope.showOther = angular.equals($scope.form.source, "other") ? true : false;
		}
	};

	$scope.errors = {};
	$scope.submit = function (){
		if( $scope.requestForm.$valid ) {
			console.log("Submitting this form!", $scope.form);
			$scope.success = true;
			var params = {};
			var form = angular.copy($scope.form);		

			if($scope.showOther){
				form.source = form.other;
				delete form.other;
			}

			params = formatParams(form);
			
			PreOnboard.create(params, function(callback){
				console.log("callback", callback);
			});
		} else {
			if(!angular.equals($scope.form.firstName, "")) {
				$scope.errors.firstName = "Please enter a value";
			} else {
				$scope.errors.firstName = "";
			}
		}
	};

	/*End of Scope Functions*/
}]);

