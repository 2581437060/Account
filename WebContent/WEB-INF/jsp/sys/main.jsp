<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%    
             if(session.getAttribute("account") == null) {      
   %>    
          <script type="text/javascript" language="javascript">        
            alert("您还没有登录，请登录...");   
           top.location.href="../login.jsp";  
           </script>   
   <%    
       }    
   %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="domain" value="${pageContext.request.contextPath}"></c:set>
<link rel="apple-touch-icon" sizes="76x76" href="${domain}/assets1/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="${domain}/assets1/img/favicon.png">
<link rel="stylesheet" href="${domain }/assets1/css/bootstrap.min.css">
	<link rel="stylesheet" href="${domain }/assets1/css/ready.css">
	<link rel="stylesheet" href="${domain }/assets1/css/demo.css">
	<script src="http://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息总览</title>
</head>
<body >
	<div class="wrapper">
		<div class="main-header">
			<div class="logo-header">
				<a href="index.html" class="logo">
					健身管理系统
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more"><i class="la la-ellipsis-v"></i></button>
			</div>
			<nav class="navbar navbar-header navbar-expand-lg">
				<div class="container-fluid">
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						<li class="nav-item dropdown">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false"> <img src="${domain }/assets1/img/profile.jpg" alt="user-img" width="36" class="img-circle"><span >李坤</span></span> </a>
							<ul class="dropdown-menu dropdown-user">
								<li>
									<div class="user-box">
										<div class="u-img"><img src="${domain }/assets1/img/profile.jpg" alt="user"></div>
										<div class="u-text">
											<h4>李坤</h4>
											<p class="text-muted">2581437060@qq.com</p><a href="#" class="btn btn-rounded btn-danger btn-sm">修改密码</a></div>
										</div>
									</li>
								</ul>
								<!-- /.dropdown-user -->
							</li>
						</ul>
					</div>
				</nav>
			</div>
			<div class="sidebar">
				<div class="scrollbar-inner sidebar-wrapper">
					
					<ul class="nav">
						<li class="nav-item active">
							<a href="ForwardAdmin">
								<i class="la la-dashboard"></i>
								<p>信息总览</p>
								<span class="badge badge-danger">6</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="userTable">
								<i class="la la-users"></i>
								<p>会员管理</p>
								<span class="badge badge-danger">6</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="teachTable">
								<i class="la la-bell"></i>
								<p>教练管理</p>
								<span class="badge badge-danger">6</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="courseTable">
								<i class="la la-font"></i>
								<p>课程管理</p>
								<span class="badge badge-danger">6</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="apparatusTable">
								<i class="la la-balance-scale"></i>
								<p>器材管理</p>
								<span class="badge badge-danger">6</span>
							</a>
						</li>
						<li class="nav-item update-pro">
						<a href="exit">
							<button  data-toggle="modal" >
								<i class="la la-hand-pointer-o"></i>
								<p>退出</p>
							</button>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">信息总览</h4>
						<div class="row">
							<div class="col-md-3">
								<div class="card card-stats card-warning">
									<div class="card-body ">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-users"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">会员人数</p>
													<h4 class="card-title">  ${countUser[0].countUser}人</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats card-success">
									<div class="card-body ">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-users"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">教练人数</p>
													<h4 class="card-title"> ${countTeach[0].countTeach}人</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats card-danger">
									<div class="card-body">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-newspaper-o"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">器材</p>
													<h4 class="card-title">${countApparatus[0].countApparatus}个</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="card card-stats card-primary">
									<div class="card-body ">
										<div class="row">
											<div class="col-5">
												<div class="icon-big text-center">
													<i class="la la-check-circle"></i>
												</div>
											</div>
											<div class="col-7 d-flex align-items-center">
												<div class="numbers">
													<p class="card-category">上次登录</p>
													<h4 class="card-title"> ${lastLoginTime}</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">会员男女比例</h4>
										<p class="card-category">
										Ratio of men to women</p>
									</div>
									 
								<div class="panel-body" id="sex" style="height: 300px;"></div>
                           
                           			
										<!-- <div id="container" ></div> -->

								</div>
							</div>
							
						</div>
					</div>
				</div>
				<footer class="footer">
					<div class="container-fluid">
						<nav class="pull-left">
							<ul class="nav">
								<li class="nav-item">
									<a class="nav-link" href="#">
										ThemeKita
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">
										Help
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#license/#free-item">
										Licenses
									</a>
								</li>
							</ul>
						</nav>
						<div class="copyright ml-auto">
							Copyrigh 李坤 2019.Company name All rights reserved.<a target="_blank" href="http://www.baidu.com">有事百度</a></div>				
					</div>
				</footer>
			</div>
		</div>
	</div>
	<!-- Modal -->
	
</body>
<script src="${domain }/assets1/js/core/jquery.3.2.1.min.js"></script>
<script src="${domain }/assets1/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>

<script src="${domain }/assets1/js/core/bootstrap.min.js"></script>

<script src="${domain }/assets1/js/ready.min.js"></script>
<script src="${domain }/assets1/js/demo.js"></script>

	<script src="${domain}/assets1/js/echarts.js"></script>
<script type="text/javascript">
   // Build the chart
  //性别统计
		var myChart = echarts.init(document.getElementById('sex')); //渲染组件  
		myChart.showLoading({ //加载动画  
			text : '正在加载数据。。。。'
		});
		var names2 = []; //类别数组（实际用来盛放X轴坐标值）  
		var nums2 = []; //销量数组（实际用来盛放Y坐标值）  
		//加载数据  
		jQuery.ajax({
			url : "getSex",
			type : 'get',
			datatype : 'json',
			async : true,
			success : function(jsons) {
				if (jsons) {
					myChart.hideLoading(); //隐藏动画  
					$.each(jsons, function(i, value) {
						//alert(jsons[index].price);  
						names2[i] = value['sex'];
						nums2[i] = value['num'];
						var option = {
							
							tooltip : {
								trigger : 'item',
								formatter : "{a} <br/>{b} : {c} ({d}%)"
							},
							series : [ {
								name : '性别比例',
								type : 'pie',
								radius : '55%',
								center : [ '50%', '60%' ],
								data : [ {
									name : '男',
									value : nums2[1]
								}, {
									name : '女',
									value : nums2[0]
								} ],
								itemStyle : {
									emphasis : {
										shadowBlur : 10,
										shadowOffsetX : 0,
										shadowColor : 'rgba(0, 0, 0, 0.5)'
									}
								}
							} ]
						};
						myChart.setOption(option); //绑定数据  
					});
				}
			},
			error : function() {
				alert("数据加载失败！请检查数据链接是否正确");
			}
		});
		// 初次加载图表(无数据)  
		myChart.setOption(option);
    </script>

</html>