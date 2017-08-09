(function() {
    'use strict';

    angular
        .module('Module')
        .controller('AdministrationController', AdministrationController);

    AdministrationController.$inject = ['dependency1'];
    function AdministrationController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();