<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购票</title>
<script type="text/javascript">
	$(
			function() {
				$('#buybtn').click(
						function() {
							$('#number').val(parseInt($('#number').val()) + 1);
							$('#price').val(
									parseInt($('#hprice').val())
											* $('#number').val());
						});
				$('#subbtn').click(
						function() {
							if (parseInt($('#number').val()) <= 1) {
								$('#number').val(1);
								$('#price').val($('#hprice').val());
							} else {
								$('#number').val(
										parseInt($('#number').val()) - 1);
								$('#price').val(
										parseInt($('#hprice').val())
												* $('#number').val());
							}
						});
				$('#back').click(function() {
					window.location.href = "buyInfo.jsp";
				});
			})
</script>
</head>
<body style="background: url('img/bgly.jpg') no-repeat center 0px;">
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-info" style="margin-top: 120px;">
			<div class="panel-heading">
				<h4>购票页面</h4>
			</div>
			<div class="panel-body">
				<form action="JumpPay.do" method="post"
					class="form-horizontal">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">旅游地点</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="spotname"
								id="spotname" value="${spotname }" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">价格</label>
						<div class="col-sm-4">
							<input type="hidden" id="hprice" name="hprice" value="${price }" />
							<input id="price" type="text" class="form-control" name="allPrice"
								value="${price }" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">日期</label>
						<div class="col-sm-4">
							<input type="text" style="height: 30px"
								class="Wdate form-control" name="date"
								onclick="WdatePicker({dateFmt:'yyyy/MM/dd'})" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">数量</label>
						<div class="col-sm-2">
							<input id="number" name="number" type="text" class="form-control"
								value="1">
						</div>
						<div class="col-sm-3">
							<button id="buybtn" type="button" class="btn btn-info">
								<span class="glyphicon glyphicon-plus"></span>
							</button>
							<button id="subbtn" type="button" class="btn btn-info">
								<span class="glyphicon glyphicon-minus"></span>
							</button>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">用户</label>
						<div class="col-sm-4">
							<select name="passengerName" class="form-control">
								<c:forEach var="passanger" items="${passangers }">
									<option ${passanger eq username? selected:'' }>${passanger }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-success">提交</button>
							<button id="back" type="button" class="btn btn-danger">取消</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>