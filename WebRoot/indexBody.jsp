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
								<img alt="" src="img/1.jpg" />
								<div class="carousel-caption">
									<h4>
										棒球
									</h4>
									<p>
										棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="img/2.jpg" />
								<div class="carousel-caption">
									<h4>
										冲浪
									</h4>
									<p>
										冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="img/3.jpg" />
								<div class="carousel-caption">
									<h4>
										自行车
									</h4>
									<p>
										以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
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