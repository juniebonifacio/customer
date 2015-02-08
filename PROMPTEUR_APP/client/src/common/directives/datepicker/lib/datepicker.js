angular.module('directives.datepicker', [])

.directive('datePicker', ['$parse',function($parse) {
  return {
    restrict: "A", 
    link: function (scope, element, attrs, controller) {
      var ngModel = $parse(attrs.ngModel);    

      attrs.$observe('data', function(value) {

        var now = moment(Date.now()).format("MM/DD/YYYY");
        var initial = new Date(value);

        if(initial < now) {
          element.unbind();
        }
      });

      element.datepicker({
        dateFormat: 'mm/dd/yy',
        changeMonth: true,
        numberOfMonths: 3,
        minDate: '0',
        onClose: function(selectedDate, inst) {
         
          if (selectedDate === '') {
            element.datepicker({minDate:'0'});
          } else {
            scope.$apply(function(scope) {
              ngModel.assign(scope, selectedDate);
            });
          }

        }
      });
    }
  };
}])

.directive('endDatePicker', ['$parse',function($parse) {
  return {
    restrict: "A",  
    link: function (scope, element, attrs, controller) {
      var ngModel = $parse(attrs.ngModel);   
      var startData = '0';
      
      attrs.$observe('startData', function(value) {
        console.log('startData has changed value to ' + value);
        startData = value;
        if (value) {
          element.datepicker("option", "minDate", value);
        } else {
          element.datepicker("option", "minDate", '0');
        }
        
      });

      element.datepicker({
        dateFormat: 'mm/dd/yy',
        minDate: startData,
        changeMonth: true,
        numberOfMonths: 3,      
        onClose: function(selectedDate, inst) {
          if (selectedDate === '') {
            element.datepicker({minDate:'0'});
          }
          else {           
            scope.$apply(function(scope) {
              ngModel.assign(scope, selectedDate);
            });
          }
        }
      });
    }
  };  
}])

.directive('dateFrom', ['$parse',function($parse) {
  return {
    restrict: "A", 
    link: function (scope, element, attrs, controller) {
      var ngModel = $parse(attrs.ngModel);    

      // attrs.$observe('data', function(value) {

      //   var now = moment(Date.now()).format("MM/DD/YYYY");
      //   var initial = new Date(value);

      //   if(initial < now) {
      //     element.unbind();
      //   }
      // });

      element.datepicker({
        dateFormat: 'mm/dd/yy',
        changeMonth: true,
        numberOfMonths: 1,
        //minDate: '0',
        onClose: function(selectedDate, inst) {
         
          if (selectedDate === '') {
            element.datepicker({minDate:'0'});
          } else {
            scope.$apply(function(scope) {
              ngModel.assign(scope, selectedDate);
            });
          }

        }
      });
    }
  };
}])

.directive('dateTo', ['$parse',function($parse) {
  return {
    restrict: "A",  
    link: function (scope, element, attrs, controller) {
      var ngModel = $parse(attrs.ngModel);   
      var startData = '0';
      
      attrs.$observe('startData', function(value) {
        console.log('startData has changed value to ' + value);
        startData = value;
        element.datepicker("option", "minDate", value);
      });

      element.datepicker({
        dateFormat: 'mm/dd/yy',
        minDate: startData,
        changeMonth: true,
        numberOfMonths: 1,      
        onClose: function(selectedDate, inst) {
          if (selectedDate === '') {
            element.datepicker({minDate:'0'});
          }
          else {           
            scope.$apply(function(scope) {
              ngModel.assign(scope, selectedDate);
            });
          }
        }
      });
    }
  };
}])

.directive('pastDatePicker', ['$parse',function($parse) {
  return {
    restrict: "A",  
    link: function (scope, element, attrs, controller) {
      var ngModel = $parse(attrs.ngModel);   
      var startData = '0';
      
      attrs.$observe('startData', function(value) {
        console.log('startData has changed value to ' + value);
        startData = value;
        if (value) {
          element.datepicker("option", "minDate", value);
        } else {
          element.datepicker("option", "minDate", '0');
        }
        
      });

      element.datepicker({
        dateFormat: 'mm/dd/yy',
        minDate: startData,
        changeMonth: true,
        numberOfMonths: 3,
        maxDate: '+0D',
        onClose: function(selectedDate, inst) {
          if (selectedDate === '') {
            element.datepicker({minDate:'0'});
          }
          else {           
            scope.$apply(function(scope) {
              ngModel.assign(scope, selectedDate);
            });
          }
        }
      });
    }
  };  
}]);