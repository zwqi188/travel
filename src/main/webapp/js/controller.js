travelApp.controller('registerController', function($scope, $http, $state, $stateParams) {
    console.log($stateParams);

    $scope.registerFromServer = function () {
        console.log("registerFromServer");
        console.log($stateParams);
        $http({
            method:'POST',
            url:'/travel/register.json',
            data:{'mobile':'123143','password':'12345'}
        }).success(function(data){
            alert(data.respMsg);
        }).error(function(data, status, headers, config){
            alert(data.respMsg);
        });
    }
    $scope.getFromServer = function () {
        $http('/travel/get.json')
            .success(function (data) {
                console.log(data);
            });
    }

});