var requestService = require('./../../lib/services/request_service.js');
var FormService = require('./../../lib/services/form_service.js');
var Emailer = require('./../../lib/emailer/emailer.js');

module.exports = function (app){
	function preOnboarding(req, res){
		console.log("======================= DAL CALL ======================");
		
		var path = decodeURIComponent(req.url.substr("/api".length));
		var pathParams = path.split('/');
		var method = req.method;

		requestService.sendToDAL(req.body, path, method, req.cookies.loggedInUser, function(response) {
			var parsedResp = JSON.parse(response);
			var params = {
				emailAddress: parsedResp.member.emailAddress,
				id          : parsedResp._id		
			};

			Emailer.emailPreOnboard(params, function(emailed){
				console.log("Emailed?", emailed);
			});

			res.send(response);
		});
	}

	function kickStart(req, res){
		console.log("======================= DAL CALL ======================");
		
		var path = decodeURIComponent(req.url.substr("/api".length));
		var pathParams = path.split('/');
		var method = req.method;

		requestService.sendToDAL(req.body, path, method, req.cookies.loggedInUser, function(response) {
			var parsedResp = JSON.parse(response);
			FormService.getForm(parsedResp.formkey);
			res.send();
		});
	}

	app.post('/api/preonboarding/insert', preOnboarding);
	app.post('/api/preonboarding/start', kickStart);
}