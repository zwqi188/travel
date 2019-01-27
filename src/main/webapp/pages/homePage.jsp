<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="jspHeader.jsp"%>
<title></title>
<link rel="stylesheet" type="text/css" href="css/homePage.css" />
<link rel="stylesheet" type="text/css" href="css/register.css" />
<script type="text/javascript">
	function showUser() {
		//$('#userName').text(getCookies('userName'));
	}
	$(function() {
		var flush = 1;
		$('#header_tab a').mouseover(function(e) {
			$(this).css({
				'background-color' : '#59A8FF' /*#59A8FF*/
			});
			$(this).children('span').css({
			//'color': 'white'
			});
			var idx = Number($(this).attr('href').substr(5));
			var top_ht = (idx - 1) * 80;
			e.preventDefault();
			$(this).tab('show');
			$('.pop_win').css({
				top : top_ht + 'px'
			});
		});
		$('#header_tab a').mouseout(function() {
			$(this).css({
				'background-color' : 'white'
			//'border': 'none'
			});
			$('.content_left .nav-tabs li .travel_type span').css({
			//'color': 'black'
			});
		});
		$('ul#header_tab a').mouseleave(function(){
			if($('.bug .idtabs').val()==""||$('.bug .idtabs').val()==null||$('.bug .idtabs').val()=="mouseleave"){
				$('.bug').hide();
			}
		});
		$('.bug').mouseleave(function(){
			$('.bug .idtabs').val("mouseleave");
			$('.bug').hide();
		})
		$('.bug').mouseenter(function(){
			$('.bug .idtabs').val("mouseenter");
		})
		$('#header_tab a').mouseenter(function(){
			/* window.location.reload(); */
			var href=$(this).prop('href');
			href=href.substring(href.lastIndexOf('#'));
			$(href).show();
		});
		//回到顶部图标动画
		$('.back_top .backTop').mouseover(function() {
			$('.home').animate({
				height : '46px',
				opacity : '1'
			}, 'slow');
		});
		$(this).children('span').css({
			'color' : 'black'
		});
		//显示城市
		$('.menu_btn').click(function() {
			$(this).css({
				'border-bottom' : 'none'
			});
		});
		//选中喜欢的景点的动画
		$('.demo_show .img_show .thumbnail').mouseover(function() {
			$(this).css({
				'border' : '2px solid #FFD986'
			});
		}).mouseout(function() {
			$(this).css({
				'border' : 'none'
			});
		});
		//层叠图片动画
		$('.content_center .bottom_menu_img div').click(function() {
			$(this).animate({
				width : "220px",
				height : "150px"
			}, "slow").animate({
				width : "87px",
				height : "150px"
			}, "slow");
		});
		$('#exitdiv').mouseover(function(){
			$(this).removeClass();
			$(this).addClass("floatdiv2");
		}).mouseout(function(){
			cancle();
		});
	});
	function changeShowCity(city) {
		alert(city);
		$('#"cityBtn"').text(city);
	}
	function cancle(){
		$('#exitdiv').removeClass();
		$('#exitdiv').addClass("floatdiv")
	}
	/* function query(){
		$.ajax({
			url:"GetSignspots.do",
			type:"post",
			data:{"spotname":$.trim($('#cityBtn').text())},
			datatype:"json",
			success:function(data){
				var sps=eval(data);
				var idx = 0;
				$('.imgshows').each(function(i){
					$(this).attr('src','GetImgServlet.do?imgpath='+sps[idx++].spotimg);
				});
				idx = 0;
				$('.img_title').each(function(i){
					$(this).text(sps[idx++].spotname);
				});
				idx = 0;
				$('.travle_price').each(function(i){
					$(this).text(sps[idx++].price);
				});
			},
			error:function(data){
				alert('加载失败');
			}
	}); */
</script>
</head>

<body>
	<iframe src="header.jsp" width="100%" height="55px" class="header_frame"></iframe>
	<div class="container sch_div">
		<div class="row">
			<div class="col-md-4">
				<div class="row city_div">
					<button class="btn menu_btn" id="cityBtn" onclick="query()"
						data-toggle="collapse" href="#citys">
						${cityName }<span class="caret"></span>
					</button>
					<div class="collapse pop_men_div" id="citys">
						<form action="" class="form-inline">
							<div class="form-group col-md-6 col-md-offset-1">
								<input type="text" name="cityName" id="cityName"
									class="form-control" placeholder="搜索城市名查询" />
							</div>
							<div class="form-group col-md-2">
								<button class="btn btn-success">搜索</button>
							</div>
							<div style="clear: both;"></div>
						</form>
						<table class="table">
							<c:forEach items="${allCitys }" var="city">
								<tr>
									<td><a href="GetCitySignspots.do?cityName=${city }">${city }</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<button class="btn menu_btn" id="planeBtn" data-toggle="collapse"
						href="#planes">
						机+酒<span class="caret"></span>
					</button>
					<div class="collapse pop_men_div" id="planes"></div>
				</div>
				<div class="row menu_content"></div>
			</div>
			<div class="col-md-4">
				<form method="get" class="has-feedback">
					<div class="input-group wrap_sch">
						<span class="input-group-btn">
							<button class="btn dropdown-toggle all_product"
								data-toggle="dropdown">
								全部产品<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li>全网</li>
							</ul>
						</span> <input type="text" id="schTxt" class="form-control sch_txt"
							placeholder="旅游狂欢月" /> <span class="input-group-btn">
							<button class="btn form-control sch_btn">
								<span class="glyphicon glyphicon-search form-control-feedback"
									aria-hidden="true"></span>搜索
							</button>
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--全部课程-->
	<div class="container content1">
		<div class="row">
			<div class="col-md-4 content_left">
				<ul class="nav nav-tabs nav-pills nav-stacked" id="header_tab">
					<li class="text-right"><a href="#tabs1" data-toggle="tab">
							<div class="row">
								<div class="col-md-2">
									<img src="img/m1.png" />
								</div>
								<div class="col-md-8 travel_type">
									<span class="travle_title">${cityName }周边旅游</span> 
									<span class="travle_location">
										<span>${signPots[0].spotname }</span><span>${signPots[1].spotname }</span><span>${signPots[2].spotname }</span>
										<span>${signPots[3].spotname }</span><span>${signPots[4].spotname }
									</span>
								</div>
								<div class="col-md-2 jiantou">
									<span class="glyphicon glyphicon-chevron-right"
										aria-hidden="true" style="color: #3480E8;"></span>
								</div>
							</div>
					</a></li>
					<li class="text-right"><a href="#tabs2" data-toggle="tab">
							<div class="row">
								<div class="col-md-2 menu_logo">
									<img src="img/m2.png" />
								</div>
								<div class="col-md-8 travel_type">
									<span class="travle_title">国内旅游</span> <span
										class="travle_location"> <span class="abs_span">丽江</span><span>三亚</span><span>哈尔滨</span><span
										class="abs_span">桂林</span><span>厦门</span> <span>九寨沟</span><span>北京</span><span>长白山</span><span>成都</span><span>张家界</span><span>贵州</span><span>西双版纳</span>
									</span>
								</div>
								<div class="col-md-2 jiantou">
									<span class="glyphicon glyphicon-chevron-right"
										aria-hidden="true" style="color: #3480E8;"></span>
								</div>
							</div>
					</a></li>
					<li class="text-right"><a href="#tabs3" data-toggle="tab">
							<div class="row">
								<div class="col-md-2">
									<img src="img/m3.png" />
								</div>
								<div class="col-md-8 travel_type">
									<span class="travle_title">香港 澳门 台湾</span> <span
										class="travle_location"><span class="abs_span">香港迪士尼</span><span>日月潭</span><span>高雄</span><span>台北</span><span>垦丁</span></span>
								</div>
								<div class="col-md-2 jiantou">
									<span class="glyphicon glyphicon-chevron-right"
										aria-hidden="true" style="color: #3480E8;"></span>
								</div>
							</div>
					</a></li>
					<li class="text-right"><a href="#tabs4" data-toggle="tab">
							<div class="row">
								<div class="col-md-2">
									<img src="img/m4.png" />
								</div>
								<div class="col-md-8 travel_type">
									<span class="travle_title">日本 韩国</span> <span
										class="travle_location"><span>东京</span><span
										class="abs_span">北海道</span><span>冲绳</span><span>首尔</span><span>济州</span><span>大阪</span></span>
								</div>
								<div class="col-md-2 jiantou">
									<span class="glyphicon glyphicon-chevron-right"
										aria-hidden="true" style="color: #3480E8;"></span>
								</div>
							</div>
					</a></li>
					<li class="text-right"><a href="#tabs5" data-toggle="tab">
							<div class="row">
								<div class="col-md-2">
									<img src="img/m5.png" />
								</div>
								<div class="col-md-8 travel_type">
									<span class="travle_title">东南亚 南亚</span> <span
										class="travle_location"><span class="abs_span">马尔代夫</span><span
										class="abs_span">巴厘岛</span><span>新加坡</span><span>泰国</span><span>柬埔寨</span></span>
								</div>
								<div class="col-md-2 jiantou">
									<span class="glyphicon glyphicon-chevron-right"
										aria-hidden="true" style="color: #3480E8;"></span>
								</div>
							</div>
					</a></li>
					<li class="text-right"><a href="#tabs6" data-toggle="tab">
							<div class="row">
								<div class="col-md-2">
									<img src="img/m6.png" />
								</div>
								<div class="col-md-8 travel_type">
									<span class="travle_title">欧洲</span> <span
										class="travle_location"><span>西班牙</span><span
										class="abs_span">法国</span><span>英国</span><span>意大利</span><span>雅典</span><span>瑞士</span><span>德国</span></span>
								</div>
								<div class="col-md-2 jiantou">
									<span class="glyphicon glyphicon-chevron-right"
										aria-hidden="true" style="color: #3480E8;"></span>
								</div>
							</div>
					</a></li>
					<!-- <li class="text-right"><a href="#tabs7" data-toggle="tab"
						id="hide_tabs" style="display: none;"></a></li> -->
				</ul>
			</div>
			<div class="col-md-8">
				<div class="tab-content content_center">
					<div class="top_menu_img">
						<!--轮番滚动图片-->
						<div class="carousel slide" id="view" data-ride="carousel">
							<ul class="carousel-indicators">
								<li data-target="#view" data-slide-to="0"><span></span></li>
								<li data-target="#view" data-slide-to="1"></li>
								<li data-target="#view" data-slide-to="2"></li>
							</ul>
							<div class="carousel-inner">
								<div class="item active">
									<img src="img/home1.jpg" style="width: 100%; height: 300px;" />
									<div class="carousel-caption">
										<span>Comming to us</span> <br /> <span>to achieve
											your dreams!!!</span>
									</div>
								</div>
								<div class="item">
									<img src="img/home2.jpg" style="width: 100%; height: 300px;" />
									<div class="carousel-caption">
										<span>Comming to us</span> <br /> <span>to achieve
											your dreams!!!</span>
									</div>
								</div>
								<div class="item">
									<img src="img/home3.jpg" style="width: 100%; height: 300px;" />
									<div class="carousel-caption">
										<span>Comming to us</span> <br /> <span>to achieve
											your dreams!!!</span>
									</div>
								</div>
							</div>
							<a class="left carousel-control" href="#view" data-slide="prev"
								role="button"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#view" data-slide="next"
								role="button"> <span
								class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div class="bottom_menu_img">
						<div>
							<img src="img/homepageC1.jpg">
						</div>
						<div>
							<img src="img/homepageC2.jpg">
						</div>
						<div>
							<img src="img/homepageC3.jpg">
						</div>
						<div>
							<img src="img/homepageC4.jpg">
						</div>
						<div>
							<img src="img/homepageC5.jpg">
						</div>
						<div>
							<img src="img/homepageC6.jpg">
						</div>
						<div>
							<img src="img/homepageC7.jpg">
						</div>
					</div>
					<div class="tab-pane pop_win bug" id="tabs1">
						<input type="hidden" class="idtabs"/>
						<table class="table">
							<tr>
								<th rowspan="1">交通方式</th>
								<td><a href="#">巴士游</a></td>
								<td><a href="#">火车游</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="2">特色主题</th>
								<td><a href="#">游乐园</a></td>
								<td><a href="#">森林氧气吧</a></td>
								<td><a href="#">古镇村游</a></td>
							</tr>
							<tr>
								<td><a href="#">船游</a></td>
								<td><a href="#">摄影之旅</a></td>
								<td><a href="#">登山祈福</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="2">游玩天数</th>
								<td><a href="#">一日游</a></td>
								<td><a href="#">二日游</a></td>
								<td><a href="#">三日游</a></td>
							</tr>
							<tr>
								<td><a href="#">三日以上</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="3">周边目的地</th>
								<td><a href="#">普陀山</a></td>
								<td><a href="#">九华山</a></td>
								<td><a href="#">无锡</a></td>
								<td><a href="#">上海</a></td>
								<td><a href="#">黄山</a></td>
								<td><a href="#">绍兴</a></td>

							</tr>
							<tr>
								<td><a href="#">雁荡山</a></td>
								<td><a href="#">西塘</a></td>
								<td><a href="#">横店</a></td>
								<td><a href="#">安吉</a></td>
								<td><a href="#">九华山</a></td>
								<td><a href="#">六安</a></td>

							</tr>
							<tr>
								<td><a href="#">池州</a></td>
								<td><a href="#">海宁</a></td>
								<td><a href="#">杭州</a></td>
								<td><a href="#">千岛湖</a></td>
								<td><a href="#">其他</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="3">热点景区</th>
								<td><a href="#">常州恐龙园</a></td>
								<td><a href="#">西溪湿地</a></td>
								<td style="width: 190px;"><a href="#">芜湖方特欢乐世界</a></td>
							</tr>
							<tr>

								<td><a href="#">西湖</a></td>
								<td><a href="#">常州嬉戏谷</a></td>
								<td><a href="#">天目湖</a></td>
								<td><a href="#">天柱山</a></td>


							</tr>
							<tr>
								<td><a href="#">齐白山</a></td>
								<td><a href="#">灵山大佛</a></td>
								<td><a href="#">横店影视城</a></td>
								<td><a href="#">雁荡山</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="1">当季热销</th>
								<td><a href="#">苏州园林</a></td>
								<td><a href="#">祈福之旅</a></td>
							</tr>
						</table>
					</div>
					<div class="tab-pane pop_win bug" id="tabs2">
						<input type="hidden" class="idtabs"/>
						<table class="table">
							<tr>
								<th rowspan="1">西藏</th>
								<td><a href="#">秦皇岛</a></td>
								<td><a href="#">布达拉宫</a></td>
								<td><a href="#">阿里</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="2">北京</th>
								<td><a href="#">天安门</a></td>
								<td><a href="#">故宫</a></td>
								<td><a href="#">北海公园</a></td>
							</tr>
							<tr>
								<td><a href="#">颐和园</a></td>
								<td><a href="#">天坛</a></td>
								<td><a href="#">八达岭长城</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="1">海南</th>
								<td><a href="#">三亚</a></td>
								<td><a href="#">海口</a></td>
								<td><a href="#">大东海</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="2">云南</th>
								<td><a href="#">丽江</a></td>
								<td><a href="#">昆明</a></td>
								<td><a href="#">香格里拉</a></td>
							</tr>
							<tr>
								<td><a href="#">西双版纳</a></td>
								<td><a href="#">大理</a></td>
								<td><a href="#">玉龙雪山</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="1">广西</th>
								<td><a href="#">桂林</a></td>
								<td><a href="#">北海</a></td>
								<td><a href="#">南宁</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="2">湖北</th>
								<td><a href="#">武汉</a></td>
								<td><a href="#">宜昌</a></td>
								<td><a href="#">三峡大坝</a></td>
							</tr>
							<tr>
								<td><a href="#">黄鹤楼</a></td>
								<td><a href="#">武当山</a></td>
								<td><a href="#">神农架</a></td>
							</tr>
						</table>
					</div>
					<div class="tab-pane pop_win bug" id="tabs3">
						<input type="hidden" class="idtabs"/>
						<table class="table">
							<tr>
								<th rowspan="1">港澳</th>
								<td><a href="#">香港迪士尼</a></td>
								<td><a href="#">澳门大三巴牌坊</a></td>
								<td><a href="#">香港海洋公园</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="2">台湾</th>
								<td><a href="#">台湾日月谭</a></td>
								<td><a href="#">台北故宫</a></td>
								<td><a href="#">南投</a></td>
							</tr>
							<tr>
								<td><a href="#">清镜农场</a></td>
								<td><a href="#">宜兰</a></td>
								<td><a href="#">北投温泉</a></td>
							</tr>
						</table>
					</div>
					<div class="tab-pane pop_win bug" id="tabs4">
						<input type="hidden" class="idtabs"/>
						<table class="table">
							<tr>
								<th rowspan="1">日本</th>
								<td><a href="#">东京迪士尼</a></td>
								<td><a href="#">箱根温泉</a></td>
								<td><a href="#">富士山</a></td>
								<td><a href="#">浅草寺</a></td>
							</tr>
							<tr>
								<th rowspan="1">韩国</th>
								<td><a href="#">首尔塔</a></td>
								<td><a href="#">景福宫</a></td>
								<td><a href="#">青瓦台</a></td>
								<td><a href="#">明洞</a></td>
								<td><a href="#">南怡岛</a></td>
							</tr>
						</table>
					</div>
					<div class="tab-pane pop_win bug" id="tabs5">
						<input type="hidden" class="idtabs"/>
						<table class="table">
							<tr>
								<th rowspan="1">东南亚</th>
								<td><a href="#">海神庙</a></td>
								<td><a href="#">白沙滩</a></td>
								<td><a href="#">克拉码头</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="1">泰国</th>
								<td><a href="#">芭东海滩</a></td>
								<td><a href="#">皇帝岛</a></td>
								<td><a href="#">四面佛</a></td>
								<td><a href="#">幻多奇乐园</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="1">南亚</th>
								<td><a href="#">狮子岩</a></td>
								<td><a href="#">佛牙寺</a></td>
							</tr>
						</table>
					</div>
					<div class="tab-pane pop_win bug" id="tabs6">
						<input type="hidden" class="idtabs"/>
						<table class="table">
							<tr>
								<th rowspan="4">热门目的地</th>
								<td><a href="#">西班牙</a></td>
								<td><a href="#">法国</a></td>
								<td><a href="#">英国</a></td>
								<td><a href="#">意大利</a></td>
							</tr>
							<tr>
								<td><a href="#">希腊</a></td>
								<td><a href="#">俄罗斯</a></td>
								<td><a href="#">德国</a></td>
								<td><a href="#">瑞士</a></td>
							</tr>
							<tr>
								<td><a href="#">米兰</a></td>
								<td><a href="#">捷克</a></td>
								<td><a href="#">奥地利</a></td>
								<td><a href="#">东欧</a></td>
							</tr>
							<tr>
								<td><a href="#">北欧</a></td>
								<td><a href="#">罗马</a></td>
								<td><a href="#">巴黎</a></td>
								<td><a href="#">其他</a></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<th rowspan="2">热门景点</th>
								<td><a href="#">埃菲尔铁塔</a></td>
								<td><a href="#">卢浮宫</a></td>
								<td><a href="#">圣彼得大教堂</a></td>
							</tr>
							<tr>
								<td><a href="#">斗兽场</a></td>
								<td><a href="#">凡尔赛宫</a></td>
								<td><a href="#">瑞士少女峰</a></td>
							</tr>
						</table>
					</div>
					<div class="tab-pane pop_win" id="tabs7" style="display: none;">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--部分展示-->
	<div class="container demo_show">
		<div class="row">
			<div class="col-md-2 left_recomnd">
				<span class="recomnd_head">驴友分享</span>
				<div class="thumbnail most_hot">
					<div class="caption">
						<span>最热分享</span>
					</div>
					<a href="imgShare.jsp"><img src="${mySharesbynum[0].shareimg }" /></a>
				</div>
				<div class="thumbnail">
					<div class="caption">
						<span>最新分享</span>
					</div>
					<a href="imgShare.jsp"><img src="${myShares[0].shareimg }" /></a>
				</div>
			</div>
			<div class="col-md-10">
				<ul class="nav nav-tabs menu_tab">
					<li class="active"><a href="#t_tab1" data-toggle="tab">精选</a></li>
					<li><a href="#t_tab2" data-toggle="tab">港澳</a></li>
					<li><a href="#t_tab3" data-toggle="tab">台湾</a></li>
					<li><a href="#t_tab4" data-toggle="tab">日本</a></li>
					<li><a href="#t_tab5" data-toggle="tab">韩国</a></li>
					<li><a href="#t_tab6" data-toggle="tab">泰国</a></li>
					<li><a href="#t_tab7" data-toggle="tab">马尔代夫</a></li>
					<li><a href="#t_tab8" data-toggle="tab">美国</a></li>
					<li><a href="#t_tab9" data-toggle="tab">东南亚</a></li>
					<li><a href="#t_tab10" data-toggle="tab">美洲</a></li>
					<li><a href="#t_tab11" data-toggle="tab">欧洲</a></li>
					<li><a href="#t_tab12" data-toggle="tab" class="most_travel">顶级游</a></li>
				</ul>
				<div class="tab-content img_show">
					<div class="tab-pane active" id="t_tab1">
						<div class="row">
							<div class="col-md-6 big_demo">
								<div class="thumbnail">
									<a
										href="buyInfo.jsp?price=${signPots[0].price }&spotname=${signPots[0].spotname }">
										<img class="imgshows"
										src="GetImgServlet.do?imgpath=${signPots[0].spotimg }"
										style="width: 450px; height: 260px;" />
									</a> <span class="img_title">${signPots[0].spotname }<span
										class="first_star glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span></span> <span
										class="travle_price">￥${signPots[0].price }起</span>
								</div>
							</div>
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-6">
										<div class="thumbnail">
											<a
												href="buyInfo.jsp?price=${signPots[1].price }&spotname=${signPots[1].spotname }">
												<img class="imgshows"
												src="GetImgServlet.do?imgpath=${signPots[1].spotimg }" />
											</a> <span class="img_title">${signPots[1].spotname } <span
												class="first_star glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span>
											</span> <span class="travle_price">￥${signPots[1].price }起</span>
										</div>
									</div>
									<div class="col-md-6">
										<div class="thumbnail">
											<a
												href="buyInfo.jsp?price=${signPots[2].price }&spotname=${signPots[2].spotname }">
												<img class="imgshows"
												src="GetImgServlet.do?imgpath=${signPots[2].spotimg }" />
											</a> <span class="img_title">${signPots[2].spotname } <span
												class="first_star glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span>
											</span> <span class="travle_price">￥${signPots[2].price }起</span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="thumbnail">
											<a
												href="buyInfo.jsp?price=${signPots[3].price }&spotname=${signPots[3].spotname }">
												<img class="imgshows"
												src="GetImgServlet.do?imgpath=${signPots[3].spotimg }" />
											</a> <span class="img_title">${signPots[3].spotname } <span
												class="first_star glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span>
											</span> <span class="travle_price">￥1${signPots[3].price }起</span>
										</div>
									</div>
									<div class="col-md-6">
										<div class="thumbnail">
											<a
												href="buyInfo.jsp?price=${signPots[4].price }&spotname=${signPots[4].spotname }">
												<img class="imgshows"
												src="GetImgServlet.do?imgpath=${signPots[4].spotimg }" />
											</a> <span class="img_title">${signPots[4].spotname } <span
												class="first_star glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span>
											</span> <span class="travle_price">￥${signPots[4].price }起</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<div class="thumbnail">
									<a
										href="buyInfo.jsp?price=${signPots[5].price }&spotname=${signPots[5].spotname }">
										<img class="imgshows"
										src="GetImgServlet.do?imgpath=${signPots[5].spotimg }" />
									</a> <span class="img_title">${signPots[5].spotname } <span
										class="first_star glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span>
									</span> <span class="travle_price">￥${signPots[5].price }起</span>
								</div>
							</div>
							<div class="col-md-3">
								<div class="thumbnail">
									<a
										href="buyInfo.jsp?price=${signPots[6].price }&spotname=${signPots[6].spotname }">
										<img class="imgshows"
										src="GetImgServlet.do?imgpath=${signPots[6].spotimg }" />
									</a> <span class="img_title">${signPots[6].spotname } <span
										class="first_star glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span>
									</span> <span class="travle_price">￥${signPots[6].price }起</span>
								</div>
							</div>
							<div class="col-md-3">
								<div class="thumbnail">
									<a
										href="buyInfo.jsp?price=${signPots[7].price }&spotname=${signPots[7].spotname }">
										<img class="imgshows"
										src="GetImgServlet.do?imgpath=${signPots[7].spotimg }" />
									</a> <span class="img_title">${signPots[7].spotname } <span
										class="first_star glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span>
									</span> <span class="travle_price">￥${signPots[7].price }起</span>
								</div>
							</div>
							<div class="col-md-3">
								<div class="thumbnail">
									<a
										href="buyInfo.jsp?price=${signPots[8].price }&spotname=${signPots[8].spotname }">
										<img class="imgshows"
										src="GetImgServlet.do?imgpath=${signPots[8].spotimg }" />
									</a> <span class="img_title">${signPots[8].spotname } <span
										class="first_star glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span><span
										class="glyphicon glyphicon-star"></span>
									</span> <span class="travle_price">￥${signPots[8].price }起</span>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="t_tab2">2</div>
					<div class="tab-pane" id="t_tab3">3</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 尾页 -->
	<iframe src="footer.jsp"  class="footer_frame" ></iframe>



	<div class="back_top">
		<a href="#"> <img src="img/backTop.jpg" class="backTop" /> 
			<img src="img/home.png" class="home" />
		</a>
	</div>
    
    <div class="floatdiv" id="exitdiv">
           <div  id="messagediv">
              <h4>亲，要走了吗？继续浏览，可能有惊喜呢！</h4>
              <a href="Exit.do"><button class="btn btn-info" >继续退出</button></a>
              <button class="btn btn-info" onclick="cancle()">继续浏览</button>
           </div>
           <div id="imgdiv"> 
               <img src="img/exit.png" style="width:100px;height:100px"/>
           </div> 
    </div>
</body>
</html>
    


