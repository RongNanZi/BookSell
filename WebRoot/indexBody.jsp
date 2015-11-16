<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	
	<link href="css/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
    <div class="row-fluid">
		<div class="span12">
			<div class="carousel slide" id="carousel-356775">
			
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-356775">
					</li>
					<li data-slide-to="1" data-target="#carousel-356775">
					</li>
					<li data-slide-to="2" data-target="#carousel-356775">
					</li>
				</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img alt="" src="img/notice.jpg" />
								<div class="carousel-caption">
									<h4>
										最新降价！！狂欢双十一！！！！
									</h4>
									<p>
										史上最疯狂的打折出售。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="img/shiji.jpg" />
								<div class="carousel-caption">
									<h4>
										史记
									</h4>
									<p>
										“诗家之绝唱，无韵之离骚”是对《史记》的文学价值及其史学地位的最中肯的评价
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="img/xiyouji.jpg" />
								<div class="carousel-caption">
									<h4>
										西游记
									</h4>
									<p>
										敢于挑战权威的叛逆者，当年明朝的“禁书”
									</p>
								</div>
							</div>
						</div> 
						<a data-slide="prev" href="#carousel-356775" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-356775" class="right carousel-control">›</a>
					
				
			</div>
		</div>
	</div>
  </body>
</html>
