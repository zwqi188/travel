travelApp.factory('ConstantFactory',function () {
    var constant = {};
    //网络请求方式
    constant.HTTP_METHOD_POST = "POST";
    constant.HTTP_METHOD_GET = "GET";
    //网络请求地址
    //用户注册
    constant.URL_REGISTER = "/travel/register.json";
    //用户登录
    constant.URL_LOGIN = "/travel/login.json";

    return constant;
});