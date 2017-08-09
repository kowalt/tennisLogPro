(function() {
    'use strict';

    angular
        .module('Module')
        .controller('LogoutController', LogoutController);

    LogoutController.$inject = ['dependency1'];
    function LogoutController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();