(function() {
    'use strict';

    angular
        .module('Module')
        .controller('TournamentsListController', TournamentsListController);

    TournamentsListController.$inject = ['dependency1'];
    function TournamentsListController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();