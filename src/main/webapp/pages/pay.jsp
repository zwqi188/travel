<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付页面</title>
<link rel="stylesheet" href="css/pay.css">
<script type="text/javascript">
	$(function() {
		$('#indent_2').hide();
		$('#indent_3').hide();
		$('#sendbtn').click(function() {
			$('#indenttab').hide();
			$('#zhifu').show();
			$('li').removeClass('active');
			$('li').first().next().addClass('active');
			$('.indent_progress .progress-bar').hide();
			$('#indent_2').show();
		});
		$('#zhifubtn').click(function(){
			$('#zhifu').hide();
			$('#success').show();
			$('li').removeClass('active');
			$('li').first().next().next().addClass('active');
			$('.indent_progress .progress-bar').hide();
			$('#indent_3').show();
		});
		$('#backbtn').click(function(){
			window.location.href="buyInfo.jsp";
		});
		$('.indent_progress a').click(function(){
			var id=$(this).prop('href');
			$('ul').nextAll().hide();
			id=id.substring(id.lastIndexOf('#'));
			$(id).show();
			/* $(this).children('progress-bar').css('width','100%'); */
		});
	})
</script>
</head>
<body>
	<iframe src="header.jsp" width="100%" height="55px" class="header_frame"></iframe>
	<div class="container wrap_indent" style="height: 500px;">
		<ul class="nav nav-tabs indent_progress">
			<li role="presentation" class="active"><a href="#indenttab">
				1订单情况
				<div class="progress">
	  				<div id="indent_1" class="progress-bar progress-bar-success" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
				</div>
			</a></li>
			<li role="presentation"><a href="#zhifu">
				2支付订单
				<div class="progress">
	  				<div id="indent_2" class="progress-bar progress-bar-success" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
				</div>
			</a></li>
			<li role="presentation"><a href="#success">
				3订单完成
				<div class="progress">
	  				<div id="indent_3" class="progress-bar progress-bar-success" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
				</div>
			</a></li>
		</ul>
	
		<div id="indenttab" class="panel panel-info indent_opt">
			<div class="panel-heading">当前订单</div>
			<table class="table">
				<tr>
					<!-- <th>订单号</th> -->
					<th>用户名</th>
					<th>联系电话</th>
					<th>旅游景点</th>
					<th>旅客姓名</th>
					<th>单价</th>
					<th>数量</th>
					<th>共支付</th>
				</tr>
				<tr>
					<%-- <td>${indent.indentId }</td> --%>
					<td>${indent.realName }</td>
					<td>${indent.telphone }</td>
					<td>${indent.spotName }</td>
					<td>${indent.passangerName }</td>
					<td>${indent.price }</td>
					<td>${indent.num }</td>
					<td>${indent.allPrice }</td>
				</tr>
			</table>
			<div class="panel-body">
				<button id="sendbtn" type="button" class="btn btn-success pull-right">提交订单</button>
			</div>
		</div>
		<div id="zhifu" class="panel panel-danger indent_opt" style="display: none;">
			<div class="panel-heading">支付订单</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-4 col-md-offset-3">
						<ul class="list-group">
							<li class="list-group-item">支付金额<span>￥${indent.allPrice }</span></li>
							<li class="list-group-item">
								<div class="row">
									<div class="col-md-4">支付方式</div>
									<div class="col-md-5">
										<ul class="list-group">
											<li class="list-group-item">微信支付</li>
											<li class="list-group-item">支付宝</li>
											<li class="list-group-item">QQ钱包</li>
											<li class="list-group-item">银行卡支付</li>
										</ul>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<a id="zhifubtn" type="button" class="btn btn-success pull-right" href="Add.do?opt=Pay">确认支付</a>
			</div>
		</div>
		<div id="success" class="panel panel-success indent_opt" style="display: none;">
			<h3>恭喜你的订单已经完成</h3>
			<button id="backbtn" type="button" class="btn btn-success">退出</button>
		</div>
	</div>
	
	<!-- 尾页 -->
	<iframe src="footer.jsp"  class="footer_frame" ></iframe>
</body>
</html>