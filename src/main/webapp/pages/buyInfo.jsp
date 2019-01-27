<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="jspHeader.jsp"%>
<title></title>
<link rel="stylesheet" type="text/css"
	href="js/jquery-picture-baiye/css/osSlider.css" />
<link rel="stylesheet" type="text/css" href="css/buyInfo.css" />
<link rel="stylesheet" type="text/css"
	href="js/jquery-rating/css/css-stars.css" />
<script src="js/jquery-picture-baiye/js/osSlider.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-rating/js/jquery.barrating.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		//进入学校悬停
		$('.lessonInduce .inSchool a').mouseover(function() {
			$(this).animate({
				'backgroundColor' : '#339966'
			}, 'slow');
		});
		$('.lessonInduce .inSchool a').mouseout(function() {
			$(this).animate({
				'backgroundColor' : '#33BF85'
			}, 'slow');
		});
		$('.lessonInduce .shoucang a').mouseover(function() {
			$(this).animate({
				'backgroundColor' : '#F2F2F2'
			}, 'slow');
		});
		$('.lessonInduce .shoucang a').mouseout(function() {
			$(this).animate({
				'backgroundColor' : '#FEFEFE'
			}, 'slow');
		});
		//评价切换
		$('.lessonInduce .eval_choice li').click(function() {
			$(this).children('input[type=radio]').attr('checked', 'true');
		});
		$('#example').barrating({
			theme : 'css-stars',
			initialRating : 2
		});
		//$('#divMain').hide();
		$('#saleManBtn').click(function(){
			$('#divMain').toggle();
		});
		//键盘监听
    	$(document).keypress(function(e){
    		if(e.which==13){
    			SendContent($("#txtContent").val());
    			goToBottom();
    		}
    	});
    	//读取消息
    	GetMessageList();
    	//读取在线用户
    	GetOnlineUsers();
    	//初始化表情
    	InitFaces();
    	//自动刷新
    	AutoRefresh();
    	//发送按钮事件响应
    	$("#Button1").click(function(){
    		var $content=$("#txtContent");
    		if($content.val()!=""){
    			SendContent($content.val());
    		}else{
    			alert("发送内容不能为空！");
    			return false;
    		}
    	});
    	$("#Button2").click(function(){
    		if(confirm("确认关闭？")){
    			OffLine();
    		}
    	});
    	//发送消息
    	function SendContent(content){
    		$.ajax({
    			type:"POST",
    			url:"DealData.jsp",
    			data:"action=SendContent&d="+new Date()+"&content="+content,
    			success:function(data){
    				if(data.indexOf("True")){
    					//获取消息
    					GetMessageList();
    					//清空发送框
    					$("#txtContent").val("");
    					
    					goToBottom();
    					//alert('shit for SendMessage');
    				}else{
    					alert("发送失败");
    				}
    			}
    		});
    	}
    	//获取消息
    	function GetMessageList(){
    		$.ajax({
    			type:"POST",
    			url:"DealData.jsp",
    			data:"action=ChatList&d="+new Date(),
    			success:function(data){
    				if(data.indexOf("unLogin")>0){
    					alert("非法进入，请先登录！");
    					window.location="index.html";
    				}else{
    					$("#divContent").html(data);
    				}
    				//alert('shit for GetMessage');
    			}
    		});
    	}
    	//获取在线用户列表
    	function GetOnlineUsers(){
    		$.ajax({
    			type:"POST",
    			url:"DealData.jsp",
    			data:"action=onLineList&d="+new Date(),
    			success:function(data){
    				$("#divOnline").html(data);
    				//alert('shit for GetOnlineUsers');
    			}
    		});
    	}
    	//设置表情
    	function InitFaces(){
    		var strHTML="";
    		for(var i=1;i<=7;i++){
    			strHTML+="<img src='QQface/"+i+".gif' id='"+i+"'/>";
    		}
    		$("#divFace").html(strHTML);
    	}
    	//图片监听
    	$("table tbody tr td img").click(function(){
    		var $txtContent=$("#txtContent");
    		if($txtContent.val()!=undefined){
    			var strContent=$txtContent.val()+"<:"+this.id+":>";
    		}else{
    			var strContent="<:"+this.id+":>";
    		} 
            $("#txtContent").val(strContent);
        });
    	//下线
    	function OffLine(){
    		$('#divMain').toggle();
    	}
    	//到底部去
    	function goToBottom(){
    		div=document.getElementById("divContent");
			div.scrollTop = div.scrollHeight;
    	}
    	//自动更新页面信息
    	function AutoRefresh(){
    		setInterval(GetMessageList,2000);
    		setInterval(GetOnlineUsers,4000);
    	}
	});
</script>
</head>
<body>
	  <iframe src="header.jsp" width="100%" height="55px"></iframe>
	<c:set var="price" value="${sessionScope.price }"></c:set>
	<c:set var="spotname" value="${sessionScope.spotname }"></c:set>
	<!--课程封面和简介-->
	<div class="container lessonFace">
		<div class="row">
			<div class="col-md-6 slider">
				<ul class="slider-main">
					<li><img src="img/1.jpg" alt="" /></li>
					<li><img src="img/2.jpg" alt="" /></li>
					<li><img src="img/3.jpg" alt="" /></li>
					<li><img src="img/4.jpg" alt="" /></li>
				</ul>
			</div>
			<div class="col-md-6">
				<h3>马尔代夫卡尼岛ClubMed Kani自由行(4钻)·6日4晚 销量领先 一价全包</h3>
				<div class="row price_div">
					<span>门票价</span><span class="price">¥&nbsp;${price }</span> <span>地点</span><span
						class="lesson_info">${spotname }</span>
				</div>
				<div class="row">
					<span>累计购买</span><span class="lesson_info">1668</span> <span>游客满意度</span><span
						class="lesson_info">78.6% （查看评价467 条）</span>
				</div>
				<div class="row">
					<span><span class="cheap_span">优惠</span></span><span
						class="lesson_info">ClubMed助您去旅游每单立赠800元</span>
				</div>
				<div class="row">
					<div class="col-md-2">
						<span class="tuijian_liyou">推荐理由</span>
					</div>
					<div class="col-md-10">
						<span class="tuijian">★ 由全球著名俱乐部Club Med倾心打造，马尔代夫著名的一价全包酒店。</span>
						<span class="tuijian">★ 水上屋全新装修，奉上极致体验。内设挑高水上大厅和超炫海上吊床。</span> <span
							class="tuijian">★ 国际化G.O.团队为您提供全方位协助。包括中文服务、中文菜单和度假指南。</span>
					</div>
				</div>
				<div class="row">
					<a href="buy.jsp" class="btn nowBuy">立即购买</a> <a class="buyCar btn"><img
						src="img/buycar.png" /></a> <span><img src="img/shoucang.png" />收藏</span><span><img
						src="img/share.png" />分享</span>
				</div>
				<div class="row">
					<span>承诺</span><span class="lesson_info">15天担保期</span>
				</div>

			</div>
		</div>
	</div>

	<div class="container lessonInduce">
		<div class="row">
			<div class="col-md-9" style="border: 1px solid #999999;">
				<ul class="nav nav-tabs induceHeader">
					<li class="active"><a href="#easyInduce" data-toggle="tab">推荐玩法</a></li>
					<li><a href="#list" data-toggle="tab">预定须知</a></li>
					<li><a href="#write_card" data-toggle="tab">签证</a></li>
					<li><a href="#eval" data-toggle="tab">用户点评<span
							class="badge" style="background-color: #FB6238;">11</span></a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="easyInduce">
						<div class="row play_method">
							<div class="col-md-2 tab_logo">
								<img src="img/t1.png"
									style="margin: 20px 15px; width: 82px; height: 82px;" />
							</div>
							<div class="col-md-10">
								<div class="row">
									<span class="introduce_header">卡尼岛度假村</span>
									<div class="col-md-2">
										<img />
									</div>
									<div class="col-md-10">
										<span>2000年开业的CLUBMED
											KANI（卡尼岛地中海俱乐部）闻名于它独特的一价全包度假套餐服务。卡尼岛是马尔代夫所有岛屿中最具田园诗风格的一个，被称为“地球上最后的天堂”。</span>
										<span>一价全包：免费享用一日三餐及小食，露天酒吧提供无限畅饮，放心将孩子交给儿童俱乐部，国际化G.O提供超过60种具有异国情调的水上、陆上活动及相关教练指导。每晚不同的免费娱乐活动和大型文艺表演。</span>
									</div>
									<div class="row">
										<div class="col-md-4">
											<span>酒店集团：Club Med</span> <span>含餐情况：一价全包</span> <span>上岛方式&时间：快船35分钟</span>
										</div>
										<div class="col-md-4">
											<span>岛屿级别：四星级</span> <span>沙滩等级：★★★★★</span>
										</div>
										<div class="col-md-4">
											<span>所属礁环：马累北环礁</span> <span>浮潜等级：★★★☆☆</span>
										</div>
									</div>
								</div>
								<div class="row">
									<span class="introduce_header">卡尼岛度假村相册</span>
									<div class="row">
										<div class="col-md-6">
											<img src="img/4.jpg" />
										</div>
										<div class="col-md-6">
											<img src="img/4.jpg" />
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<img src="img/4.jpg" />
										</div>
										<div class="col-md-6">
											<img src="img/4.jpg" />
										</div>
									</div>
								</div>
								<div class="row">
									<span class="introduce_header">卡尼岛度假村房型</span> <span
										class="house_tip">高级房 Superior Room</span>
									<div class="row">
										<div class="col-md-6">
											<img src="img/4.jpg" />
										</div>
										<div class="col-md-6">
											<img src="img/4.jpg" />
										</div>
									</div>
									<span class="house_tip">高级房 Superior Room</span>
									<div class="row">
										<div class="col-md-6">
											<img src="img/4.jpg" />
										</div>
										<div class="col-md-6">
											<img src="img/4.jpg" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="list">
						<div class="row list_div">
							<div class="row">
								<div class="col-md-2 tab_logo">
									<img src="img/t2.png" />
								</div>
								<div class="col-md-9 tab_content">
									<div class="row">
										<span class="tip_header">退变更限制</span>
										<ol>
											<li>预授权或付款成功后如需更改、取消、退订，将按您所订资源的退变更条款收取费用。</li>
										</ol>
									</div>
									<div class="row">
										<span class="tip_header">附加费限制</span>
										<ol>
											<li>产品费用中已经包含“Club
												Med俱乐部新会员会员费”，若您是老会员或入会在一年内，请选择相关老会员减免会员费选项。</li>
											<li>如您选择了3人及以上（成人/儿童/婴儿）入住一间房，则需支付第三人附加费（成人/儿童/婴儿），请根据计价单位在预订时勾选相应选项，若预订产品时无法选择儿童人数，则说明此酒店不接受儿童入住。</li>
										</ol>
									</div>
									<div class="row">
										<span class="tip_header">出行警示及说明</span>
										<ol>
											<li>为普及旅游安全知识及旅游文明公约，使您的旅程顺利圆满完成，特制定<a>《携程旅游告游客注意事项》</a>，请您认真阅读并切实遵守；
											</li>
											<li>根据中国海关总署颁布的2010年54号令，进境公民旅客携带在境外获取的个人自用进境物品总值在5000元以内（含5000元）的，海关予以免税放行。烟草制品、酒精制品、照相机、摄像机等20种商品不在免税范围内，敬请知晓。详情请点击。</li>
											<li>根据最新发布的《中华人民共和国禁止携带、邮寄进境的动植物及其产品和其他检疫物名录》，将燕窝、新鲜水果、蔬菜、动物源性中药材、转基因生物材料等列入严禁携带或邮寄进境项目，敬请知晓。更多信息，请<a>点击</a>。
											</li>
										</ol>
									</div>
									<div class="row">
										<span class="tip_header">支付信息</span>
										<ol>
											<li>本产品支持信用卡、网银、第三方、礼品卡、储蓄卡、微信支付，具体以支付页为准。本产品为特例产品，不支持使用旅游度假优惠券预订。</li>
										</ol>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="write_card">
						<div class="row list_div">
							<div class="row">
								<div class="col-md-2 tab_logo">
									<img src="img/t3.png" />
								</div>
								<div class="col-md-9 tab_content">
									<div class="row">
										<span class="tip_header">签证须知</span>
										<ol>
											<li>如您持外籍护照前往中国境外（包括香港、澳门、台湾），请确保持有再次进入中国大陆的有效签证。</li>
											<li>关于签证：您可以凭护照和马尔代夫登机牌直接出境，抵达马尔代夫后办理落地签证。中国公民在马尔代夫均可获取30天有效停留的免费落地签。马尔代夫政府规定整个旅行活动期间距离护照有效期不足半年者，将禁止其入境，请注意您的护照有效期。</li>
										</ol>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="eval">
						<div class="row eval_div">
							<div class="row eval_header">
								<span>游客评价</span><span class="messSpan">(&nbsp;1&nbsp;)</span>
							</div>
							<div class="row eval_table">
								<div class="col-md-7">
									<table class="table">
										<tr>
											<td rowspan="3">100%<br /> <span>满意度</span></td>
											<td>好评(56)</td>
											<td><span></span></td>
										</tr>
										<tr>
											<td>中评(102)</td>
											<td><span></span></td>
										</tr>
										<tr>
											<td>差评(23)</td>
											<td><span></span></td>
										</tr>
									</table>
								</div>
								<div class="col-md-5 eval_words">
									<span>舒适，服务态度很好1</span> <span>赞一个1</span> <span>有收获1</span>
								</div>
							</div>
							<div class="row eval_choice">
								<ul class="nav nav-tabs" style="border: none;">
									<li class="active"><a href="#allEval" data-toggle="tab"><input
											type="radio" />全部</a></li>
									<li><a href="#goodEval" data-toggle="tab"><input
											type="radio" />好评</a></li>
									<li><a href="#midEval" data-toggle="tab"><input
											type="radio" />中评</a></li>
									<li><a href="#badEval" data-toggle="tab"><input
											type="radio" />差评</a></li>
								</ul>
							</div>
							<div class="row eval_content">
								<div class="tab-content" style="border: none;">
									<div class="tab-pane active" id="allEval">
										<div class="row eval_girl">
											<div class="col-md-2">
												<img src="img/t4.png" /> <br /> <span>火星人U</span>
											</div>
											<div class="col-md-10">
												<div class="row good_eval">
													<label style="margin-top: 10px;">总体感受: </label> 
													<select id="example">
														<option value="1" data-html="一般">1</option>
														<option value="2">还好</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
													</select>

												</div>
												<div class="row">
													<div class="col-md-8 eval_words">
														<span style="margin-left: -20px;">舒适,服务态度很好1</span> <span>赞一个1</span>
														<span>有收获的一次旅行1</span>
													</div>
													<div class="col-md-4 response">
														<span>2015-11-11 12:24 </span> <span>回复</span>
													</div>
												</div>

											</div>
										</div>
									</div>
									<div class="tab-pane" id="goodEval">好评</div>
									<div class="tab-pane" id="midEval">中评</div>
									<div class="tab-pane" id="badEval">差评</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 saleMan">
				<div class="row">
					<div class="col-md-5">
						<img src="img/logo_header.jpg" style="width: 70px; height: 70px;" />
					</div>
					<div class="col-md-7">
						<span class="logo_word">惠游国旅<br /> <img
							src="img/heart.jpg" /><img src="img/heart.jpg" /><img
							src="img/heart.jpg" /></span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5">
						<span>满意度</span>
					</div>
					<div class="col-md-7">
						<span>99.84%</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5">
						<span>总售数量</span>
					</div>
					<div class="col-md-7">
						<span>1964</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5">
						<span>月售数量</span>
					</div>
					<div class="col-md-7">
						<span>97</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5">
						<span>供应商</span>
					</div>
					<div class="col-md-7">
						<span>惠游</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5">
						<span>客服</span>
					</div>
					<div class="col-md-7">
						<div class="input-group">
							<a id="saleManBtn" type="text" placeholder="请输入关键字" id="schTxt" class="form-control"> 
								<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
								在线客服
							</a>
						</div>
					</div>
				</div>
				<div class="row mars">
					<div class="col-md-6 inSchool">
						<a href="#" class="btn">进入学校</a>
					</div>
					<div class="col-md-6 shoucang">
						<a href="#" class="btn">已收藏</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--footer-->
	<iframe src="footer.jsp" width="100%" height="250px" style="border:none"></iframe>
	
	<!-- 聊天对话款 -->
	<div id="divMain">
		<!-- <div class="row">
			<span class="glyphicon glyphicon-remove" style="float: right;"></span>
		</div> -->
       	<div class="divtop">
       		<div class="divL">
       			<h3>咨询平台</h3>
       			<div class="divShow" id="divContent" style="overflow-y:scroll;"></div>
       		</div>
       		<div class="divR">
       			<h3>在线人员</h3>
       			<div class="divShow" id="divOnline"></div>
       		</div>
       		<div class="clear"></div>
       	</div>
       	<div class="divBot">
       		<table>
       			<tr><td colspan="2" id="divFace" class="pb"></td></tr>
       			<tr>
       				<td>
       					<textarea id="txtContent" class="txt"></textarea>
       				</td>
       				<td class="btn_div">
       					<button id="Button1" class="btn btn-success">发送</button>
       					<button  id="Button2" class="btn btn-info">关闭</button>
       				</td>
       			</tr>
       		</table>
       	</div>
        <span id="spnMsg" class="clsTip">正在发送数据...</span>
    </div>
		
	<script type="text/javascript">
		var slider = new osSlider({
			pNode : '.slider',
			cNode : '.slider-main li',
			speed : 3000,
			autoPlay : true
		});
	</script>
</body>
</html>
