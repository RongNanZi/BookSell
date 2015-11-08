<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String userName= (String)session.getAttribute("userName");

List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("List");
%>

<!doctype html>
<html >
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>用户留言</title>
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	
 
<script  type="text/javascript">
		
	var xmlHttp;
	function fun() {
		var string = $("#comment").val();
		$("#comment").val("");
		
	xmlHttp = new XMLHttpRequest();
	var url="servlet/CommentAction";
	
	var now=new Date();
	
	xmlHttp.open("POST", url, true);
	xmlHttp.onreadystatechange=parseResult;
	xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlHttp.send("user="+"<%=userName%>"+"&comment="+string+"&time="+(now.toLocaleString()));
	}
	function parseResult(){
	  if (xmlHttp.readyState==4 && xmlHttp.status==200)
	    {
		  if(xmlHttp.responseText == "true") 
		  		location.reload();
		  else 
		  		alert("一天只能留言一次！");
	    }
	  }
</script>


<link href="./css/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />
</head>
	
	<body>
	
	   <iframe name="head" src="<%=path%>/head.jsp" frameborder="0" scrolling="no" height="200"width="100%">			</iframe>
		
		<div class="container">
			<div  class="center" width="80%">
		  	  <br>
		      <br>
		      <button type="button" class="btn btn-warning  btn-large" >留言板</button>
		         <br>
		         <br>
		      <textarea id="comment"style="width:100%" rows="10">写下你对本店的建议与意见：</textarea>
		         <br>
		      <div style=" black solid;text-align:right">
		      <button type="button" class="btn btn-success btn-large"  onClick="fun()">提交</button>
		      </div>
		      <br>
		      <br>
		      <table  width="100%" >
		              <tr>
		                <th class="alert-danger badge-info btn-large">用户</th>
		                <th class="alert-danger badge-info btn-large">留言</th>
		                <th class="alert-danger badge-info btn-large">时间</th>
		   	   		  </tr>
		              <tr>
		                  <td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;233</td>
		                  <td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;网站不错</td>
		                  <td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2015年10月20日00:32:40</td>
		              </tr>
		              <% for(Map<String,Object> map:list){  %>
		              <tr>
		                  <td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= map.get("user") %></td>
		                  <td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= map.get("comment") %></td>
		                  <td><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= map.get("time") %></td>
		              </tr>
					 <% } %>
		          
		        </table>
			</div>
		</div>
	
	</body>
</html>

