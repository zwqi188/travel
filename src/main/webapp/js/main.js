/*
 * 应用路由配置,控制器
 * 
 * By YuGii
 */
var beeApp = angular.module('beeApp', ['ngRoute', 'ngCookies', 'ngProject']);

// 配置路由
beeApp.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: './html/welcome.html'
        })
        .when('/serviceAreaManage', {
            templateUrl: './html/serviceAreaManage.html',
            controller: 'serviceAreaManageController'
        })
        .when('/salerManage', {
            templateUrl: './html/salerManage.html',
            controller: 'salerManageController'
        })
        .when('/productManage', {
            templateUrl: './html/productManage.html',
            controller: 'productManageController'
        })
        .when('/transManage', {
            templateUrl: './html/transManage.html',
            controller: 'transManageController'
        })
        .when('/reportManage', {
            templateUrl: './html/reportManage.html',
            controller: 'reportManageController'
        })
        .when('/pushManage', {
            templateUrl: './html/pushManage.html',
            controller: 'pushManageController'
        })
        .when('/rePassword', {
            templateUrl: './html/rePassword.html',
            controller: 'rePasswordController'
        })
        .otherwise({
            redirectTo: '/'
        });
}]);

// 主页控制器
beeApp.controller('indexController', function (Web, Util, $scope, $location, $route) {
    Web.autoLogin($scope);
    $scope.user = {"username":$scope.username,"password":""};
    $scope.login = function () {
        console.log('登陆');
        var pwd = $scope.user.password != null ? $scope.user.password : document.getElementById('password').value;
        if (pwd != null) {
//            $scope.user.password = Util.md5(pwd);
            Web.login($scope);
        }
    }
    $scope.route = function (page) {
        console.log('切换到' + page);
        console.log('url=' + $location.url() + ' page=' + page);
        if (!$scope.isLogin) {
            page = '/';
        }
        if ($location.url() == page) {
            $route.reload();
        } else {
            $location.path(page);
        }
    }
    $scope.logout = function () {
        console.log('退出登陆');
        Web.logout($scope);
    }
});

// 服务区域管理控制器
beeApp.controller('serviceAreaManageController', function (Web, $scope, $location) {
    var load = function () {
        Web.post('/serviceArea/search.do', null, $scope.searchParam, $scope);
    }
    if ($scope.isLogin) {
        load();
    } else {
        $location.path('/');
    }
    $scope.search = function () {
        console.log('查询');
        load();
    }
    $scope.switchStatus = function (serviceArea) {
        console.log('启用/禁用切换');
        Web.post('/serviceArea/switchStatus.do', {"areaId":serviceArea.areaId,"status":serviceArea.status}, $scope.searchParam, $scope);
    }
    $scope.add = function () {
        console.log('新增');
        $scope.pageStatus = 'add';
    }
    $scope.edit = function (serviceArea) {
        console.log('编辑');
        $scope.pageStatus = 'edit';
        $scope.editParam = serviceArea;
    }
    $scope.del = function (areaId) {
        console.log('删除');
        if (window.confirm('确定删除？') == true)
        	Web.post('/serviceArea/delete.do', {"areaId":areaId}, $scope.searchParam, $scope);
    }
    $scope.delChecked = function () {
    	console.log('删除已选中');
    	var ids = '';
    	var count = 0;
    	var box = document.getElementsByName('box');
    	for (var i = 0; i < box.length; i++) {
			if (box[i].checked) {
				count++;
				ids += box[i].value + '_';
			}
		}
    	if (ids.length < 1) {
    		window.confirm('没有选中任何行');
		} else {
			ids = ids.substr(0, ids.length - 1);
			console.log(ids);
			if (window.confirm('确定删除这'+count+'行？') == true)
				Web.post('/serviceArea/delete.do', {"areaId":ids}, $scope.searchParam, $scope);
		}
    }
    $scope.save = function () {
        console.log('保存');
        Web.post('/serviceArea/save.do', null, $scope.editParam, $scope);
        $scope.pageStatus = 'list';
        $scope.editParam = {};
    }
    Web.pageInit($scope, load);
});

// 店员管理控制器
beeApp.controller('salerManageController', function (Web, $scope, $location) {
    var load = function () {
        Web.post('/saler/search.do', null, $scope.searchParam, $scope);
    }
    if ($scope.isLogin) {
        load();
    } else {
        $location.path('/');
    }
    $scope.search = function () {
        console.log('查询');
        load();
    }
    $scope.switchStatus = function (saler) {
        console.log('启用/禁用切换');
        Web.post('/saler/switchStatus.do', {"userId":saler.userId,"status":saler.status}, $scope.searchParam, $scope);
    }
    $scope.add = function () {
        console.log('新增');
        $scope.pageStatus = 'add';
    }
    $scope.edit = function (serviceArea) {
        console.log('编辑');
        $scope.pageStatus = 'edit';
        $scope.editParam = serviceArea;
    }
    $scope.del = function (userId) {
        console.log('删除');
        if (window.confirm('确定删除？') == true)
        	Web.post('/saler/delete.do', {"userId":userId}, $scope.searchParam, $scope);
    }
    $scope.delChecked = function () {
    	console.log('删除已选中');
    	var ids = '';
    	var count = 0;
    	var box = document.getElementsByName('box');
    	for (var i = 0; i < box.length; i++) {
			if (box[i].checked) {
				count++;
				ids += box[i].value + '_';
			}
		}
    	if (ids.length < 1) {
    		window.confirm('没有选中任何行');
		} else {
			ids = ids.substr(0, ids.length - 1);
			console.log(ids);
			if (window.confirm('确定删除这'+count+'行？') == true)
				Web.post('/saler/delete.do', {"userId":ids}, $scope.searchParam, $scope);
		}
    }
    $scope.save = function () {
        console.log('保存');
        Web.post('/saler/save.do', null, $scope.editParam, $scope);
        $scope.pageStatus = 'list';
        $scope.editParam = {};
    }
    Web.pageInit($scope, load);
});

// 产品管理控制器
beeApp.controller('productManageController', function (Web, $scope, $location) {
    var load = function () {
        Web.post('/product/search.do', null, $scope.searchParam, $scope);
    }
    if ($scope.isLogin) {
        load();
    } else {
        $location.path('/');
    }
    $scope.search = function () {
        console.log('查询');
        load();
    }
    $scope.switchStatus = function (product) {
        console.log('启用/禁用切换');
        Web.post('/product/switchStatus.do', {}, $scope.searchParam, $scope);
    }
    $scope.add = function () {
        console.log('新增');
        $scope.pageStatus = 'add';
    }
    $scope.edit = function (product) {
        console.log('编辑');
        $scope.pageStatus = 'edit';
        $scope.editParam = product;
    }
    $scope.del = function (areaId) {
        console.log('删除');
        Web.post('/serviceArea/delete.do', {"areaId":areaId}, $scope.searchParam, $scope);
    }
    $scope.delChecked = function () {
    	console.log('删除已选中');
    }
    $scope.save = function () {
        console.log('保存');
        Web.post('/product/save.do', null, $scope.editParam, $scope);
        $scope.pageStatus = 'list';
    }
    Web.pageInit($scope, load);
});

// 交易管理控制器
beeApp.controller('transManageController', function (Web, $scope, $location) {
    if ($scope.isLogin) {
    } else {
        $location.path('/');
    }
    Web.pageInit($scope, load);
});

// 报表管理控制器
beeApp.controller('reportManageController', function (Web, $scope, $location) {
    if ($scope.isLogin) {
    } else {
        $location.path('/');
    }
});

// 推送管理控制器
beeApp.controller('pushManageController', function (Web, $scope, $location) {
    if ($scope.isLogin) {
    } else {
        $location.path('/');
    }
});

// 修改密码控制器
beeApp.controller('rePasswordController', function (Web, $scope, $location) {
    if ($scope.isLogin) {
    } else {
        $location.path('/');
    }
    $scope.save = function() {
    	Web.upassword($scope.user);
    }
});
