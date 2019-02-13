/**
 * Created by mac on 2019/2/11.
 * qizhengwei
 */
var travelApp = angular.module('travelApp', ['ngRoute', 'ngCookies']);

/**
 * 路由
 */


/**
 * Controller
 */
travelApp.controller('indexController', function ($scope) {
    $scope.ssd = function () {
        var name = $scope.name;
        var msg = {"name": name};
        console.log(msg);
        console.log($scope.name);
    }
});
