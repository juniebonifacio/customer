var config = require('./../../configs/config.js');
var request = require('request');

var DAL_SUCCESS = '1';
var DAL_FAIL = '0';

exports.sendToDAL = function(data, url, method, loggedInUser, callback) {

  var header = request.jar();
  var cookie = request.cookie("loggedInUser="+loggedInUser);
  header.add(cookie);

  var requestObject = {
    uri  : config.dal.url + url,
    json : data,
    jar  : header
  };

  console.log("Accessing :", requestObject.uri);
  
  var requestCallback = function(err, resp, body) {
    var data = {errors: ''};
    
    try {
      if (typeof body === 'undefined') {        
        data = {'errors': 'No response from server...'};
      } else {
        data = body;
        if (data.toString().indexOf('<') >= 0) {
          data = { 'errors': 'Server has encountered an error. - ' + data };
        } else if (data.status === DAL_FAIL) {
          data = { 'errors': data.dataParam };
        } else if (data.dataParam === null) {
          data = { 'errors': data };
        } else {
          data = JSON.stringify(data.dataParam);
        }
      }
    } catch (e) {
      console.log(e.stack);
      data = { errors: e.stack };
    }

    if (data.errors) {
      console.log('[ERROR]', data.errors, url);
    }

    return callback(data);
  };

  if (method === 'POST') {
    request.post(requestObject, requestCallback);
  } else if (method === 'GET') {
    request.get(requestObject, requestCallback);
  }
};