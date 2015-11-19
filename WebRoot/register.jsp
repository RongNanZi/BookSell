<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%


String path = request.getContextPath();
%>

<html>
<head>
<head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
 <script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>

<script>
	function register(){
			
			
			var path = document.href;
			
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
				
//			var f = document.forms[0];
//			f.action = "userinfo.action?name="+uname+"&pass="+upass;
//			f.submit();
							
			//$("#registerForm").action="/servlet/RegisterAction";
			$("#registerForm").submit();
				
	}
		
</script>

<link href="css/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
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
			
			<form class="form-horizontal" method="post" id="registerForm" action="servlet/RegisterAction">
				<div class="control-group">
					<label class="control-label" for="inputText" >账号：</label>
					<div class="controls">
						<input id="userName"  type="text" name="userName">

					</div>
				</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword" >密码：</label>
				<div class="controls">
					<input id="userPassword" placeholder="Password" type="password" name="userPassword">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="reinputPassword" >重复密码：</label>
				<div class="controls">
					<input id="reuserPassword" placeholder="Password" type="password" name="reuserPassword">
				</div>
			</div>
			
			<div class="control-group">
				<div class="controls">
					
					<button  class="btn" onclick = "register()">注册</button>
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