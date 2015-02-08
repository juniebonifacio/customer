
var app = angular.module('SolutioApp', [    
    /** [VENDORS] **/
    'ngRoute',
    'templates.app',
    'templates.common',
    'ui',
    'ui.bootstrap',

    /** [MODULES] **/
    'main',
    'illustration',
    'preOnboard',
    'authentication',
    'home',

    /** [RESOURCES] **/
    'resources.reference',

    /** [SERVICES] **/
    'services.form',

    /** [DIRECTIVES] **/
    'directives.datepicker',
    'directives.topbar',
    'directives.messaging'
]);