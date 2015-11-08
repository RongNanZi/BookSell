<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="cn-zh">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>

<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>

<link href="css/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />

 </head>
 <body>
 	<iframe name="head" src="<%=path%>/head.jsp" frameborder="0" scrolling="no" height="200"width="100%">			</iframe>
 
 
	<iframe name="body" src="<%=path%>/indexBody.jsp" frameborder="0" scrolling="no" width="100%"height="800">			</iframe>
	
	<iframe name="foot" src="foot.jsp" frameborder="0" width="100%">		</iframe>
						
		

</body>
</html>
