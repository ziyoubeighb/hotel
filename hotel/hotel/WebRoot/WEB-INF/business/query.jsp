<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="/public/head.jspf"%>
  	<style type="text/css">
  		.searchbox {
		  margin:-3;
		}
  	</style>
  	<script type="text/javascript">
  		$(function(){
  			$('#dg').datagrid({ 
  			//
  			loadMsg:'请等待..........',
  			//请求url的地址   
		    url:'business_queryJoinRoomAndRoomcategoryAndClientAndUser.action',
		 	//在请求远程数据的时候发送额外的参数
		 	queryParams:{bname:''},
		 	//显示斑马线
		 	striped:true,
		 	//如果为true，则只允许选择一行，全选会功能失效
		 	//singleSelect:true,
		 	//如果为true，则在同一行中显示数据。设置为true可以提高加载性能。默认true
		 	nowrap:true,
		 	toolbar: [{
					text:'业务名称：',
			},'-',{
					text:"<input id='ss' name='search'/>",
			}],
			pageSize:15,
			pageList:[5,10,15,20],
			//在底部显示分页工具箱
			pagination:true,
			//自动适应列,如果设置，则不会显示水平滚动条，在显示冻结列时此参数不要设置
			fitColumns:true,
		    //同列属性，但是这些列将会被冻结在左侧。
		    frozenColumns:[[
		    	//xyz任意取的  但不能为空
		    	{field:'xyz',checkbox:true},
		    	{field:'bid',title:'编号',width:100},
		    ]],
		    //配置dg得到列字段field:列字段的名称，与json的key捆绑title:列标题   
		    columns:[[
		    	{field:'bname',title:'业务名称',width:100},
		    	 {field:'btime',title:'业务时间',width:150}, 
		     	{field:'room.rname',title:'客房号码',width:100,
		        	formatter: function(value,row,index){
		        		if(row.room!=null && row.room.rname!=null){
		        			return row.room.rname;
		        		}
					}
		        },  
		     	{field:'roomcategory.rcname',title:'客房种类',width:100,
		        	formatter: function(value,row,index){
		        		if(row.roomcategory!=null && row.roomcategory.rcname!=null){
		        			return row.roomcategory.rcname;
		        		}
					}
		        },  
		        {field:'client.cname',title:'顾客',width:100,
		        //用来格式化当前列的值，返回的是最终的数据
			        formatter: function(value,row,index){
						if(row.client!=null && row.client.cname!=null){
		        			return row.client.cname;
		        		}
					}
		        },   
		        {field:'bdate',title:'入住日期',width:100,
		        	//格式化时间
		        	formatter: function (value, row, index) {
                                var date = new Date(value);
                                var year = date.getFullYear().toString();
                                var month = (date.getMonth() + 1);
                                var day = date.getDate().toString();
                                var hour = date.getHours().toString();
                                var minutes = date.getMinutes().toString();
                                var seconds = date.getSeconds().toString();
                                if (month < 10) {
                                    month = "0" + month;
                                }
                                if (day < 10) {
                                    day = "0" + day;
                                }
                                if (hour < 10) {
                                    hour = "0" + hour;
                                }
                                if (minutes < 10) {
                                    minutes = "0" + minutes;
                                }
                                if (seconds < 10) {
                                    seconds = "0" + seconds;
                                }
                                return year + "-" + month + "-" + day;  	
		        	}
		        }, 
		        {field:'bnumber',title:'天数',width:100}, 
		        {field:'bcash',title:'押金',width:100}, 
		        {field:'bfee',title:'总金额',width:100},
		        {field:'bremark',title:'备注',width:100,
		        //用来格式化当前列的值，返回的是最终的数据
			        formatter: function(value,row,index){
						return "<span title="+value+">"+value+"</span>";
					}
		        }, 
		        {field:'user.ulogin',title:'处理人',width:100,
		        	formatter: function(value,row,index){
		        		if(row.user!=null && row.user.ulogin!=null){
		        			return row.user.ulogin;
		        		}
					}
		        }    
		    ]]    
		});
		
		//把普通的文本框转换为搜索文本框
			$('#ss').searchbox({
				//触发查询时间
				searcher:function(value,bname){
				//获取当前查询的关键字，通过dg加载相应的信息 
				//alert(value + "," + name); 
				$('#dg').datagrid('load',{
					bname: value,
				});
				}, 
				prompt:'变形金刚' 
			});  
  			
  		});
  	</script>
  </head>
  
  <body>
  	<table id="dg"></table>  
  </body>
</html>
