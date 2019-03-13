travelApp.controller('registerController', function($scope, $http, $state, $stateParams) {
    console.log($stateParams);

    $scope.registerFromServer = function () {
        console.log("registerFromServer");
        console.log($stateParams);
        $http.post({
            method:'POST',
            url:'/register.json',
            data:''
        }).success(function(data, status, headers, config){
            console.log(data, status, headers, config);
        }).error(function(data, status, headers, config){
            console.log(data, status, headers, config);
        });
    }
});