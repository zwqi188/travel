/**
 * 注册
 */
travelApp.controller('registerController', function($scope, $http, $state, $stateParams, Http, Utils, ConstantFactory) {
    $scope.registerFromServer = function () {
        var password = $scope.password;
        var password2 = $scope.password2;
        var mobile = $scope.mobile;
        var checkCode = $scope.checkCode;
        var agreement = $scope.agreement;
        if(!agreement) {
            alert('如若使用乐游网服务，请先同意本站条约');
            return;
        }
        if(mobile.length != 11) {
            alert('手机号码错误');
            return;
        }
        if(Utils.isEmpty(checkCode)) {
            alert('请输入验证码');
            return;
        }
        if(Utils.isEmpty(password) || Utils.isEmpty(password2)) {
            alert('请输入密码');
            return;
        }
        if(password != password2) {
            alert('两次密码不一致');
            return;
        }
        var md5Password = hex_md5(password);
        var param = {
            'mobile':mobile,
            'password':md5Password,
            'checkCode':checkCode
        };
        //请求服务器进行注册
        Http.go($http,
            ConstantFactory.HTTP_METHOD_POST,
            ConstantFactory.URL_REGISTER,
            param,
            function(data){alert(data.respMsg)},
            function(data){alert(data.respMsg)});
    }

});
/**
 * 登录
 */
travelApp.controller('loginController', function ($scope, $rootScope, $http, $state, Http, Utils, ConstantFactory) {

    $scope.loginFromServer = function () {
        var account = $scope.account;
        var password = $scope.password;
        var md5Password = hex_md5(password);
        if(Utils.isEmpty(account) || Utils.isEmpty(password)) {
            alert("请输入用户名或密码");
            return;
        }
        var param = {
            'account' : account,
            'password' : md5Password
        };

        Http.go($http,
            ConstantFactory.HTTP_METHOD_POST,
            ConstantFactory.URL_LOGIN,
            param,
            function (data) {
                if(data.respCode == "1000") {
                    $scope.userName = data.data.userName;
                    $rootScope.$broadcast(ConstantFactory.LOGIN_MESSAGE, data.data);
                    alert(data.respMsg);
                    $state.go('index');
                    return;
                }
                alert(data.respMsg);
            },
            function (data) {
                alert(data.respMsg);
            });
    }

});
/**
 * 网页头部
 */
travelApp.controller('headerController', function ($scope, $rootScope, Utils, ConstantFactory) {

    $rootScope.$on(ConstantFactory.LOGIN_MESSAGE,function (event, data) {
        if(Utils.isEmpty(data)){
            $rootScope.user = null;
            $rootScope.isLogin = false;
        } else {
            if(!Utils.isEmpty(data.nickName)) {
                $rootScope.user = data.nickName;
            }else if(!Utils.isEmpty(data.userName)) {
                $rootScope.user = data.userName;
            } else {
                $rootScope.user = data.userId;
            }
            $rootScope.isLogin = true;
        }

    });
});