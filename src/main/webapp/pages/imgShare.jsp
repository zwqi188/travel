<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图片分享</title>
<style type="text/css">
table td {
	empty-cells: show;
}

.allimgs p {
	font-size: 8px;
}
/* span {
	padding-top: 50px;
} */
</style>
<script type="text/javascript">
	$(function() {
		var imgpath1=$('#init1').val();
		var imgpath2=$('#init2').val();
		$('.allimgsbydate img').first().parent().css('border','3px solid red');
		$('.allimgsbynum img').first().parent().css('border','3px solid red');
		$('.allimgsbydate img').click(function() {
			$('.allimgsbydate img').parent().css('border','none');
			$(this).parent().css('border','3px solid red');
			imgpath1=$(this).next().val();
			$('.zuire a.load').prop('href','ImgLoadServlet.do?imgpath='+$(this).next().val());
			$('#showBydate').prop('src', $(this).prop('src'));
			$('#showcount').text($(this).next().next().val());
			$('#showtime').text($(this).nextAll().last().val());
		});
		$('.allimgsbynum img').click(function() {
			$('.allimgsbynum img').parent().css('border','none');
			$(this).parent().css('border','3px solid red');
			imgpath2=$(this).next().val();
			$('.zuixin a.load').prop('href','ImgLoadServlet.do?imgpath='+$(this).next().val());
			$('#showBynum').prop('src', ($(this).prop('src')));
			$('#showcountbynum').text($(this).next().next().val());
			$('#showtimebynum').text($(this).nextAll().last().val());
		});
		$('#likeadd').click(function(){
			alert('I like');
			$.ajax({
				url:"Add.do?opt=ImgShare",           /*  AddLikeServlet */
				data:{"imgpath":imgpath1,"likecount":$('#showcount').text()},
				type:"post",
				datatype:"text",
				success:function(data){
					$('#showcount').text(data)
				}
			});
		})
		$('#likeadd2').click(function(){
			alert('I like');
			$.ajax({
				url:"Add.do?opt=ImgShare",
				data:{"imgpath":imgpath2,"likecount":$('#showcountbynum').text()},
				type:"post",
				datatype:"text",
				success:function(data){
					$('#showcountbynum').text(data)
				}
			});
		});
		$('.collectbtn1').click(function(){
			$.ajax({
				url:"AddCollectionServlet.do?opt=ImgShare",
				data:{"imgpath":imgpath1},
				type:"post",
				datatype:"text",
				success:function(data){
					alert(data)
				}
			});
		});
		$('.collectbtn2').click(function(){
			$.ajax({
				url:"AddCollectionServlet.do?opt=ImgShare",
				data:{"imgpath":imgpath2},
				type:"post",
				datatype:"text",
				success:function(data){
					alert(data)
				}
			});
		});
		$('#leftbtn').click(function(){
			var start=1;
			var end=3;
			var url="SwitchImgServlet.do?start="+start+"&end="+end;
			$.get(url,function(data){
				var json=eval("("+data+")");
				for(var i=0;i<json.length;i++){
					$('.allimgsbynum img').eq(i).prop('src',"GetImgServlet.do?imgpath="+json[i].shareimg);
				}
			});
		});
		$('#rightbtn').click(function(){
			var start=2;
			var end=4;
			var url="SwitchImgServlet.do?start="+start+"&end="+end;
			$.get(url,function(data){
				var json=eval("("+data+")");
				for(var i=0;i<json.length;i++){
					$('.allimgsbynum img').eq(i).prop('src',"GetImgServlet.do?imgpath="+json[i].shareimg);
				}
			});
		});
		$('#leftbtn1').click(function(){
			var start=1;
			var end=3;
			var url="SwitchImgServlet2.do?start="+start+"&end="+end;
			$.get(url,function(data){
				var json=eval("("+data+")");
				for(var i=0;i<json.length;i++){
					$('.allimgsbydate img').eq(i).prop('src',"GetImgServlet.do?imgpath="+json[i].shareimg);
				}
			});
		});
		$('#rightbtn1').click(function(){
			var start=2;
			var end=4;
			var url="SwitchImgServlet2.do?start="+start+"&end="+end;
			$.get(url,function(data){
				var json=eval("("+data+")");
				for(var i=0;i<json.length;i++){
					$('.allimgsbydate img').eq(i).prop('src',"GetImgServlet.do?imgpath="+json[i].shareimg);
				}
			});
		});
	})
</script>
</head>
<body>
	<iframe src="header.jsp" width="100%" height="55px"></iframe>
	<div class="row" style="margin-top: 20px;">
		<div class="col-md-5 col-md-offset-1">
			<div class="panel panel-default container-fluid zuire">
				<div class="panel-heading">最热图片</div>
				<div class="panel-body">
					<div class="col-sm-12 col-md-12">
						<div class="thumbnail">
							<a id="likeadd" class="label label-info">
							<span class="glyphicon glyphicon-heart-empty text-danger"></span>我喜欢</a>
						    <span class="label label-info pull-right" id="showcount">
							<span class="glyphicon glyphicon-eye-open"></span>${mySharesbynum[0].likecount }</span>
							<img id="showBydate" src="${mySharesbynum[0].shareimg }"
								alt="..." style="height: 280px">
							<input id="init1" type="hidden" value="${mySharesbynum[0].shareimg }"/>
							<div class="caption">
								<p>
									<span class="glyphicon glyphicon-book text-info"></span><a class="collectbtn1" href="#">收藏</a><span
										class="glyphicon glyphicon-arrow-down text-info"></span><a class="load" href="ImgLoadServlet.do?imgpath=${myShares[0].shareimg }">下载</a> <span
										class="glyphicon glyphicon-hand-right text-info"></span>分享 <span
										class="glyphicon glyphicon-retweet text-info"></span>更多
								</p>
								<p>
									<span class="pull-right text-danger" id="showtime" style="padding-top: 30px;">分享日期：${mySharesbynum[0].mydate }</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row allimgsbydate">
				<div id="leftbtn1" class="col-sm-1 col-md-1"><span class="glyphicon glyphicon-chevron-left" style="padding-top: 60px;"></span></div>
				<c:forEach var="myShare" items="${mySharesbynum }">
					<div class="col-sm-3 col-md-3">
						<div class="thumbnail">
							<img src="${myShare.shareimg }" alt="..." style="height: 100px" />
							<input class="shareimg" type="hidden" value="${myShare.shareimg }"/>
							<input class="likecount" type="hidden"
								value="${myShare.likecount }" />
							<input class="sharetime" type="hidden" value="${myShare.mydate }" />
						</div>
					</div>
				</c:forEach>
				<div id="rightbtn1" class="col-sm-1 col-md-1"><span class="glyphicon glyphicon-chevron-right" style="padding-top: 60px;"></span></div>
			</div>
		</div>
		<div class="col-md-5">
			<div class="panel panel-default container-fluid zuixin">
				<div class="panel-heading">最新图片</div>
				<div class="panel-body">
					<div class="col-sm-12 col-md-12">
						<div class="thumbnail">
							<a id="likeadd2" class="label label-info"><span
								class="glyphicon glyphicon-heart-empty text-danger"></span>我喜欢</a> <span
								class="label label-info pull-right" id="showcountbynum"><span
								class="glyphicon glyphicon-eye-open"></span>${myShares[0].likecount }</span>
							<img id="showBynum" src="${myShares[0].shareimg }" alt="..."
								style="height: 280px">
							<input id="init2" type="hidden" value="${myShares[0].shareimg }"/>
							<div class="caption">
								<p>
									<span class="glyphicon glyphicon-book text-info"></span><a class="collectbtn2" href="#">收藏</a> <span
										class="glyphicon glyphicon-arrow-down text-info"></span><a class="load" href="ImgLoadServlet.do?imgpath=${myShares[0].shareimg }">下载</a> <span
										class="glyphicon glyphicon-hand-right text-info"></span>分享 <span
										class="glyphicon glyphicon-retweet text-info"></span>更多
								</p>
								<p>
									<span class="pull-right text-danger" id="showtimebynum" style="padding-top: 30px;">分享日期：${myShares[0].mydate }</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row allimgsbynum">
				<div id="leftbtn" class="col-sm-1 col-md-1"><span class="glyphicon glyphicon-chevron-left " style="padding-top:60px;"></span></div>
				<c:forEach var="myShare" items="${myShares }">
					<div class="col-sm-3 col-md-3">
						<div class="thumbnail">
							<img src="${myShare.shareimg }" alt="..." style="height: 100px" />
							<input class="shareimg" type="hidden" value="${myShare.shareimg }"/>
							<input class="likecount" type="hidden"
								value="${myShare.likecount }" />
							<input class="sharetime" type="hidden" value="${myShare.mydate }" />
						</div>
					</div>
				</c:forEach>
				<div id="rightbtn" class="col-sm-1 col-md-1"><span class="glyphicon glyphicon-chevron-right" style="padding-top:60px;"></span></div>
			</div>
		</div>
	</div>
	<!-- 尾页 -->
	<iframe src="footer.jsp" width="100%" height="250px" style="border: none"></iframe>
</body>
</html>