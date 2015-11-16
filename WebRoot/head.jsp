
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String logOut;
String path = request.getContextPath();
String userName = (String)session.getAttribute("userName");
if(userName == null)	{
	userName = "登陆";
	logOut = "注册";
	}
else
logOut = "注销";

%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	
	<script type="text/javascript" >	

	function fun1()	{
		
		if($("#login").val() =="登陆")	{
			
			parent.location.href = "login.jsp";
		}
	}
	function fun2()	{
		
		if($("#register").val() =="注册")	{
			parent.location.href = "register.jsp";
		}
		
		
	}
	function fun3() {
		
		parent.location.href = "servlet/Shopcart?userid="+"<%=userName%>";
		
	}
	function find(){
		parent.location.href = "servlet/FindBook?bookname="+$("#key").val();
		
	}
	
	</script>
	
	<link href="css/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="navbar">
				<div class="navbar-inner">
					<div class="container-fluid">
					<a class="btn btn-navbar" data-target=".navbar-responsive-collapse" data-toggle="collapse"> </a> 
					<a class="brand" href="#">茸南购书网</a></li>
						<div class="nav-collapse collapse navbar-responsive-collapse">
							<ul class="nav">
								<li> <a  href="javascript:parent.location.href='main.jsp';"><class="active">HOME</a></li>
								<li class="dropdown"><a class="dropdown-toggle"		data-toggle="dropdown" href="#">商品分类 </a>
									<ul class="dropdown-menu">					
										<form>
											
											<a class="label label-success -lg">文学</a>
											<a class="label label-info">历史</a>
											<a class="label label-warning">小说</a>
											<a class="label label-success">IT</a>
											<a class="label label-warning">旅游</a>
											<a class="label label-info">杂志</a>
										</form>
									
										
									</ul>
								</li>
								<li>
									
									<form name= "searchform"class="navbar-form navbar-left" role="search" target="parent" action = "servlet/FindBook" method = "get">
										<div class="form-group" >
											<input id= "key"type="text" name="bookname"class="form-control " placeholder="Search">
											<button type="button" class="btn btn-default" onClick="find()">搜索</button>
										</div>
									</form>   
									
								</li>
							</ul>
							<ul class="nav pull-right">				
								<li><input  class="btn"  id = "shopcart"  onClick = "fun3()"	 type ="button"   value="购物车"><li>			
								<li><input  class="btn"  id = "login"  onClick = "fun1()"	 type ="button"   value= <%=userName%>><li>
								<li><input  class="btn"  id = "register" type ="button" onClick= "fun2()"  value= <%=logOut%>><li>
								
							</ul>
						</div>
					</div>
						
				</div>

			</div>
		</div>
	</div>	
	
	</body>
</html>
