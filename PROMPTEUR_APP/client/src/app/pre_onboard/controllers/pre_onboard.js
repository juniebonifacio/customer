preOnboardModule.controller('PreOnboardCtrl', ['$scope', '$routeParams', function ($scope, $routeParams, Reference) {
    $scope.message = 'WELCOME CHOSEN ONE!';
    console.log("$routeParams", $routeParams);

    // Reference.getSalutations(function(salutations){
    //  $scope.salutations = salutations;
    //  console.log(angular.isArray(salutations));
    // });

    $scope.countryList = ["Afghanistan","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antigua and Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia-Herzegovina","Botswana","Bouvet Island","Brazil","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central African Republic","Chad","Chile","China","Christmas Island","Cocos (Keeling) Islands","Colombia","Comoros","Congo, Democratic Republic of the (Zaire)","Congo, Republic of","Cook Islands","Costa Rica","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Guiana","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guadeloupe (French)","Guam (USA)","Guatemala","Guinea","Guinea Bissau","Guyana","Haiti","Holy See","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Ivory Coast (Cote D`Ivoire)","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique (French)","Mauritania","Mauritius","Mayotte","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauru","Nepal","Netherlands","Netherlands Antilles","New Caledonia (French)","New Zealand","Nicaragua","Niger","Nigeria","Niue","Norfolk Island","North Korea","Northern Mariana Islands","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Pitcairn Island","Poland","Polynesia (French)","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Helena","Saint Kitts and Nevis","Saint Lucia","Saint Pierre and Miquelon","Saint Vincent and Grenadines","Samoa","San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia and South Sandwich Islands","South Korea","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Svalbard and Jan Mayen Islands","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor-Leste (East Timor)","Togo","Tokelau","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos Islands","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","Venezuela","Vietnam","Virgin Islands","Wallis and Futuna Islands","Yemen","Zambia","Zimbabwe"];
    $scope.rateList = [{type: "Daily", rate: 0.0, currency: "GBP"}];
    $scope.form = {};

    // Default values
    $scope.tempHomeCountry = "United Kingdom";
    $scope.tempMailCountry = "United Kingdom";
    $scope.sameHomeMailAddress = true;
    $scope.showImmigration = false;
    $scope.showOtherImmigrationStatus = false;
    $scope.showVisaExpiry = false;
    $scope.form.nationality = "United Kingdom";
    $scope.showOtherAgency = false;
    $scope.showOtherAgencyBranch = false;
    $scope.showOtherClient = false;
    $scope.showOtherJobTitle = false;

    $scope.toggleField = function(field) {
        if( field === "nationality" ) {
            if( $scope.form.nationality === "other" ) {
                $scope.showImmigration = true;
            } else {
                $scope.showImmigration = false;
            }
        }

        if( field === "immigration" ) {
            if( $scope.form.immigrationStatus === "work visa" ) {
                $scope.showOtherImmigrationStatus = false;
                $scope.showVisaExpiry = true;
            } else if( $scope.form.immigrationStatus === "other" ) {
                $scope.showOtherImmigrationStatus = true;
                $scope.showVisaExpiry = true;
            } else {
                $scope.showOtherImmigrationStatus = false;
                $scope.showVisaExpiry = false;
            }
        }

        if( field === "agency" ) {
            if( $scope.form.agency === "other" ) {
                $scope.showOtherAgency = true;
            } else {
                $scope.showOtherAgency = false;
            }
        }

        if( field === "agency branch" ) {
            if( $scope.form.agencyBranch === "other" ) {
                $scope.showOtherAgencyBranch = true;
            } else {
                $scope.showOtherAgencyBranch = false;
            }
        }

        if( field === "client" ) {
            if( $scope.form.client === "other" ) {
                $scope.showOtherClient = true;
            } else {
                $scope.showOtherClient = false;
            }
        }

        if( field === "job title" ) {
            if( $scope.form.jobTitle === "other" ) {
                $scope.showOtherJobTitle = true;
            } else {
                $scope.showOtherJobTitle = false;
            }
        }
    };

    $scope.addRateLine = function() {
        var newRate = {type: "Daily", rate: 0.0, currency: "GBP"};
        $scope.rateList.push(newRate);
    };

    $scope.removeRateLine = function(index) {
        $scope.rateList.splice(index,1);
    };
}]);
