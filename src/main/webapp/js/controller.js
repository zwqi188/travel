travelApp.controller('registerController', function($scope, $http, $state, $stateParams) {
    console.log($stateParams);

    $scope.registerFromServer = function () {
        console.log("registerFromServer");
        console.log($stateParams);
        $http.post({
            method:'POST',
            url:'/travel/register.json',
            data:'{mobile:123143243,password:12345}'
        }).success(function(data, status, headers, config){
            console.log(data, status, headers, config);
        }).error(function(data, status, headers, config){
            console.log(data, status, headers, config);
        });
    }
    $scope.getFromServer = function () {
        $http.get('/travel/get.json')
            .success(function (data) {
                console.log(data);
            });
    }

});