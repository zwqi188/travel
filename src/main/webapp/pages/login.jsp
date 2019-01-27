<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/register.css">
<script type="text/javascript" src="../static/js/login.js"></script>
</head>
<body>
	 <div class="container header">
	        <img src="img/logo.jpg">
	        <span class="chinesename">惠游网</span>
	        <span class="englishname">Huiyou.com</span>
	        <span class="title">欢迎登录</span>
	 </div>
	<div class="container-fluid" id="login_content">
		<div class="row">
			<div  class=" col-md-offset-7 col-md-4" style="padding-top: 40px;">
				<div class="panel panel-info">
					<div class="panel-heading">用户登录</div>
					<div class="panel-body">
						<form name="loginForm" action="LoginServlet.do" method="post" class="form-horizontal">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">用户名</label>
								<div class="col-sm-9">
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon1"><span
											class="glyphicon glyphicon-user"></span></span> <input type="text"
											class="form-control" name="username" value="${sessionScope.username }" id="inputEmail3" placeholder="请填写用户名">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-3 control-label">密　码</label>
								<div class="col-sm-9">
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon1"><span
											class="glyphicon glyphicon-lock"></span></span> <input
											type="password" name="password" class="form-control" id="inputPassword3"
											placeholder="请填写密码">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-3 control-label">验证码</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="inCode"
										placeholder="请填写验证码">
								</div>
								<div class="col-sm-4">
									<img id="validateImg" alt="该图片不存在" src="ValidateCodeServlet.do"
										title="看不清，换一张" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<div class="checkbox">
										<label> <input type="checkbox" name="selflogin" value="selflogin">一周内自动登录 <a
											href="#" class="text-right">忘记密码？</a>
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<button id="login" type="button" class="btn btn-success form-control">登录</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<label>您还没有惠游网账号？<a href="register.jsp">立即注册</a></label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<label>使用以下方式登录</label>
								</div>
							</div>
							<div class="form-group container-fluid">
								<div class="row">
									<div class="col-xs-6 col-md-2 col-md-offset-3">
										<a href="#" class="thumbnail"> <img alt=""
											src="img/tengxun.jpg" />
										</a>
									</div>
									<div class="col-xs-6 col-md-2">
										<a href="#" class="thumbnail"> <img alt=""
											src="img/xinlang.jpg" />
										</a>
									</div>
									<div class="col-xs-6 col-md-2">
										<a href="#" class="thumbnail"> <img alt=""
											src="img/weixin.jpg" />
										</a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="link">
        		<ul>
        			<li><a href="#">关于我们</a></li>
        			<li><a href="#">联系我们</a></li>
        			<li><a href="#">网站地图</a></li>
        			<li><a href="#">酒店品牌</a></li>
        			<li><a href="#">酒店查询</a></li>
        			<li><a href="#">帮助中心</a></li>
        			<li><a href="#">友情链接</a></li>
        			<li><a href="#">诚聘英才</a></li>
        			<li><a href="#">旅游度假资质</a></li>
        			<li><a href="#">意见反馈</a></li>
        			<li><a href="#">广告业务</a></li>
        			<li><a href="#">用户体验平台</a></li>
        		</ul>
                <span style="position: relative;left:550px;top:10px;">Copyright@2015 www.huiyou.com 科大讯飞直通车</span><br/>
                <span style="position: relative;left:400px;top:10px;"><img src="img/footer.png" /></span>
        	</div>
</body>
</html>