(function() {
    'use strict';

    angular
        .module('Module')
        .controller('NavbarController', NavbarController);

    NavbarController.$inject = ['dependency1'];
    function NavbarController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();