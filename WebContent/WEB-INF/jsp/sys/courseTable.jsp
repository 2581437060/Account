
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
<link rel="stylesheet" href="${domain }/assets1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="${domain }/assets1/css/ready.css">
	<link rel="stylesheet" href="${domain }/assets1/css/demo.css">
	<script src="http://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程管理</title>
</head>
<body>
	<div class="wrapper">
		<div class="main-header">
			<div class="logo-header">
				<a href="ForwardAdmin" class="logo">
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
											<p class="text-muted">2581437060@qq.com</p><a href="profile.html" class="btn btn-rounded btn-danger btn-sm">修改密码</a></div>
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
						<li class="nav-item">
							<a href="ForwardAdmin">
								<i class="la la-dashboard"></i>
								<p>信息总览</p>
								<span class="badge badge-danger">6</span>
							</a>
						</li>
						
	
						<li class="nav-item ">
							<a href="userTable">
								<i class="la la-th"></i>
								<p>会员管理</p>
								<span class="badge badge-danger">6</span>
							</a>
						</li>
						<li class="nav-item ">
							<a href="teachTable">
								<i class="la la-bell"></i>
								<p>教练管理</p>
								<span class="badge badge-danger">6</span>
							</a>
						</li>
						<li class="nav-item active">
							<a href="courseTable">
								<i class="la la-balance-scale"></i>
								<p>课程管理</p>
								<span class="badge badge-danger">6</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="apparatusTable">
								<i class="la la-font"></i>
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
						<h4 class="page-title">课程管理</h4>
						<div class="row">
							<div class="col-12" >
								<div class="card " >
									<div class="card-header">
										<div class="card-title">请选择你要进行的操作</div>
									</div>
									<div class="card-body">
										<div class="card-sub">					
											
                                							
											<button class="btn btn-info btn-fill " onclick="add()">增加</button>
										</div>
										<table class="table mt-3 ">
										 <thead>
                                        
                                    	<th>课程编号</th>
                                    	<th>课程名</th>
                                    	<th>操作</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${findcourse}">
                                        <tr>
                                        	<td>${list.id}</td>
                                        	<td>${list.cname}</td>
                                        	
                                        	<td>
                                        	<button class="btn btn-primary btn-fill " onclick="update(${list.id},'${list.cname}')">编辑</button>
                                        	<button class="btn btn-danger btn-fill " onclick="del(${list.id})">删除</button>
                                        	</td> 
                                        </tr>
                                    </c:forEach>
                                    </tbody>
										</table>
									</div>
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
</div>
<!-- Modal -->

</body>
<script src="${domain }/assets1/js/core/jquery.3.2.1.min.js"></script>

<script src="${domain }/assets1/js/core/bootstrap.min.js"></script>

<script src="${domain }/assets1/js/ready.min.js"></script>
<script src="${domain }/assets1/js/demo.js"></script>
<script src="${domain}/assets1/js/layer.js"></script>
<script type="text/javascript">
function add(){
	parent.layer.open({
    type: 2,
    shadeClose: true,
    shade: 0.8,
    area: ['450px', '35%'],
    content: 'addCourse',
    end: function () {
       location.reload();
    }
});
}
function del(id){
	layer.confirm('确认要删除当前课程吗？',function(index){
			$.ajax({
				type: 'get',
				url: 'delCourse',
				data: {id : id},
				success: function(data){
					layer.msg('删除成功!',{icon: 1,time:2000});
					setTimeout(function(){
						window.location.href='courseTable';
					},2000)
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		});
}

function update(id,cname){
	parent.layer.open({
	    type: 2,
	    shadeClose: true,
	    shade: 0.8,
	    area: ['450px', '35%'],
	    content: 'upCourse?id='+id+'&cname='+cname,
	    end: function () {
	       window.location.href='courseTable';
	    }
	});
}
</script>
</html>