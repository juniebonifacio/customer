angular.module('directives.messaging', [
  ]).directive('messaging', ['$timeout', function($timeout) {
    function Linker($scope) {
      // linker
    }

    function Controller($scope) {
      // controller
    }

    Controller['$inject'] = ['$scope'];
    Linker['$inject'] = ['$scope'];
    return {
        restrict: 'E',
        templateUrl: 'directives/messaging/views/messaging.tpl.html',
        replace: true,
        link: Linker,
        controller: Controller
    };
}]);
