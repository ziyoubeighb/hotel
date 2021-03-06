<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="/public/head.jspf" %>
  	<style type="text/css">
  		form div{
  			margin:25;
  			margin-left:10;
  		}
  	</style>
  	<script type="text/javascript">
  		$(function(){
  			//自定义验证
  			$.extend($.fn.validatebox.defaults.rules, {    
			    idcard: {// 验证身份证  
	               validator: function (value) {  
	                   return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);  
	               },  
	               message: '身份证号码格式不正确'  
	            }, 
	            mobile: {// 验证手机号码  
	               validator: function (value) {  
	                   return /^(13|15|18)\d{9}$/i.test(value);  
	               },  
	               message: '手机号码格式不正确'  
	            },  
	            phone: {// 验证电话号码  
	               validator: function (value) {  
	                   return /^((\d2,3)|(\d{3}\-))?(0\d2,3|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);  
	               },  
	               message: '格式不正确,请使用下面格式:020-88888888'  
	            }, 
			});
  			$("input[name=cname]").validatebox({
  				required:true,
  				missingMessage:'请输入顾客姓名'
  			});
  			$("input[name=cidcard]").validatebox({
  				required:true,
  				missingMessage:'请输入身份证号'
  			});
  			$("input[name=cphone]").validatebox({
  				required:true,
  				missingMessage:'请输入联系电话'
  			});
  			//窗体弹出默认时禁用验证
  			$("#ff").form("disableValidation");
  			//注册button事件
  			$("#btn").click(function(){
  				//开启验证
  				$("#ff").form("enableValidation");
  				if($("#ff").form("validate")){
  					//提交数据
  					$('#ff').form('submit', {
						url:'client_save.action',
						success: function(){
							//关闭当前窗体
							parent.$("#win").window("close");
							//刷新页面 获取aindex--->iframe--->dg    dom--->jquery---easyui
							//不兼容  parent.$("iframe[title='类别管理']").contents().find("#dg").datagrid("getSelections");
							parent.$("iframe[title='客户信息管理']").get(0).contentWindow.$("#dg").datagrid("reload");
						}
					});
  					
  				}
  			});
  		});
  	</script>
  </head>
  
  <body>
  	<form id="ff" method="post">   
	    <div>   
	        <label for="cname">顾客姓名:</label>   
	        <input type="text" name="cname"/>   
	    </div>   
	    <div>   
	        <label for="cidcard">身份证号:</label>   
	        <input type="text" name="cidcard" class="easyui-validatebox" validType="idcard"/>   
	    </div>     
	    <div>   
	        <label for="cphone">联系电话:</label>   
	        <input type="text" name="cphone" class="easyui-validatebox" validType="mobile"/>   
	    </div>    
	    <div>
	    	<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	    </div>    
	</form>  
  </body>
</html>
