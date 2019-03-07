var travelApp = angular.module('travelApp',['ui.router']);

/**
 * 由于整个应用都会和路由打交道，所以这里把$state和$stateParams这两个对象放到$rootScope上，方便其它地方引用和注入。
 * 这里的run方法只会在angular启动的时候运行一次。
 * @param  {[type]} $rootScope
 * @param  {[type]} $state
 * @param  {[type]} $stateParams
 * @return {[type]}
 */
travelApp.run(function($rootScope, $state, $stateParams) {
    $rootScope.$state = $state;
    $rootScope.$stateParams = $stateParams;
});

/**
 * 配置路由。
 * 注意这里采用的是ui-router这个路由，而不是ng原生的路由。
 * ng原生的路由不能支持嵌套视图，所以这里必须使用ui-router。
 * @param  {[type]} $stateProvider
 * @param  {[type]} $urlRouterProvider
 * @return {[type]}
 */
travelApp.config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/index');
    $stateProvider
        .state('index', {
            url: '/index',
            views: {
                '': {
                    templateUrl: 'html/index/app.html'
                },
                'header@index': {
                    templateUrl: 'html/template/header.html'
                },
                'menu@index': {
                    templateUrl: 'html/index/menu.html'
                },
                'search@index': {
                    templateUrl: 'html/index/search.html'
                },
                'recommend@index': {
                    templateUrl: 'html/index/recommend.html'
                },
                'outbound@index': {
                    templateUrl: 'html/index/outbound.html'
                },
                'inbound@index': {
                    templateUrl: 'html/index/inbound.html'
                },
                'travelAround@index': {
                    templateUrl: 'html/index/travelAround.html'
                },
                'customized@index': {
                    templateUrl: 'html/index/customized.html'
                },
                'footer@index': {
                    templateUrl: 'html/template/footer.html'
                }
            }
        })
        .state('register', {
            url: '/register',
            views: {
                '': {
                    templateUrl: 'html/register/app.html'
                },
                'header@register': {
                    templateUrl: 'html/template/header.html'
                },
                'register@register': {
                    templateUrl: 'html/register/register.html'
                },
                'footer@register': {
                    templateUrl: 'html/template/footer.html'
                }
            }
        })
        .state('loginView', {
            url: '/loginView',
            views: {
                '': {
                    templateUrl: 'html/login/app.html'
                },
                'header@loginView': {
                    templateUrl: 'html/template/header.html'
                },
                'login@loginView': {
                    templateUrl: 'html/login/login.html'
                },
                'footer@loginView': {
                    templateUrl: 'html/template/footer.html'
                }
            }
        })
        
       
});