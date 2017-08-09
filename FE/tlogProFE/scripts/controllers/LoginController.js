(function() {
    'use strict';

    angular
        .module('Module')
        .controller('LoginController', LoginController);

    LoginController.$inject = ['dependency1'];
    function LoginController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();