<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="jspHeader.jsp"%>
<link rel="stylesheet" type="text/css" href="css/myCollect.css"/>
<script type="text/javascript">
	$(function() {
		$("#batchbtn").click(function() {
			$(this).hide();
			$("#ok").show();
			$("#batchdel").toggle();
			$('.check').toggle();
		});
		$("#ok").click(function(){
			$("#ok").hide();
			$("#batchbtn").show();
			$("#batchdel").toggle();
			$('.check').toggle();
		});
		$(".thumbnail").mouseover(function() {
			$(this).find('.hidespan').show();
		});
		$(".thumbnail").mouseout(function() {
			$(this).find('.hidespan').hide();
		});
		$("#batchdel").click(function() {
			var cks = $('input[type="checkbox"]:checked');
			var array = new Array();
			var cnt = 0;
			if (cks.length==0) {
				$.messager.alert('提示','请选择需要删除的收藏');
			} else{
				$.messager.confirm('提示','确定要删除所选收藏吗?',function(r){
					if (r) {
						$.messager.alert('提示','删除成功');
						$(cks).each(function(i){
							var collectId = $(this).attr('value');
							array[cnt++] = collectId;
						});
						window.location.href = "Delete.do?opt=MyCollect&optId="+array;
					}
				});
			}
		});
	});
</script>
<body>
	<div class="panel panel-info"
		style="width: 100%; height: 750px; margin: 10px auto;">
		<div class="panel-heading">
			<h3>我的收藏</h3>
			<div style="float: right; margin-top: -40px;">
				<a class="btn btn-danger" id="batchdel">批量删除</a>
			 <a class="btn btn-info" id="batchbtn">批量管理</a>
			 <a class="btn btn-success" id="ok" style="width: 6em;">完成</a>
			</div>
		</div>
		<div class="panel-body">
			<div class="row">
				<c:forEach items="${collectsview}" var="collectview">
					<div class="col-sm-3 ">
						<div class="thumbnail">
							<a class="delbtn" href="Delete.do?opt=MyCollect&optId=${collectview.collectid}" onclick="return confirm('是否删除此收藏？');">
								<span class="glyphicon glyphicon-trash hidespan"
									aria-hidden="true" style="color:red;font-size: 20px;"></span>
							</a>
							<input type="checkbox" class="check" value="${collectview.collectid}"> <img
								src="${collectview.shareimg }" alt="景点图片" class="img-circle"><br>
							<span class="hidespan" id="magbtn"><a
								class="btn btn-warning" href="#" style="width: 6em;">找相似</a><a
								class="btn btn-success" href="#">立即预定</a></span>
							<div class="caption">
								<h4>景点名:${collectview.themename}</h4>
								<p>风景详情:${collectview.content}</p>
								<p>收藏时间:${collectview.collecttime}</p>
								<p style="text-align: right;">
									<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"
										style="color: red;"></span>点赞数:<span style="color: red;">${collectview.likecount}</span>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</div>

</body>
</html>