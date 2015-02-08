angular.module('services.form', []).service('FormService', [ function () {

	var forms = {
		consultant_pre_onboarding_workflow_usertask1 : "/preonboard/"
	};

	function getForm(key, callback){
		callback(forms[key]);
	}

	return {
		getForm : function(key, callback){
			getForm(key, callback);
		}
	};
}]);