<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String userName = (String)session.getAttribute("userName");
String proname = (String)request.getAttribute("bookname");

List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("results");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>你要找的书：</title>
    <meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	
	<link href="css/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript">
		var xmlHttp;
		function fun(a) {
		xmlHttp = new XMLHttpRequest();
		var url="servlet/Shopcart";
		
		xmlHttp.open("POST", url, true);
		xmlHttp.onreadystatechange=parseResult;
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.send("username="+"<%=userName%>"+"&bookid="+a);
		}
		function parseResult(){
		  if (xmlHttp.readyState==4 && xmlHttp.status==200)
		    {
			  if(xmlHttp.responseText == "true") 
			  alert("已经成功加入购物车"+xmlHttp.responseText);
			  else 
				  alert("购物车已经有了这本书！");
		    }
		  }
		function fun2(){
			alert("你已经成功买入!");
		}
	
	</script>
  </head>
  
  <body>
	  <div>
	  <iframe name="head" src="<%=path %>/head.jsp" frameborder="0" scrolling="no" height="40"width="100%">			</iframe>
	  </div>
	   
	   <br>
   <div> 
   		<% for(Map<String,Object> map:list){  %>
   		<div class="row-fluid" width="80%">
   			<div class="span3">
   			    <img alt="图片加载失败" src="img/<%=map.get("image")%>">
   			</div>
   			<div class="span6">
	   			<strong><%= map.get("name") %></strong>
	   			<h5> <%= map.get("author") %>    价钱：<%=map.get("price") %>元</h5>
	   			<small>  <%= map.get("detail") %></small>
   			</div>
   			<div class="span3">
   				<button type="button" class="btn btn-success" onClick="fun2()">购买</button>
   				<br>
   				<br>
   				<button type="button" class="btn btn-warning" onClick="fun(<%= map.get("id")%>)">加入购物车</button>
   			
   			</div>
   			
   		</div>
   		<%
   		 } 
   		 %>
   </div>
  </body>
</html>
