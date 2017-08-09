(function() {
    'use strict';

    angular
        .module('Module')
        .controller('TournamentsManageApplicationsController', TournamentsManageApplicationsController);

    TournamentsManageApplicationsController.$inject = ['dependency1'];
    function TournamentsManageApplicationsController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();