<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="jspHeader.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=contextpath%>/css/style.css" />
<link rel="stylesheet" type="text/css" href="<%=contextpath%>/css/register.css" />
<title>欢迎注册</title>
<script type="text/javascript">
   
   $(function(){
	   $('form').validate({   
			rules:{
				    username:{
						required:true
					},
					realname:{
						required:true
					},
				    telephone:{
				    	required:true
				    },
					userpassword:{
						required:true
					},
					confirmpassword:{
					    equalTo:'#userpassword'
					}
				    
				},
				messages:{
					username:{
						required:"用户名必填"
					},
					realname:{
						required:"真实姓名必填"
					},
					telephone:{
				    	required:"请填写手机号码"
				    },
				    userpassword:{
						required:"请填写密码"
					},
					confirmpassword:{
					    equalTo:'两次密码不一致'
					}
				}
	   });		
   });
	function changeValidateCode(){
			// 重新请求验证码图片（加上一个当前时间参数，防止使用缓存图片）
			$('#codeImage').attr("src","ValidateCodeServlet.do?random=" + new Date().getTime());
    }
</script>
</head>
<body>
<c:out value="${message}" escapeXml="false"></c:out>
        <div class="container header">
	        <img src="img/logo.jpg">
	        <span class="chinesename">惠游网</span>
	        <span class="englishname">Huiyou.com</span>
	        <span class="title">欢迎注册</span>
	    </div>
	    <div class="container-fluid registerbody">
	       <div class="container">
		    <div class="body-header">
	    		<span style="color:white;font-size: 1.8em">现在注册</span>
	    		<span style="color:#FFFF00;font-size: 1.5em">送200元抵用卷</span>
	    		<span style="color: white;font-weight: bold;position: absolute;right:0px;">已有惠游账号了？<a href="login.jsp" ><button class="btn btn-default" >登录</button></a></span>	
	    		
		    </div>
		    <div class="body-footer">
	<div class="top">
		<span style="color:white;font-size: 2em;">用户注册</span>
	</div>
	<div class="content">
		<form class="form-horizontal content-form" action="register.do" method="post">
			<div class="form-group">
				<label for="username" class="col-sm-3 control-label">用户名：</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="username" name="username" >
				</div>
			</div>
			<div class="form-group">
				<label for="realname" class="col-sm-3 control-label">真实姓名:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="realname" name="realname" >
				</div>
			</div>
			<div class="form-group">
				<label for="telephone" class="col-sm-3 control-label">手机号码:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="telephone" name="telephone" >
				</div>
			</div>
			<div class="form-group">
				<label for="userpassword" class="col-sm-3 control-label">密码:</label>
				<div class="col-sm-9">
					<input type="password" class="form-control" id="userpassword" name="userpassword" >
				</div>
			</div>
			<div class="form-group">
				<label for="confirmpassword" class="col-sm-3 control-label">确认密码:</label>
				<div class="col-sm-9">
					<input type="password" class="form-control" id="confirmpassword" name="confirmpassword" >
				</div>
			</div>
			<div class="form-group">
				<label for="confirmpassword" class="col-sm-3 control-label">验证码:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="code" name="code" >
				</div>
				<div class="col-sm-4">
					<img id= "codeImage" src="ValidateCodeServlet.do" title= "看不清楚换一张"  onclick="changeValidateCode()" />
				</div>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-3 col-sm-9">
			      <div class="checkbox">
			        <label>
			          <input type="checkbox" checked="checked">我已阅读并接受《惠游网会员服务条款》
			        </label>
			      </div>
			    </div>
			 </div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<button type="submit" class="btn btn-info btn-block">注册</button>
				</div>
			</div>
		</form>
	</div>
</div>
</div>
  <iframe src="footer.jsp" class="footer_frame"></iframe>      
</body>
</html>