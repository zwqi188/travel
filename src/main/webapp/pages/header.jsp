<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="jspHeader.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/header.css"/>
<script type="text/javascript">
	$(function(){
		$('#myshare').click(function(){
			parent.window.location.href="GetShareImgsServlet.do";
		})
	})
</script>
</head>
<body>
<div id="topnav" class="navbar  navbar-fixed-top ">
			<div class="container">
				<div class="navbar-header" id="topnav_logo">
					<a href="#" class="navbar-brand">
						<img src="img/logo_header.jpg">
						<span class="chinesename">惠游网</span>
						<span class="englishname">Huiyou.com</span>
					</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li id="active"><a href="GetCitySignspots.do" target="_parent">首页</a></li>
						<li><a href="#">机票</a></li>
						<li><a href="#">酒店</a></li>
						<li>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								度假
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">出境游</a></li>
								<li><a href="#">国内游</a></li>
								<li class="divider"></li>
								<li><a href="#">周边游</a></li>
								<li><a href="#">wifi/观光</a></li>
								<li><a href="#">邮轮</a></li>
								<li>
									<a href="#">签证</a>
								</li>
							</ul>
						</li>
						<li><a href="#">团购</a></li>
						<li><a id="myshare" href="">游客分享</a></li>
						<li>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								更多
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">积分商城</a></li>
								<li><a href="#">合作卡</a></li>
							</ul>
						</li>
						<li>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								帮助<span class="glyphicon glyphicon-wrench"></span>
							</a>
						</li>
						<li><a href="MyTravel.do" target="_parent">我的惠游<span class="glyphicon glyphicon-home"></span></a></li>
					</ul>

					<form class="navbar-form navbar-right">
						<div id="nav">
							<a href="login.jsp" target="_parent"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>登录</a>
							<span>|</span>
							<a href="register.jsp" target="_parent"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>注册</a>
							<span id="wel" style="color: red;">欢迎:</span><span id="namespan">${username eq null?"请先登录":username}</span>
						</div>

					</form>
				</div>
			</div>
		</div>
</body>
</html>