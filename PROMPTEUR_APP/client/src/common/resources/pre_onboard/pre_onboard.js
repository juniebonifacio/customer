angular.module('resources.preOnboard', ['ngResource']).factory('PreOnboard', ['$resource', function($resource) {
  var resource = $resource('/api/preonboarding/:action', 
    {action: '@action'},
    {insert: { method: 'POST', params: { action: 'insert' }},
      start: { method: 'POST', params: { action: 'start' }}
  });

  return {
    create: function(object, callback) {
      resource.insert(object, function(savedObject) {
        return callback(savedObject);
      });
    },
    kickStart: function(object, callback) {
      resource.start(object, function(value){
        return callback(value);
      });
    }
  };
}]);