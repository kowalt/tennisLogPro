(function() {
    'use strict';

    angular
        .module('Module')
        .controller('ManageAccountController', ManageAccountController);

    ManageAccountController.$inject = ['dependency1'];
    function ManageAccountController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();