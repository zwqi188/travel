/*
 * 自定义项目模块ngProject
 * App:配置静态参数
 * Util:工具类,MD5,JSON转键值
 * Web:Web工具类,包含公共的请求服务器方法
 * 
 * By YuGii
 */
(function (window, angular) {

    'use strict';

    angular.module('ngProject', ['ng'])
        .factory('App', function () {
            // 服务器地址
            this.url = '.';
            this.token = null;
            this.user = 'BEEUSER';
            this.rememberTime = 3 * 24 * 60 * 60 * 1000;
            return this;
        })
        .factory('Util', function (App) {
            var md5 = function (s) {
                function L(k, d) {
                    return (k << d) | (k >>> (32 - d));
                }

                function K(G, k) {
                    var I, d, F, H, x;
                    F = (G & 2147483648);
                    H = (k & 2147483648);
                    I = (G & 1073741824);
                    d = (k & 1073741824);
                    x = (G & 1073741823) + (k & 1073741823);
                    if (I & d) {
                        return (x ^ 2147483648 ^ F ^ H);
                    }
                    if (I | d) {
                        if (x & 1073741824) {
                            return (x ^ 3221225472 ^ F ^ H);
                        } else {
                            return (x ^ 1073741824 ^ F ^ H);
                        }
                    } else {
                        return (x ^ F ^ H);
                    }
                }

                function r(d, F, k) {
                    return (d & F) | ((~d) & k);
                }

                function q(d, F, k) {
                    return (d & k) | (F & (~k));
                }

                function p(d, F, k) {
                    return (d ^ F ^ k);
                }

                function n(d, F, k) {
                    return (F ^ (d | (~k)));
                }

                function u(G, F, aa, Z, k, H, I) {
                    G = K(G, K(K(r(F, aa, Z), k), I));
                    return K(L(G, H), F);
                }

                function f(G, F, aa, Z, k, H, I) {
                    G = K(G, K(K(q(F, aa, Z), k), I));
                    return K(L(G, H), F);
                }

                function D(G, F, aa, Z, k, H, I) {
                    G = K(G, K(K(p(F, aa, Z), k), I));
                    return K(L(G, H), F);
                }

                function t(G, F, aa, Z, k, H, I) {
                    G = K(G, K(K(n(F, aa, Z), k), I));
                    return K(L(G, H), F);
                }

                function e(G) {
                    var Z;
                    var F = G.length;
                    var x = F + 8;
                    var k = (x - (x % 64)) / 64;
                    var I = (k + 1) * 16;
                    var aa = Array(I - 1);
                    var d = 0;
                    var H = 0;
                    while (H < F) {
                        Z = (H - (H % 4)) / 4;
                        d = (H % 4) * 8;
                        aa[Z] = (aa[Z] | (G.charCodeAt(H) << d));
                        H++;
                    }
                    Z = (H - (H % 4)) / 4;
                    d = (H % 4) * 8;
                    aa[Z] = aa[Z] | (128 << d);
                    aa[I - 2] = F << 3;
                    aa[I - 1] = F >>> 29;
                    return aa;
                }

                function B(x) {
                    var k = "", F = "", G, d;
                    for (d = 0; d <= 3; d++) {
                        G = (x >>> (d * 8)) & 255;
                        F = "0" + G.toString(16);
                        k = k + F.substr(F.length - 2, 2);
                    }
                    return k;
                }

                function J(k) {
                    k = k.replace(/rn/g, "n");
                    var d = "";
                    for (var F = 0; F < k.length; F++) {
                        var x = k.charCodeAt(F);
                        if (x < 128) {
                            d += String.fromCharCode(x);
                        } else {
                            if ((x > 127) && (x < 2048)) {
                                d += String.fromCharCode((x >> 6) | 192);
                                d += String.fromCharCode((x & 63) | 128);
                            } else {
                                d += String.fromCharCode((x >> 12) | 224);
                                d += String.fromCharCode(((x >> 6) & 63) | 128);
                                d += String.fromCharCode((x & 63) | 128);
                            }
                        }
                    }
                    return d;
                }

                var C = Array();
                var P, h, E, v, g, Y, X, W, V;
                var S = 7, Q = 12, N = 17, M = 22;
                var A = 5, z = 9, y = 14, w = 20;
                var o = 4, m = 11, l = 16, j = 23;
                var U = 6, T = 10, R = 15, O = 21;
                s = J(s);
                C = e(s);
                Y = 1732584193;
                X = 4023233417;
                W = 2562383102;
                V = 271733878;
                for (P = 0; P < C.length; P += 16) {
                    h = Y;
                    E = X;
                    v = W;
                    g = V;
                    Y = u(Y, X, W, V, C[P + 0], S, 3614090360);
                    V = u(V, Y, X, W, C[P + 1], Q, 3905402710);
                    W = u(W, V, Y, X, C[P + 2], N, 606105819);
                    X = u(X, W, V, Y, C[P + 3], M, 3250441966);
                    Y = u(Y, X, W, V, C[P + 4], S, 4118548399);
                    V = u(V, Y, X, W, C[P + 5], Q, 1200080426);
                    W = u(W, V, Y, X, C[P + 6], N, 2821735955);
                    X = u(X, W, V, Y, C[P + 7], M, 4249261313);
                    Y = u(Y, X, W, V, C[P + 8], S, 1770035416);
                    V = u(V, Y, X, W, C[P + 9], Q, 2336552879);
                    W = u(W, V, Y, X, C[P + 10], N, 4294925233);
                    X = u(X, W, V, Y, C[P + 11], M, 2304563134);
                    Y = u(Y, X, W, V, C[P + 12], S, 1804603682);
                    V = u(V, Y, X, W, C[P + 13], Q, 4254626195);
                    W = u(W, V, Y, X, C[P + 14], N, 2792965006);
                    X = u(X, W, V, Y, C[P + 15], M, 1236535329);
                    Y = f(Y, X, W, V, C[P + 1], A, 4129170786);
                    V = f(V, Y, X, W, C[P + 6], z, 3225465664);
                    W = f(W, V, Y, X, C[P + 11], y, 643717713);
                    X = f(X, W, V, Y, C[P + 0], w, 3921069994);
                    Y = f(Y, X, W, V, C[P + 5], A, 3593408605);
                    V = f(V, Y, X, W, C[P + 10], z, 38016083);
                    W = f(W, V, Y, X, C[P + 15], y, 3634488961);
                    X = f(X, W, V, Y, C[P + 4], w, 3889429448);
                    Y = f(Y, X, W, V, C[P + 9], A, 568446438);
                    V = f(V, Y, X, W, C[P + 14], z, 3275163606);
                    W = f(W, V, Y, X, C[P + 3], y, 4107603335);
                    X = f(X, W, V, Y, C[P + 8], w, 1163531501);
                    Y = f(Y, X, W, V, C[P + 13], A, 2850285829);
                    V = f(V, Y, X, W, C[P + 2], z, 4243563512);
                    W = f(W, V, Y, X, C[P + 7], y, 1735328473);
                    X = f(X, W, V, Y, C[P + 12], w, 2368359562);
                    Y = D(Y, X, W, V, C[P + 5], o, 4294588738);
                    V = D(V, Y, X, W, C[P + 8], m, 2272392833);
                    W = D(W, V, Y, X, C[P + 11], l, 1839030562);
                    X = D(X, W, V, Y, C[P + 14], j, 4259657740);
                    Y = D(Y, X, W, V, C[P + 1], o, 2763975236);
                    V = D(V, Y, X, W, C[P + 4], m, 1272893353);
                    W = D(W, V, Y, X, C[P + 7], l, 4139469664);
                    X = D(X, W, V, Y, C[P + 10], j, 3200236656);
                    Y = D(Y, X, W, V, C[P + 13], o, 681279174);
                    V = D(V, Y, X, W, C[P + 0], m, 3936430074);
                    W = D(W, V, Y, X, C[P + 3], l, 3572445317);
                    X = D(X, W, V, Y, C[P + 6], j, 76029189);
                    Y = D(Y, X, W, V, C[P + 9], o, 3654602809);
                    V = D(V, Y, X, W, C[P + 12], m, 3873151461);
                    W = D(W, V, Y, X, C[P + 15], l, 530742520);
                    X = D(X, W, V, Y, C[P + 2], j, 3299628645);
                    Y = t(Y, X, W, V, C[P + 0], U, 4096336452);
                    V = t(V, Y, X, W, C[P + 7], T, 1126891415);
                    W = t(W, V, Y, X, C[P + 14], R, 2878612391);
                    X = t(X, W, V, Y, C[P + 5], O, 4237533241);
                    Y = t(Y, X, W, V, C[P + 12], U, 1700485571);
                    V = t(V, Y, X, W, C[P + 3], T, 2399980690);
                    W = t(W, V, Y, X, C[P + 10], R, 4293915773);
                    X = t(X, W, V, Y, C[P + 1], O, 2240044497);
                    Y = t(Y, X, W, V, C[P + 8], U, 1873313359);
                    V = t(V, Y, X, W, C[P + 15], T, 4264355552);
                    W = t(W, V, Y, X, C[P + 6], R, 2734768916);
                    X = t(X, W, V, Y, C[P + 13], O, 1309151649);
                    Y = t(Y, X, W, V, C[P + 4], U, 4149444226);
                    V = t(V, Y, X, W, C[P + 11], T, 3174756917);
                    W = t(W, V, Y, X, C[P + 2], R, 718787259);
                    X = t(X, W, V, Y, C[P + 9], O, 3951481745);
                    Y = K(Y, h);
                    X = K(X, E);
                    W = K(W, v);
                    V = K(V, g);
                }
                var i = B(Y) + B(X) + B(W) + B(V);
                return i.toLowerCase();
            };
            this.md5 = function (s) {
                s = s == null ? '' : s;
                return md5(s);
            }
            var randomStr = function (len) {
                len = len || 32;
                var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
                var maxPos = $chars.length;
                var pwd = '';
                for (var i = 0; i < len; i++) {
                    pwd += $chars.charAt(Math.floor(Math.random() * maxPos))
                }
                return pwd
            }
            this.randomStr = randomStr;
            // 字符串前后各截去一位
            var cut = function(str) {
            	return str.substr(1, str.length - 2);
            }
            // 把一个JSON对象转为&key=value的形式
            this.toKeyValue = function(entity) {
            	if (entity == null || entity == {}) {
					return '';
				}
            	var str = cut(angular.toJson(entity));
            	var result = '';
            	var array = str.split(',');
        		for (var i = 0; i < array.length; i++) {
        			var arr = array[i].split(':');
        			result += '&' + cut(arr[0]) + '=' + cut(arr[1]);
        		}
            	return result;
            }
            // 记住用户
            this.rememberUser = function(user) {
            	var date = new Date();
            	date.setTime(date.getTime() + App.rememberTime);
            	document.cookie = App.user + '=' + escape(angular.toJson(user)) + '; expires=' + date.toGMTString();
        	}
            // 取出用户
            this.getUser = function() {
				var arrCookie = document.cookie.split("; ");
				var user = null;
				for (var i = 0; i < arrCookie.length; i++) {
					var arr = arrCookie[i].split("=");
					if (arr[0] == App.user) {
						user = arr[1];
						break;
					}
				}
				return user == null ? null : unescape(user);
            }
            // 移除用户
            this.removeUser = function() {
            	document.cookie = App.user + '=';
            }
            return this;
        })
        .factory('Web', function (App, Util, $http) {
            /**
             * 登陆
             */
            this.login = function ($scope) {
                $http.post(App.url + '/user/login.do', $scope.user).success(function (data) {
                    if (data.status == 'success') {
                        $scope.isLogin = true;
                        App.token = data.token;
                        if ($scope.autoLogin) {
                        	Util.rememberUser($scope.user);
						}
                    } else {
                        console.log('登陆失败');
                        alert(data.message);
                    }
                    $scope.user.password = '';
                });
            }
            /**
             * 自动登陆
             */
            this.autoLogin = function ($scope) {
                console.log('库克:' + document.cookie);
            	var user = Util.getUser();
            	console.log('取得的用户:'+user);
                if (user != null && user != '') {
                    $http.post(App.url + '/user/login.do', user).success(function (data) {
                        if (data.status == 'success') {
                            $scope.isLogin = true;
                            App.token = data.token;
                            console.log('自动登陆成功');
                        }
                    });
                }
            }
            /**
             * 注销登陆
             */
            var logout = function ($scope) {
            	Util.removeUser();
                $scope.user = null;
                location.href = '/';
            }
            this.logout = logout;
            /**
             * 修改密码
             */
            this.upassword = function (user) {
//            	user.password = Util.md5(user.password);
//            	user.newpassword = Util.md5(user.newpassword);
//            	user.repassword = Util.md5(user.repassword);
            	console.log(user);
                var token = App.token;
                if (token != null) {
	            	$http.post(App.url + '/user/upassword.do' + '?sid=' + token, user).success(function (data) {
	            		if (data.status == 'success') {
	            			alert("修改密码成功，请重新登陆");
							location.href = '/';
						} else {
							alert(data.message);
						}
	            	});
                }
            }
            /**
             * path 请求路径
             * params url参数
             * data POST参数
             * $scope 影响的页面
             */
            this.post = function (path, params, data, $scope) {
                var token = App.token;
                if (token == null) {
                    logout($scope);
                } else {
                	data = data == null ? {} : data;
                    console.log('URL参数:' + angular.toJson(params));
                    console.log('查询参数:' + angular.toJson(data));
                    $http.post(App.url + path + '?sid=' + token + '&page=' + $scope.page + '&rows=' + $scope.rows + Util.toKeyValue(params), data).success(function (result) {
                    	console.log('返回:' + angular.toJson(result));
                        if (result.status == 'success') {
                            $scope.data = result;
                        } else {
                            alert(result.message);
                            logout($scope);
                        }
                    });
                }
            }
            /**
             * 初始化翻页的几个方法
             */
            this.pageInit = function ($scope, load) {
            	console.log('初始化翻页方法');
                $scope.fristPage = function () {
                    console.log('首页');
                    $scope.page = 1;
                    load();
                }
                $scope.upPage = function () {
                    console.log('上一页');
                    if ($scope.page > 1) {
        				$scope.page -= 1;
        			}
                    load();
                }
                $scope.downPage = function () {
                    console.log('下一页');
                    if ($scope.page < $scope.data.totalPage) {
        				$scope.page += 1;
        			}
                    load();
                }
                $scope.endPage = function () {
                    console.log('尾页');
                    $scope.page = $scope.data.totalPage;
                    load();
                }
            }
            return this;
        });

})(window, window.angular);