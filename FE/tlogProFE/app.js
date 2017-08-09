(function() {
    'use strict';

    var app = angular.module('tennisLogPro', [
        'ngRoute'
    ]);
    app.config(['$routeProvider', function($routeProvider) {
        $routeProvider.when('/login', {
            templateUrl: 'views/login.html',
            controller: 'LoginController'
        })
        .when('/register', {
            templateUrl: 'views/register.html',
            controller: 'RegisterController'
        })
        .when('/tournaments', {
            templateUrl: 'views/tournaments/list.html',
            controller: 'TournamentsListController'
        })
        .when('/tournaments/create', {
            templateUrl: 'views/tournaments/create.html',
            controller: 'TournamentsCreateController'
        })
        .when('/tournaments/edit', {
            templateUrl: 'views/tournaments/edit.html',
            controller: 'TournamentsEditController'
        })
        .when('/tournaments/manageApplications', {
            templateUrl: 'views/tournaments/manageApplications.html',
            controller: 'TournamentsManageApplicationsController'
        })
        .when('/matches', {
            templateUrl: 'views/matches.html',
            controller: 'MatchesController'
        })
        .when('/manageAccount', {
            templateUrl: 'views/manageAccount.html',
            controller: 'ManageAccountController'
        })
        .when('/administration', {
            templateUrl: 'views/administration.html',
            controller: 'AdministrationController'
        })
        .when('/passwordRecovery', {
            templateUrl: 'views/passwordRecovery.html',
            controller: 'PasswordRecoveryController'
        })
        .when('/logout', {
            templateUrl: 'views/login.html',
            controller: 'LogoutCtrl'
        })
        .otherwise({
            redirectTo: '/login'
        })
    }]);
})();