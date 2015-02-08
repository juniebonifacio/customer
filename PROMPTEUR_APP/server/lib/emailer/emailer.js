var nodemailer = require('nodemailer');
var config = require('./../../configs/config.js')
// create reusable transport method (opens pool of SMTP connections)
var smtpTransport = nodemailer.createTransport("SMTP", config.email);

exports.emailPreOnboard = function (params, callback){
	var emailOptions = {
		from    : "Support <support@upraxis.com>",
		to      : params.emailAddress,
		subject : "[Solutio] Sign Up!",
		html    : "<a href='" + config.website.url + "redirect/" + params.id + "'>Sign Up</a>"
	};

	smtpTransport.sendMail(emailOptions, function (error, response) {
		if(error){
			console.log(new Date(), "Failed to send!", error);				
			callback(false);
		} else {
			console.log(new Date(), "Message Sent!", response);
			callback(true);
		}
	});
};