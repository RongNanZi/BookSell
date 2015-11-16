<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String userName = (String)session.getAttribute("userName");
List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("List");
float sum=0;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title></title>
		
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	
	<link href="css/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" >
	
	function funpay(){
		
		alert("你已经买了购物车的东西！！");
		parent.location.href = "servlet/DleallAction";
	}
	
	
	</script>
  </head>
  	<div>
  	<iframe name="head" src="<%=path %>/head.jsp" frameborder="0" scrolling="no" height="40"width="100%">			</iframe>
	</div>
		<div  class="container" width="61%">
			<br>
				<button type="button" class="btn btn-success"> <%= userName%>的购物车：</button>
			<br>
			<% for(Map<String,Object> map:list){  %>
			<div class="row-fluid">
	   			<div class="span3">
	   			    <img alt="图片加载失败" src="img/<%=map.get("image")%>">
	   			</div>
	   			<div class="span6">
		   			<strong><%= map.get("name") %></strong>
		   			<h5> <%= map.get("author") %>    价钱：<%=map.get("price") %>元</h5>
		   			<small>  <%=map.get("detail") %></small>
	   			</div>
	   			<div class="span3">
	   			
	   			<a href="servlet/DelCartAction?bookid=<%= map.get("id")%>" ><button  class="btn btn-warning"> 删除</button></a>
	   			</div>
	   		</div>
	   		<%	
	   		
	   		float one = (float)map.get("price"); 
	   		sum+= one;
	   		} %>
			<br>
			<br>
			<div class="center">
			<strong>总价：</strong>&nbsp;&nbsp;<%=sum %>&nbsp;&nbsp;&nbsp;&nbsp;<button  onclick= funpay() class="btn btn-danger">结算</button>
			</div>
			
		</div>
  <body>
    
  </body>
</html>
