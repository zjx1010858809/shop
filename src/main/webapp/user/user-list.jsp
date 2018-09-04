<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
<link rel="stylesheet" href="../lib/font-awesome-4.7.0/css/font-awesome.min.css">
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="../lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  {"orderable":false,"aTargets":[6]}// 制定列不参与排序
		]
	});
});


$("#waitWork").click(function(){
	
});
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要封号吗？',function(index){
		var url = "update_off?id="+id;
		$.ajax({
			type : "post",
			async : false,  //同步请求
			url : url,
			timeout:1000,
			success:function(dates){
			$('#mainContent'+dates[0].id).html(dates[0].status_name);
			$('#mainContent'+dates[0].id).css("background-color","#999999");
			$('#off'+dates[0].id).css("display","none");
			$('#on'+dates[0].id).css("display","inline-block");
			layer.msg('已封号!',{icon:1,time:1000});
			},
			error: function() {
	           // alert("失败，请稍后再试！");
	        }
		});
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要解封吗？',function(index){
		var url = "update_on?id="+id;
		$.ajax({
			type : "post",
			async : false,  //同步请求
			url : url,
			timeout:1000,
			success:function(dates){
			$('#mainContent'+dates[0].id).html(dates[0].status_name);
			$('#mainContent'+dates[0].id).css("background-color","#5EB95E");
			$('#on'+dates[0].id).css("display","none");
			$('#off'+dates[0].id).css("display","inline-block");
			layer.msg('已解封!',{icon:1,time:1000});
			},
			error: function() {
	           // alert("失败，请稍后再试！");
	        }
		});
	});
}
//密码重置
function admin_urepass(id){
	if(confirm("确认重置密码？")){
		$.ajax({
			url:'urepass',
			type:"post",
			data:{id:id},
			success:function(res){
				if(res.status==1){
					alert(res.text);
				}else{
					alert(res.text);
				}
			}
		});
	}
}

</script>
<title>用户列表</title>
</head>

<body style="top:-40px;">
<div class="page-container" >
	
	<div class="cl pd-5 bg-1 bk-gray mt-20">
	<a class="btn btn-success radius r" id="a" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	</div>
	<table class="table table-border table-bordered table-bg table-hover table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="9">用户列表</th>
			</tr>
			<tr class="text-c">
				<th width="100">用户名</th>
				<th width="100">手机号</th>
				<th width="60">等级</th>
				<th width="150">累计金额</th>
				<th width="150">备注</th>
				<th width="70">当前状态</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${requestScope.list}" var="r">
				<tr class="text-c">
				<td>${r.email}</td>
				<td>${r.tel}</td>
				<td>${r.level}</td>
				<td>${r.amount}</td>
				<td>${r.comments}</td>
				<c:if test="${r.status==0}">
				<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}">${r.status_name}</span></td>
				<td class="td-manage"><a style="text-decoration:none;" id="off${r.id}"  onClick="admin_stop(this,${r.id})" href="javascript:;" title="封号"><i class="Hui-iconfont">&#xe631;</i></a>
				                      <a id="on${r.id}" onClick="admin_start(this,${r.id})" href="javascript:;" title="解封" style="text-decoration:none;display: none;"><i class="Hui-iconfont">&#xe615;</i></a>
				                      <a onClick="admin_urepass(${r.id})" href="javascript:;" title="密码重置" style="text-decoration:none;margin-left: 10px;"><i class="fa fa-repeat" aria-hidden="true"></i></a>
				                      
				                      </td>
				</c:if>
				<c:if test="${r.status==1}">
				<td class="td-status"><span class="label label-success radius" id="mainContent${r.id}" style="background-color: #999999">${r.status_name}</span></td>
				<td class="td-manage"><a style="text-decoration:none;display: none;" id="off${r.id}"  onClick="admin_stop(this,${r.id})" href="javascript:;" title="封号"><i class="Hui-iconfont">&#xe631;</i></a>
				                      <a id="on${r.id}" onClick="admin_start(this,${r.id})" href="javascript:;" title="解封" style="text-decoration:none;"><i class="Hui-iconfont">&#xe615;</i></a>
				                      <a onClick="admin_urepass(${r.id})" href="javascript:;" title="密码重置" style="text-decoration:none;margin-left: 10px;"><i class="fa fa-repeat" aria-hidden="true"></i></a>
				                      </td>
				</c:if>
				
				</tr>
				 </c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>