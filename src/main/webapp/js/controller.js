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
                if(data.respCode == ConstantFactory.RESP_CODE_1000) {
                    $scope.userName = data.data.userName;
                    $rootScope.$broadcast(ConstantFactory.LOGIN_MESSAGE, data.data);
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
            $rootScope.loginUser = null;
            $rootScope.isLogin = false;
        } else {
            if(!Utils.isEmpty(data.nickName)) {
                $rootScope.loginUser = data.nickName;
            }else if(!Utils.isEmpty(data.userName)) {
                $rootScope.loginUser = data.userName;
            } else {
                $rootScope.loginUser = data.userId;
            }
            $rootScope.user = data;
            $rootScope.isLogin = true;
        }

    });
    /**
     * 退出
     */
    $scope.loginOut = function () {
      $rootScope.$broadcast(ConstantFactory.LOGIN_MESSAGE, null);
    };
});

/**
 * 用户中心controller
 */
travelApp.controller('userCenterController', function ($scope, $rootScope, $http, $state, Http, Utils, ConstantFactory, Cities) {


    var province = Cities.getList(ConstantFactory.CITEIS);
    $scope.provinceList = province;

    var userId = $rootScope.user.userId;
    if(Utils.isEmpty(userId)){
        alert("你还未登录，请先登录！");
        $state.go('loginView');
        return;
    }
    var param = {
        'userId' : userId.toString()
    };

    Http.go($http,
        ConstantFactory.HTTP_METHOD_POST,
        ConstantFactory.URL_GET_USERINFO_BY_USERID,
        param,
        function (data) {
            if(data.respCode == ConstantFactory.RESP_CODE_1000) {
                $scope.userName = data.data.userName;
                $scope.nickName = data.data.nickName;
                $scope.address = data.data.address;
                $scope.idCard = data.data.idCard;
                $scope.gender = data.data.gender;
            }
        },function (data) {

        });

    $scope.getCities = function () {
        var cityList = Cities.getList(ConstantFactory.CITEIS[$scope.province])
        $scope.cityList = cityList;
    };

    $scope.getArea = function () {
        var areaList = ConstantFactory.CITEIS[$scope.province][$scope.city];
        $scope.areaList = areaList;
    };

    $scope.updateUserInfoByUserId = function () {
        var userId = $rootScope.user.userId;
        if(Utils.isEmpty(userId)){
            alert("你还未登录，请先登录！");
            $state.go('loginView');
            return;
        }
        var address = {
            'province':$scope.province,
            'city':$scope.city,
            'area':$scope.area,
            'detail':$scope.detail
        };
        var param = {
            'userId' : userId.toString(),
            'userName': $scope.userName,
            'nickName': $scope.nickName,
            'address': JSON.stringify(address),
            'idCard': $scope.idCard,
            'gender': $scope.gender
        };
        Http.go($http,
            ConstantFactory.HTTP_METHOD_POST,
            ConstantFactory.URL_UPDATE_USERINFO,
            param,
            function (data) {
                if(data.respCode == ConstantFactory.RESP_CODE_1000) {
                   alert(data.respMsg);
                }
            },function (data) {
                alert(data.respMsg);
            });

    };

});