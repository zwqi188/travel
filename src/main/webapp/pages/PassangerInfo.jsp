<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@include file="jspHeader.jsp"%>
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/passangerInfo.css"/>
		<script type="text/javascript">
			$(function() {
				$('#selectAll').click(function(){
					 if ($(this).attr("checked")) {  
				        $("input[type='checkbox']").attr("checked", true);  
				    } else {  
				        $("input[type='checkbox']").attr("checked", false);  
				    }  
				});
				$('#delMore').click(function(){
					var cks = $('input[type="checkbox"]:checked');
					var array = new Array();
					var cnt = 0;
					if (cks.length==0) {
						$.messager.alert('提示','请选择需要删除的用户');
					} else{
						$.messager.confirm('提示','确定要删除吗?',function(r){
							if (r) {
								$.messager.alert('提示','删除成功');
								$('input[type="checkbox"]:not(:first):checked').each(function(i){
									var userId = $(this).attr('value');
									array[cnt++] = userId;
								});
								window.location.href = "OperPassangers.do?flag=delline&optId="+array;
							}
						});
					}
				});
			});
			
		</script>
	</head>
<body>
	<div class="wrap_table">
		<div class="btn_a row">
			<a class="btn btn-info" href="addPassanger.jsp" target="_self">增加</a> 
			<a class="btn btn-danger" id="delMore">批量删除</a>
		</div>
		<table class="table sch_table">
			<tr>
				<th><input type="checkbox" id="selectAll" name="checkall" />全选</th>
				<th>姓名</th>
				<th>手机号码</th>
				<th>证件类型</th>
				<th>证件号码</th>
				<th>操作</th>
			</tr>
			<tr>
			<c:forEach var="passanger" items="${passangers}">
				<%-- <c:url value="Edit.do?optId=${user.id }&opt=User" var="edit" />
				<c:url value="Delete.do?optId=${user.id }&opt=User" var="delete" /> --%>
				<tr>
					<td><input type="checkbox" name="checksno" value="${passanger.passangerid}" /></td>
					<td>${passanger.passangername}</td>
					<td>${passanger.passangerphone}</td>
					<td>${passanger.papertype}</td>
					<td>${passanger.papernumber}</td>
					<td>
						<a href="Edit.do?opt=Passenger&optId=${passanger.passangerid}"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></a>
						<a href="Delete.do?opt=Passenger&optId=${passanger.passangerid}" onclick="return confirm('是否删除此成员？');"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
						<%-- <a href="OperPassangers.do?flag=edit&operid=${passanger.passangerid}"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></a>
						<a href="OperPassangers.do?flag=delline&optId=${passanger.passangerid}" onclick="return confirm('是否删除此成员？');"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a> --%>
					</td>
				</tr>
			</c:forEach>
			</tr>
		</table>
		<div class="foot_pager">
			${pager}
		</div>
	</div>
</body>
</html>