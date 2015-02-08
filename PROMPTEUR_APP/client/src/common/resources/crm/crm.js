angular.module('resources.crm', ['ngResource']).factory('Crm', ['$resource', function($resource) {
  var resource = $resource('/api/crm/:action', 
    {action: '@action'},
    {insert: { method: 'POST', params: { action: 'insert' }}
  });

  return {
    create: function(object, callback) {
      resource.insert(object, function(savedObject) {
        return callback(savedObject);
      });
    }
  };
}]);