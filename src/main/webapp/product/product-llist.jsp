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
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<link rel="stylesheet" href="../lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body style="top:-40px;">

<div class="page-container">
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-hover table-sort" style="table-layout: fixed;">
				<thead>
					<tr class="text-c">
						<th width="100">商品名称</th>
						<th width="50">类型</th>
						<th width="60">活动信息</th>
						<th width="100">提示信息</th>
						
						<th width="80">现价</th>
						<th width="80">原价</th>
						<th width="60">发布状态</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${requestScope.list}" var="r">
					<tr class="text-c va-m" style="height: 60px;">
						<td>${r.fullname}</td>
						<td>${r.tname}</td>
						<td>${r.activity}</td>
						<td style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" title="${r.tip}">${r.tip}</td>
						<td>${r.nowprice}</td>
						<td>${r.price}</td>
						
						<c:if test="${r.status==0}">
						   <td class="td-status" ><span class="label label-success radius" id="mainContent${r.id}">${r.status_name}</span></td>
						   <td class="td-manage">
						        <a style="text-decoration:none" id="off${r.id}"  onClick="product_stop(this,${r.id})" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> 
						        <a style="text-decoration:none; display: none;" id="on${r.id}" onClick="product_start(this,${r.id})" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a> 
						        <a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','product-edit?id=${r.id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
						        <a style="text-decoration:none" class="ml-5" onClick="product_del(this,${r.id})" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
						         <a style="text-decoration:none" class="ml-5" onClick="product_see('商品详情','seeproduct?id=${r.id}')" href="javascript:;" title="商品详情"><i class="Hui-iconfont">&#xe725;</i></a>
						   </td>
						</c:if>
						<c:if test="${r.status==1}">
						   <td class="td-status"><span class="label label-success radius" style="background-color: #999999" id="mainContent${r.id}">${r.status_name}</span></td>
						   <td class="td-manage">
						       <a style="text-decoration:none" id="on${r.id}" onClick="product_start(this,${r.id})" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a> 
						       <a style="text-decoration:none; display: none;" id="off${r.id}" onClick="product_stop(this,${r.id})" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>
						       <a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','product-edit?id=${r.id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
						       <a style="text-decoration:none" class="ml-5" onClick="product_del(this,${r.id})" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
						       <a style="text-decoration:none" class="ml-5" onClick="product_see('商品详情','seeproduct?id=${r.id}')" href="javascript:;" title="查看"><i class="Hui-iconfont">&#xe725;</i></a>
						   </td>
						</c:if>
						<!--  
						<td class="td-manage"><a style="text-decoration:none" onClick="product_stop(this,'10001')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','product-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                          -->					
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="../lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="../lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[7]}// 制定列不参与排序
	]
});
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-查看*/
function product_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-审核*/
function product_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过'], 
		shade: false
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*产品-下架*/
function product_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
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
		layer.msg('已下架!',{icon:1,time:1000});
		},
		error: function() {
           // alert("失败，请稍后再试！");
        }
	});
});
}

/*产品-发布*/
function product_start(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		var url = "update_on?id="+id;
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : url,
		timeout:1000,
		success:function(dates){
		$('#mainContent'+dates[0].id).html(dates[0].status_name);
		$('#mainContent'+dates[0].id).css("background-color","#5EB95E");
		$('#off'+dates[0].id).css("display","inline-block");
		$('#on'+dates[0].id).css("display","none");
		layer.msg('已下架!',{icon:1,time:1000});
		},
		error: function() {
           // alert("失败，请稍后再试！");
        }
	});
	});
}

/*产品-删除*/
function product_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		var url = "product-del?id="+id;
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : url,
		timeout:1000,
		success:function(dates){
			//$(obj).parents("tr").remove();
			window.location.reload();
		  layer.msg('删除成功!',{icon:1,time:1000});
		},
		error: function() {
           // alert("失败，请稍后再试！");
        }
	});
	});
}

/*产品-申请上线*/
function product_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

/*产品-编辑*/
function product_edit(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*产品-删除*/

function product_see(title,url) {
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

</script>
</body>
</html>