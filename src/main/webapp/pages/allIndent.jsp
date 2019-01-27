<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@include file="jspHeader.jsp" %>
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/allIndent.css"/>
		<script type="text/javascript">
			$(function(){
				/* $('#schBtn').click(function() {
					alert('333333');
					var passangerName = $('#passangerName').val();
					window.location.href = "Query.do?optId="+passangerName;
				}); */
			});
		</script>
	</head>
<body>

	<div class="wrap_indent">
		<form class="form-inline allorder_form" action="GetQueryAllIndents.do" method="post">
			<div class="form-group">
				<label class="first_label">订单查询</label>
				<label>旅客姓名</label>
				<input type="text" class="form-control" value="${queryPassager }" name="passangerName" id="passangerName" placeholder="请输入旅客姓名"/>
			</div>
			<div class="form-group">
				<button class="btn btn-info form-control" id="schBtn"><span class="glyphicon glyphicon-search"></span>查询</button>
				<a class="btn btn-success form-control" href="GetAllIndents.do">显示全部订单</a>	
			</div>			
		</form>
		<table class="table">
			<tr>
				<th>订单号</th>
				<th>购买者</th>
				<th>手机号码</th>
				<th>游客姓名</th>
				<th>景点名</th>
				<th>单价</th>
				<th>数量</th>
				<th>总价</th>
				<th>购买时间</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${indents }" var="idt">
				<c:url value="Look.do?opt=AllIndent&optId=${idt.indentId }" var="look" />
				<c:url value="Delete.do?opt=AllIndent&optId=${idt.indentId }" var="delete" />
				<tr>
					<td>${idt.indentId }</td>
					<td>${idt.realName }</td>
					<td>${idt.telphone }</td>
					<td>${idt.passangerName }</td>
					<td>${idt.spotName }</td>
					<td>${idt.price }</td>
					<td>${idt.num }</td>
					<td>${idt.allPrice }</td>
					<fmt:formatDate value="${idt.buyDate }" var="newDate" pattern="yyyy年MM月dd日"/>
					<td>${newDate }</td>
					<td>
						<a href="${look }"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></a>
						<a href="${delete }" onclick="return confirm('是否删除此成员？');"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="foot_pager">
			${pager }
		</div>
	</div>
</body>
</html>