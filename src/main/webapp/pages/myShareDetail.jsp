<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@ include file="jspHeader.jsp" %>
		<link rel="stylesheet" type="text/css" href="css/myShareDetail.css"/>
		<title>Insert title here</title>
		<script type="text/javascript">
			$(function(){
				/* $('tr td:first').css('text-align','right'); */
			});
		</script>
	</head>
	<body>
		<div class="wrap_table container">
			<div class="panel panel-info">
				<div class="panel-heading">
					分享详情
				</div>
				<div class="panel-body">
				
					<table class="table share_table">
				<tr>
					<td width="100px" class="text-right">主题</td>
					<td width="350px">
						${myShare.themename }
					</td>
				</tr>
				<tr>
					<td class="text-right">内容</td>
					<td>
						${myShare.content }
					</td>
				</tr>
				<tr>
					<td class="text-right">景点</td>
					<td>
						${spotName }
					</td>
				</tr>
				<tr>
					<td class="text-right">图片</td>
					<td>
						<img alt="" src="${myShare.shareimg }"/>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<a class="btn btn-success" href="MyShare.do">返回</a>
					</td>
				</tr>
			</table>
				
				</div>
			</div>
		</div>
	</body>
</html>