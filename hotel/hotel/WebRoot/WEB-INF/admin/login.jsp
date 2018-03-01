<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="/public/head.jspf" %>
  	<style type="text/css">
  		#win{
  			background:url(images/login.jpg)
  		}
  		#ulogin{
  		    margin-left:20;
  			margin-top: 90;
  			margin-bottom: 5
  		}
  		#upass{
  			margin-left:25;
  			margin-bottom: 5
  		}
  		a{
  			margin-left:30
  		}
  	</style>
  	<script type="text/javascript">
  		var session_nowuser = '${nowuser}';
		if (session_nowuser) {//如果登录,直接跳转到index页面
			window.location.href='send_main_aindex.action';
		}
  		$(function(){
  			//登录窗口
  			$('#win').window({
  				title:'用户登录',    
			    width:550,    
			    height:230,  
			    modal:true,
			    collapsible:false,
			    minimizable:false,
			    maximizable:false,
			    closable:false,
			    draggable:false,
			    resizable:false
			});
			//验证
			$("input[name=ulogin]").validatebox({
  				required:true,
  				missingMessage:'请输入用户名'
  			});
			$("input[name=upassword]").validatebox({
  				required:true,
  				missingMessage:'请输入密码'
  			});
  			//窗体弹出默认时禁用验证
  			$("#ff").form("disableValidation");
			//注册button事件
			$("#btn2").click(function(){
				$("#ff").form("clear");
			});
  			$("#btn1").click(function(){
  				//开启验证
  				$("#ff").form("enableValidation");
  				//获取表单中的用户名的密码
  				var user=$("#user").val();
  				var pass=$("#pass").val();
  				if($("#ff").form("validate")){
  				 	//发送ajax请求
					$.post("user_validateUser.action",{user:user,pass:pass},function(result){
						if(result=="true"){
						var userulogin='${nowuser.ulogin}';
							//调转页面
							window.location.href='send_main_aindex.action';
						}else{
							$.messager.show({
								title:'登录异常',
								msg:'用户名或密码错误！',
								timeout:2000,
								showType:'slide'
							});
						}
					},"text");	
  				}
  			});
  		});
  	</script>
  </head>
  
  <body>
  	<div id="win">
	  	<form id="ff" method="post">
	  		<div id="ulogin">
	  			<label for="ulogin">用户名：</label>
	  			<input id="user" type="text" name="ulogin" />
	  		</div>
	  		<div id="upass">
	  			<label for="upassword">密&nbsp;码：</label>
	  			<input id="pass" type="password" name="upassword" />
	  		</div>
	  		<div>
	  			<a id="btn1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">登录</a>
	  			<a id="btn2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cut'">重置</a>
	  		</div>
	  	</form>
  	</div>
   </body>
</html>
