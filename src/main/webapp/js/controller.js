travelApp.controller('registerController', function($scope, $http, $state, $stateParams, Http, constantFactory) {
    $scope.registerFromServer = function () {
        console.log($scope.mobile);
        var param = {
            'mobile':$scope.mobile,
            'password':$scope.password
        };
        Http.go($http,
            constantFactory.HTTP_METHOD_POST,
            constantFactory.URL_REGISTER,
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