(function() {
    'use strict';

    angular
        .module('Module')
        .controller('PasswordRecoveryController', PasswordRecoveryController);

    PasswordRecoveryController.$inject = ['dependency1'];
    function PasswordRecoveryController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();