/**
 * Http服务
 */
travelApp.service('Http', function() {
    this.go = function ($http,method,url,param,callbackSucc,callbackErr) {
        $http({
            method:method,
            headers: {
                "Content-Type":"application/json"
            },
            url:url,
            data:param
        }).success(function(data){
            callbackSucc(data);
        }).error(function(data){
            callbackErr(data);
        });
    }
});

/**
 * 工具类方法
 */
travelApp.service('Utils', function () {
    this.isEmpty = function (value) {
        if(value == '' || value == null) {
            return true;
        }
        return false;
    };
});

travelApp.service('Cities', function () {
    var list = null;
    this.getList = function (value) {
        list = new Array();
        for(var val in value) {
            list.push(val);
        }
        return list;
    };
});
