(function() {
    'use strict';

    angular
        .module('Module')
        .controller('RegisterController', RegisterController);

    RegisterController.$inject = ['dependency1'];
    function RegisterController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();