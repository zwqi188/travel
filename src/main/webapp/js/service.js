/**
 * Http服务
 */
travelApp.service('Http', function() {
    this.go = function ($http,method,url,param,callbackSucc,callbackErr) {
        $http({
            method:method,
            url:url,
            data:param
        }).success(function(data){
            callbackSucc(data);
        }).error(function(data){
            callbackErr(data);
        });
    }
});