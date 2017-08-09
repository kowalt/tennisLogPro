(function() {
    'use strict';

    angular
        .module('Module')
        .controller('MatchesController', MatchesController);

    MatchesController.$inject = ['dependency1'];
    function MatchesController(dependency1) {
        var vm = this;
        

        activate();

        ////////////////

        function activate() { }
    }
})();