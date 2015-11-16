<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%

String path = request.getContextPath();
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
	function fun()	{
		
		parent.location.href = "servlet/CommentAction";
		
	}
	
	</script>
	
	<link href="css/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />
	
	
	</head>
	<body>
		<div class="row-fluid">
			<div class="span4">
				<div class="row-fluid">
					<div class="span4">
					</div>
					<div class="span4" >
						  <button type="button" class="btn btn-info" onClick = "fun()">我要留言</button>
					</div>
					<div class="span4">
					</div>
				</div>
			</div>
			<div class="span4">
				<div class="row-fluid">
					<div class="span4">
					</div>
					<div class="span4">
						 <address> <strong>史群东的书店, Inc.</strong><br /> 青岛胶州市委党校<br /> 山东<br /> <abbr title="Phone">P:</abbr> 18291474039</address>
					</div>
					<div class="span4">
					</div>
				</div>
			</div>
			<div class="span4">
				<div class="row-fluid">
					<div class="span4">
					</div>
					<div class="span4">
						 <address> 广告位招租</address>
					</div>
					<div class="span4">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
