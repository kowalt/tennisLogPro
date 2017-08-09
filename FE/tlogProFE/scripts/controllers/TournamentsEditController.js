(function() {
    'use strict';

    angular
        .module('Module')
        .controller('TournamentsEditController', TournamentsEditController);

    TournamentsEditController.$inject = ['dependency1'];
    function TournamentsEditController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();