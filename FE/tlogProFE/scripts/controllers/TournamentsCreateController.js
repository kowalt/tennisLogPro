(function() {
    'use strict';

    angular
        .module('Module')
        .controller('TournamentsCreateController', TournamentsCreateController);

    TournamentsCreateController.$inject = ['dependency1'];
    function TournamentsCreateController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();