angular.module('directives.topbar', [
  ]).directive('topbar', ['$timeout', function($timeout) {
    function Linker($scope) {
      // linker
    }

    function Controller($scope) {
        $scope.showNotifications = false;
        $scope.togglePopup = function(type) {
            if( type === "notifications" ) {
                $scope.showNotifications = !$scope.showNotifications;
            }
        };
    }

    Controller['$inject'] = ['$scope'];
    Linker['$inject'] = ['$scope'];
    return {
        restrict: 'E',
        templateUrl: 'directives/topbar/views/topbar.tpl.html',
        replace: true,
        link: Linker,
        controller: Controller
    };
}]);
