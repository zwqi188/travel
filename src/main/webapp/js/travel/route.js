/**
 * Created by mac on 2019/2/11.
 * qizhengwei
 * 路由配置
 */

var travelApp = angular.module('travelApp', ['ngRoute']);

travelApp.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: './index.html'
        })
        .when('/registerManage', {
            templateUrl: './html/register.html',
            controller: 'registerManageController'
        })
        .when('/header.html', {
            templateUrl: 'html/template/header.html',
        })
        .otherwise({
            redirectTo: '/'
        });
}]);