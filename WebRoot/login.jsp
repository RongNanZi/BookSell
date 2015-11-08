<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%


String path = request.getContextPath();
%>

<html>
<head>
<head>
  <meta charset="UTF-8">
  
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>

<script type="text/javascript" >
	
	function login()	{
		if($("#inputUserName").val().length<3){
			alert("用户名至少得三位！！");
			$("#inputUserName").focus();
			return ;
		}
			
		else if($("#inputPassword").val().length<6){
			alert("设置的密码不足六位！");
			$("#inputPassword").focus();
			return ;
		}
		
		$("loginForm").submit();
	}




</script>

<link href="css/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
	
		<iframe name="head" src="<%=path%>/head.jsp" frameborder="0" scrolling="no" height="200"width="100%">			</iframe>
<div class="container-fluid">
	
	<br>
	<br>
	<br>
	<div class="row-fluid">
		<div class="span4">
		</div>
		<div class="span4" margin = "center">
			<form class="form-horizontal" name = "loginForm" action = "servlet/LoginAction" method = "get">
				<div class="control-group">
					<label class="control-label" for="inputEmail" >Email</label>
					<div class="controls">
						<input id="inputUserName"  type="text" name = "userName">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputPassword" contenteditable="false">密码</label>
					<div class="controls">
						<input id="inputPassword" placeholder="Password" type="password" name = "password">
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<label class="checkbox" contenteditable="true">
						<input type="checkbox">记住我 </label>
						<button  class="btn" onclick = "login()">登陆</button>
					</div>
				</div>
			</form>

		</div>
		<div class="span4">
		</div>
	</div>
</div>
</body>
</html>

