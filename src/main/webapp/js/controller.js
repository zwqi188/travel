travelApp.controller('registerController', function($scope, $http, $state, $stateParams, Http) {
    console.log($stateParams);

    $scope.registerFromServer = function () {
        console.log($scope.mobile);
        var param = {
            'mobile':$scope.mobile,
            'password':$scope.password
        };
        Http.go($http,
            'POST',
            '/travel/register.json',
            param,
            function(data){alert(data.respMsg)},
            function(data){alert(data.respMsg)});
    }

    $scope.getFromServer = function () {
        Http.go($http,
            'GET',
            '/travel/get.json',
            null,
            function(data){alert(data)},
            function(data){alert(data)});
    }

});