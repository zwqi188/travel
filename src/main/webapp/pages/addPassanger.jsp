<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="jspHeader.jsp"%>
<link rel="stylesheet" type="text/css" href="css/passanger.css"/>
<script type="text/javascript">
	$(function() {
		$('label').parent('td').css('text-align', 'right');
		$('input').parent('td').css('text-align', 'left');
		$('select').parent('td').css('text-align', 'left');
		$('textarea').parent('td').css('text-align', 'left');
	});
</script>
</head>
<body>
	<div id="nav">
		<span>【常用旅客信息】</span>
	</div>
	<form action="Add.do?opt=Passenger" method="post" id="addForm">
		<div>
			<table cellspacing="0px">
				<tr>
					<th>新增旅客信息</th>
					<th></th>
				</tr>
				<tr>
					<td><label>姓名</label></td>
					<td><input type="text" name="passangername" id="passangername"
						value=""  /></td>
				</tr>
				<tr class="odd">
					<td><label>手机号码</label></td>
					<td><input type="text" name="passangerphone" id="passangerphone"
						value=""  /></td>
				</tr>
				<tr>
					<td><label>证件类型</label></td>
					<td><select name="papertype" id="papertype">
					<option value="二代身份证">二代身份证</option>
					<option value="港澳通行证">港澳通行证</option>
					<option value="台湾通行证">台湾通行证</option>
					<option value="护照">护照</option>
					<option value="其他">其他</option>
					</select></td>
				</tr>
				<tr class="odd">
					<td><label>证件号码</label></td>
					<td><input type="text" name="papernumber" id="papernumber"
						value=""  /></td>
				</tr>
			</table>
		</div>
		<div id="bottombtn">
			<a type="button" id="addBtn" class="btn btn-info">确定</a>
			<!-- <input type="submit" value="确认" /> -->
			<a href="GetNpassangers.do" target="_self" class="btn btn-warning">取消</a>
		</div>
	</form>
</body>
</html>