$(function(){
	$('#validateImg').click(function(){
		$(this).prop('src',"ValidateCodeServlet.do?random=" + new Date().getTime());
	});
	$('#login').click(function(){
		$.ajax({
			url:"ValidateCodeServlet.do",
			type:"post",
			data:{"inCode":$('#inCode').val()},
			datatype:"text",
			success:function(data){
				if(data=="验证码正确"){
					loginForm.action="LoginServlet.do";
					loginForm.submit();
				}else {
					alert(data);
				}
			}
		});
	});
})
