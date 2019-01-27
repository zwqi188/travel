<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<%@include file="jspHeader.jsp" %>
	<link rel="stylesheet" type="text/css" href="css/myshare.css"/>
	<title>Insert title here</title>
	<script type="text/javascript">
		$(function(){
			/* $('#shareBtn').click(function(){
				alert("11111");
				$('#sharediv').css("display","block");
			}); */
			$('#privewBtn').click(function(){
				$('#imgUploadForm').append($('#imgFile'));
				$('#imgUploadForm').submit();
			});
			//初始化第一个可见
			$('.item:first').addClass('active');
			/* $('#imgupload').click(function(){
				$('#imgfile').after('<input type="text" id="imgpath" name="imgpath"/>');
				$('#fileimgupload').append( $('#imgfile'));
				$('#fileimgupload').hide();
				$('#fileimgupload').submit();
			}); */
		});
		function showImg(imgPath) {
			 $('#imgPath').val(imgPath);
			 $('#showImg').attr('src','${pageContext.servletContext.contextPath}'+imgPath);
		}
		function submitShare(){
			var url = "Add.do?opt=MyShare";
			var theme = $('#theme').val();
			var content = $('#content').val();
			var spotname = $('#spotname').val();
			var imgPath = $('#imgPath').val();
			var data = {"theme":theme,"content":content,"spotname":spotname,"imgPath":imgPath};
			$.post(url,data,function(data){
				alert("分享成功");
			});
			
		}
		function shareShow() {
		 	$('#sharediv').toggle(); 
			/* $('#sharediv').css("display","block"); */
		}
		function callback(content){
		   alert(content);
		   $('#imgpath').val(content);
		   $('#photo').attr("src","${pageContext.servletContext.contextPath}"+content);
		}
	  
	</script>
</head>
<body>
	<div class="row share_header">
		<form class="form-inline">
			<div class="form-group control-label col-md-6 col-sm-6">
				<span class="logo_title">惠游分享</span>
			</div>
			<div class="form-group col-md-4 col-sm-4">
			    <span class="input-group-btn">
			   		<input type="text" class="form-control">
                   <button class="btn btn-default" type="button">搜索</button>
                   <button  type="button" class="btn btn-info" id="shareBtn" style="margin-left: 50px;" onclick="shareShow()">我要分享</button>
                </span>
		    </div>
		</form>
	</div>
	
	<div class="carousel slide" id="view" data-ride="">
		<ul class="carousel-indicators">
			<c:forEach var="i" begin="0" end="${pageSize }">
				<li data-target="#view" data-slide-to="${i}"></li>
			</c:forEach>
		</ul>
		<c:set value="0" var="count"/>
		<div class="carousel-inner">
			<c:forEach var="j" begin="1" end="${pageSize }">
				<div class="item">
					<c:if test="${j!=pageSize }">
						<c:forEach var="k" begin="0" end="2">
							<div class="row sharedivs" >
								<c:forEach var="m" begin="0" end="2">
									 <div class="col-md-4 col-sm-4 " >
							  	 	 	<div class="share_show thumbnail">
							  	 	 		<a class="glyphicon glyphicon-trash" href="Delete.do?opt=MyShare&optId=${allMyShares[count].shareid }"></a>
											<img alt="" src="${allMyShares[count].shareimg }">
											<div class="spotname_div">
												<a class="btn-xs btn btn-danger" href="Look.do?opt=MyShare&optId=${allMyShares[count].shareid }">查看</a>
												<a class="btn-xs btn btn-success">编辑</a>
												<span>${allMyShares[count].content }</span>
												<c:set var="count" value="${count+1}" />
											</div>
							  	 	 	</div>
							  	 	 </div>
								</c:forEach>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${j==pageSize }">
						<c:forEach var="k" begin="1" end="${lessRow }">
							<c:if test="${k!=lessRow }">
								<div class="row sharedivs" >
									<c:forEach var="m" begin="0" end="2">
										<div class="col-md-4 col-sm-4 " >
								  	 	 	<div class="share_show thumbnail">
								  	 	 		<a class="glyphicon glyphicon-trash" href="Delete.do?opt=MyShare&optId=${allMyShares[count].shareid }"></a>
												<img alt="" src="${allMyShares[count].shareimg }">
												<div class="spotname_div">
													<a class="btn-xs btn btn-danger" href="Look.do?opt=MyShare&optId=${allMyShares[count].shareid }">查看</a>
													<a class="btn-xs btn btn-success">编辑</a>
													<span>${allMyShares[count].content }</span>
													<c:set var="count" value="${count+1}" />
												</div>
								  	 	 	</div>
								  	 	 </div>
									</c:forEach>						
								</div>
							</c:if>
							<c:if test="${k==lessRow }">
								<div class="row sharedivs" >
									<c:forEach var="n" begin="1" end="${lastNum }">
										<div class="col-md-4 col-sm-4 " >
								  	 	 	<div class="share_show thumbnail">
								  	 	 		<a class="glyphicon glyphicon-trash" href="Delete.do?opt=MyShare&optId=${allMyShares[count].shareid }"></a>
												<img alt="" src="${allMyShares[count].shareimg }">
												<div class="spotname_div">
													<a class="btn-xs btn btn-danger" href="Look.do?opt=MyShare&optId=${allMyShares[count].shareid }">查看</a>
													<a class="btn-xs btn btn-success">编辑</a>
													<span>${allMyShares[count].content }</span>
													<c:set var="count" value="${count+1}" />
												</div>
								  	 	 	</div>
								  	 	 </div>
									</c:forEach>								
								</div>
							</c:if>
						</c:forEach>
					</c:if>
				</div>
			</c:forEach>
		</div>
		<a class="left carousel-control" href="#view" data-slide="prev" id="prev" role="button">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#view" data-slide="next" id="next" role="button">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	
	 <div class="row edit_share"  id="sharediv">
	       <form class="form-horizontal content-form"  method="post" id="shareform">
			<div class="form-group">
				<label for="theme" class="col-sm-3 control-label">主题:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="theme" name="theme" >
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-3 control-label">内容:</label>
				<div class="col-sm-6">
					<textarea rows="4" cols="50" id="content" name="content"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="spotname" class="col-sm-3 control-label">景点:</label>
				<div class="col-sm-3">
					<select name="spotname" id="spotname" class="form-control">
					   <c:forEach items="${spotsSelect}" var="signspot">
					      <option value="${signspot.spotid}">${signspot.spotname}</option>  
					   </c:forEach> 
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="telephone" class="col-sm-3 control-label">图片:</label>
				 <div class="col-sm-6"><img src="" id="showImg" style="width: 180px;height: 100px;border: 1px solid aqua;"/></div>
			</div>
			<div class="form-group">
			<div class="col-sm-offset-3 col-md-3" style="position: relative;">
                <input type="file" name="imgfile form-control" class="img_file" id="imgFile">
				<input type="text" class="img_file form-control" name="imgPath" id="imgPath" placeholder="点击选择图片"/>
              </div>
              <div class="col-sm-offset-6  col-md-1">
				<button type="button" id="privewBtn" class="btn btn-success">预览</button>
			  </div>
            </div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-6">
					<a class="btn btn-info" onclick="submitShare()">提交</a>
				    <a class="btn btn-info" onclick="shareShow()" href="MyShare.do">关闭</a>
				</div>
			</div>
		</form>
       <form action="AjaxUploadFile.do" method="post" enctype="multipart/form-data" target="hiddeFrame" id="imgUploadForm"></form>
       <iframe name="hiddeFrame" id="hiddeFrame" style="display: none;"></iframe>
        <!-- <div style="clear: both;"></div> -->
	</div>
	
</body>
</html>