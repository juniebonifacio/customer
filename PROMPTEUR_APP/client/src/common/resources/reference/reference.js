angular.module('resources.reference', ['ngResource']).factory('Reference', ['$resource', '$cacheFactory', function($resource, $cacheFactory) {
  var resource = $resource('/api/reference/:context', 
    {context: '@context'},
    {getAllSalutation: { method: 'GET', params: { context: 'salutation' }, isArray: true},
    getAllMaritalStatus: { method: 'POST', params: { context: 'maritalStatus' }, isArray: true},
    getAllImmigrationStatus: { method: 'POST', params: { context: 'immigrationStatus' }, isArray: true},
    getAllInformationSource: { method: 'GET', params: { context: 'informationSource' }, isArray: true}
  });

  return {
    getSalutations: function(callback) {
      resource.getAllSalutation(function(salutations) {
        return callback(salutations);
      });
    },
    getMaritalStatus: function(callback) {
      resource.getAllMaritalStatus(function(salutations) {
        return callback(salutations);
      });
    },
    getImmigrationStatus: function(callback) {
      resource.getAllImmigrationStatus(function(salutations) {
        return callback(salutations);
      });
    },
    getInformationSource: function(callback) {
      resource.getAllInformationSource(function(salutations) {
        return callback(salutations);
      });
    }
  };
}]);
