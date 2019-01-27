<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@include file="jspHeader.jsp" %>
		<link rel="stylesheet" type="text/css" href="css/myTravel.css"/>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
		<script src="../static/js/global.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				$('.menu_ul .menu_one li a').click(function(){
					$('.menu_ul .menu_one li a').css('border','none');
					$(this).css({
						'border': 'none',
						'border-left': '3px solid blue'
					});
					$(this).children('glyphicon').attr('class','glyphicon glyphicon-minus');
				});
				$('#editform').validate({   
					    rules:{
							confirmpassword:{
							    equalTo:'#userpassword'
							}
						    
						   },
						messages:{
							confirmpassword:{
							    equalTo:'两次密码不一致'
							}
						}
				});		
				$('#usualBtn').click(function(){
					$('#usualFrame').prop('src','GetNpassangers.do');
				});
				$('#collectBtn').click(function() {
					$('#collectFrame').prop('src', 'GetMyCollects.do');
				});

				$('#editShare').hide();
			});
			
			//初始化隐藏edit编辑窗口
			function editUser() {
                $(".editdiv").toggle();
			}
			
			function submitEdit() {
				$('#editform').form("submit",{
					url:"MyTravel.do",
					onsubmit:function(){
						$('#editform').validate();
					},
					success:function(){
						editUser();
						$('#td1').html();
					}
				});
			}
			
		</script>
	</head>
	<body >
		<iframe src="header.jsp" width="100%" height="55px"></iframe>
		<div class="container" >
			<div class="row">
				<div class="col-md-3" style="height:730px;">
					<ul class="nav menu_ul">
						<li><a data-toggle="collapse" href="#cpe1">
							<span class="menu_title">订单中心</span><span class="glyphicon glyphicon-plus"></span></a>
							<div class="collapse" id="cpe1">
								<ul class="nav nav-tabs nav-stacked menu_one">
									<li id="allOrderBtn"><a href="#order" data-toggle="tab">全部订单</a></li>
									<li><a href="#" data-toggle="tab">机票订单</a></li>
									<li><a href="#" data-toggle="tab">酒店订单</a></li>
									<li><a>火车票订单</a></li>
									<li><a>更多订单</a></li>
								</ul>
							</div>
						</li>
						
						<li><a data-toggle="collapse" href="#cpe2">
							<span class="menu_title">个人中心</span><span class="glyphicon glyphicon-plus"></span></a>
							<div class="collapse" id="cpe2">
								<ul class="nav nav-tabs nav-stacked menu_one">
									<li><a href="#myInfo" data-toggle="tab">我的信息</a></li>
									<li><a>我的成长</a></li>
									<li><a href="#myCollect" data-toggle="tab">我的收藏</a></li>
									<li><a>我的会员卡</a></li>
									<li><a href="#myShare" data-toggle="tab">我的分享</a></li>
								</ul>
							</div>
						</li>
						<li><a data-toggle="collapse" href="#cpe3">
							<span class="menu_title">常用信息管理</span><span class="glyphicon glyphicon-plus"></span></a>
							<div class="collapse" id="cpe3">
								<ul class="nav nav-tabs nav-stacked menu_one">
									<li  id="usualBtn"><a href="#usualInfo" data-toggle="tab">常用旅客信息</a></li>
									<li><a>常用地址</a></li>
									<li><a>常用发票</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<div class="col-md-9 right_show">
					<div class="row info_header">
						<span><span class="glyphicon glyphicon-flag"></span>您可以在线查看近一年的订单。如需查找更久之前的订单，请致电：1010-6666(免长话费) 或 800-820-6666（座机）。</span>
					</div>
					<div class="tab-content">
						<div class="tab-pane active" id="order">
							<div class="row show_border">
								<ul class="nav nav-tabs">
									<li class=""><a href="#allOrder" data-toggle="tab">全部订单0</a></li>
									<li><a href="#noGo" data-toggle="tab">未出行0</a></li>
									<li><a href="#willPay" data-toggle="tab">待付款0</a></li>
									<li><a href="#willEml" data-toggle="tab">待评价0</a></li>
								</ul>
								<div class="tab-content detail_content">
									<div class="tab-pane  active" id="allOrder">
										<iframe src="GetAllIndents.do" name="orderFrame" id="orderFrame" style="width: 99.9%;height: 600px;">
											全部订单
										</iframe>
									</div>
									<div class="tab-pane" id="noGo">
										2
									</div>
									<div class="tab-pane" id="willPay">
										3
									</div>
									<div class="tab-pane" id="willEml">
										4
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane " id="usualInfo">
							<div class="show_border">
								<iframe src="GetNpassangers.do" name="usualFrame" id="usualFrame" style="width: 100%;height: 450px;">
								</iframe>
							</div>
						</div>
						<div class="tab-pane" id="myInfo">
							<div class="row">
								<div class="panel panel-info">
									<div class="panel-header row">
										<div class="col-md-11">
											<span>个人信息设置</span>
										</div>
										<div class="col-md-1">
											<a data-toggle="collapse" href="#personInfo">
												<button class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
											</a>
										</div>
									</div>
									<div class="panel-body collapse " id="personInfo">
										<table class="table person_table">
											<tr>
												<td class="text-right" width="200px" id="td1">用户名:</td>
												<td>${user.userName}</td>
											</tr>
											<tr>
												<td class="text-right" id="td2">真实姓名:</td>
												<td>${user.realName}</td>
											</tr>
											<tr>
												<td class="text-right" id="td3">手机:</td>
												<td>${user.telphone}</td>
											</tr>
											<tr>
												<td colspan="1" class="text-right"><button class="btn btn-info" onclick="editUser()">编辑</button></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="panel panel-info">
									<div class="panel-header row">
										<div class="col-md-11">
											<span>头像设置</span>
										</div>
										<div class="col-md-1">
											<a data-toggle="collapse" href="#photoSet">
												<button class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
											</a>
										</div>
									</div>
									<div class="panel-body collapse" id="photoSet">
										设置头像的
									</div>
								</div>
							</div>
						</div>
						
						<div class="tab-pane " id="myCollect">
							<iframe src="GetMyCollects.do" name="collectFrame" id="collectFrame" style="width: 100%;height:800px;scrolling:no;frameborder:0">
							</iframe>
						</div>
						<div class="tab-pane" id="myShare">
							<div class="show_border">
							     <iframe src="MyShare.do" scrolling="no" style="width:100%;height:650px;"></iframe>
						    </div> 
						</div> 

					</div>
				</div>
			</div>
		
	    <div class="editdiv">
	       <form class="form-horizontal content-form"  method="post" id="editform">
			<div class="form-group">
				<label for="username" class="col-sm-3 control-label">用户名：</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="username" name="username" value="${user.userName}">
				</div>
			</div>
			<div class="form-group">
				<label for="realname" class="col-sm-3 control-label">真实姓名:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="realname" name="realname" value="${user.realName}">
				</div>
			</div>
			<div class="form-group">
				<label for="telephone" class="col-sm-3 control-label">手机号码:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="telephone" name="telephone" value="${user.telphone}">
				</div>
			</div>
			<div class="form-group">
				<label for="userpassword" class="col-sm-3 control-label">密码:</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="userpassword" name="userpassword" value="${user.userPassword}">
				</div>
			</div>
			<div class="form-group">
				<label for="confirmpassword" class="col-sm-3 control-label">确认密码:</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="confirmpassword" name="confirmpassword" value="${user.userPassword}">
				</div>
			</div>
			<div class="form-group">
				<label for="confirmpassword" class="col-sm-3 control-label">验证码:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="code" name="code" >
				</div>
				<div class="col-sm-2">
					<img id= "codeImage" src="ValidateCodeServlet.do" title= "看不清楚换一张"  onclick="changeValidateCode()" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-6">
					<button type="button" class="btn btn-info " onclick="submitEdit()">提交</button>
					<button type="button" class="btn btn-info " onclick="editUser()">关闭</button>
				</div>
			</div>
		</form>
	    </div>	   
	</body>
	<iframe src="footer.jsp" class="footer_frame"></iframe>
</html>
