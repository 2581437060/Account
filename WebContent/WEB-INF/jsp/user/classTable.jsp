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
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<c:set var="domain" value="${pageContext.request.contextPath}"></c:set>
	<link rel="apple-touch-icon" sizes="76x76" href="${domain}/assets1/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="${domain}/assets1/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>选课列表</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

<link href="${domain}/assets1/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="${domain}/assets1/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="${domain}/assets1/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${domain}/assets1/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="${domain}/assets1/css/themify-icons.css" rel="stylesheet">

</head>
<body>

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">



    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                	   健身俱乐部管理系统
                </a>
            </div>

            <ul class="nav">
                
                <li class="active">
                    <a href="myInfo">
                        <i class="ti-id-badge "></i>
                        <p>我的信息</p>
                    </a>
                </li>
                <li>
                    <a href="classTable">
                        <i class="ti-book "></i>
                        <p>选课列表</p>
                    </a>
                </li>
                <li>
                    <a href="teachList">
                        <i class="ti-stack-overflow "></i>
                        <p>选择教练</p>
                    </a>
                </li>
                
				<li class="active-pro">
                    <a href="exit">
                        <i class="ti-hand-point-left "></i>
                        <p>退出</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">选课列表</a>
                </div>
                <div class="collapse navbar-collapse">
                  
                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">课程列表</h4><input type="hidden" value="${SelectTeachInfo}" id="SelectTeachInfo">
                                <p class="category">请选择你要学习的课程</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                        <th>编号</th>
                                    	<th>课程名称</th>
                                    	<th>操作</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${classInfo}">
                                        <tr>
                                        	<td>${list.id}</td>
                                        	<td>${list.cname}</td>
                                        	<td><button class="btn btn-primary btn-fill " onclick="select(${list.id})">选择教练</button></td> 
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
				<div class="copyright">
                    Copyright 李坤; 2019.Company name All rights reserved.<a target="_blank" href="javascript:">制作者</a>
                </div>
            </div>
        </footer>


    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="${domain}/assets1/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="${domain}/assets1/js/core/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="${domain}/assets1/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="${domain}/assets1/js/plugin/chartist/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="${domain}/assets1/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <!--  Google Maps Plugin    -->
  

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="${domain}/assets1/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="${domain}/assets1/js/demo.js"></script>
	<script src="${domain}/assets1/js/layer.js"></script>
<script type="text/javascript">
function select(id){
	$.post("selectTeach",{id:id},function(result){
		window.location.href='teachList';
	})
}

</script>
<script type="text/javascript">
function selectTeach(){
	var SelectTeach=document.getElementById("SelectTeachInfo").value;
	if(SelectTeach==""){
		layer.msg('请先选择课程!',{icon: 2,time:2000});
	}
	if(SelectTeach!=""){
		window.location.href='teachList';
	}
}
</script>
</html>
