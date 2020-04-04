<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<c:set var="domain" value="${pageContext.request.contextPath}"></c:set>
	<link rel="apple-touch-icon" sizes="76x76" href="${domain}/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="${domain}/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title></title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="${domain}/assets1/css/bootstrap.min.css" rel="stylesheet" />



    <!--  Paper Dashboard core CSS    -->
    <link href="${domain}/assets1/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${domain}/assets1/css/demo.css" rel="stylesheet" />


</head>
<body>

<div class="wrapper">
	

    <div class="main-panel">
		
        

        <div class="content"><div style="padding-left: 20px;padding-right: 20px">
             <form>
                                    <div class="row">
                                        
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>姓名</label><input type="hidden"value="${upCourseList[0]}" id="id">
                                                <input type="text" class="form-control border-input" placeholder="Your Name" value="${upCourseList[1]}" id="cname">
                                            </div>
                                        </div>
                                       
                                    </div>
                     

                                   
                                    <div class="text-center">
                                        <button type="button" class="btn btn-info btn-fill btn-wd" onclick="update()">修改</button>
                                    </div>
                                    <div class="clearfix"></div>
                                </form></div>
            </div>
        </div>



    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="${domain}/assets1/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="${domain}/assets1/js/core/bootstrap.min.js" type="text/javascript"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="${domain}/assets1/js/demo.js"></script>
	<script src="${domain}/assets1/js/layer.js"></script>
	<script type="text/javascript">
	function update(){
			var id = document.getElementById("id").value;
			var cname = document.getElementById("cname").value;
		
			if(cname==""){
				layer.msg('请把信息填写完整!',{icon: 2,time:2000});   
				return false;
			}
		
			$.post("upCourseInfo",{
				id : id,
				'cname' : cname,
				
			},function(result){
				if(result == "true"){
					layer.msg('修改成功!',{icon: 1,time:2000});
				}
			})
	}
	</script>
</html>
