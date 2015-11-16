<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%


String path = request.getContextPath();
%>



<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		
	<script type="text/javascript" src="<%=path %>/js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-ui.js"></script>

	<link href="css/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div>
		<iframe name="head" src="head.jsp" frameborder="0" scrolling="no" height="100"width="100%">			</iframe>
		</div>
		
		<br >
		<div>
		<iframe	name="body" src="indexBody.jsp" frameborder="0"	width="100%" height="600">		</iframe>
		</div>
		<br >
		<div>
		<iframe name="foot" src="foot.jsp" frameborder="0" width="100%">		</iframe>
		</div>
		
	</body>
</html>
 