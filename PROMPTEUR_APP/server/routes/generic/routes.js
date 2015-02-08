var requestService = require('./../../lib/services/request_service.js');

module.exports = function (app){

	function dalCall(req, res) {
		console.log("======================= DAL CALL ======================");
		
		var path = decodeURIComponent(req.url.substr("/api".length));
		var pathParams = path.split('/');
		var method = req.method;

		requestService.sendToDAL(req.body, path, method, req.cookies.loggedInUser, function(response) {
			res.send(response);
			return response;
		});
	}

	/** API CALLS **/
	app.all('/api/reference/*', dalCall);
	app.all('/api/crm/*', dalCall);
}
