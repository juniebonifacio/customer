var forms = {
	consultant_pre_onboarding_workflow_usertask1 : "/preonboard/"
};

exports.getForm = function(key, callback){
	return callback(forms[key]);
};