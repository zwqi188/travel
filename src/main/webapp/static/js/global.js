$(function(){
	$('#addBtn').click(function(){
		$.messager.confirm('提示','确定要添加吗?',function(r){
			if (r) {
				$.messager.alert('提示','添加成功');
				$('#addForm').submit();
			}
		});
	});
	$('#editBtn').click(function(){
		$.messager.confirm('提示','确定要修改吗?',function(r){
			if (r) {
				$.messager.alert('提示','修改成功3333');
				$('#editForm').submit();
			}
		});
	});
});	
function delObj(objName){
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
				window.location.href = "Delete.do?optId="+array+"&opt="+objName;
			}
		});
	}
}