<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<c:set var="domain" value="${pageContext.request.contextPath}"></c:set>
	
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
                                                <label>器材名称</label>
                                                <input type="text" class="form-control border-input" placeholder="Name"  id="name">
                                            </div>
                                        </div>
                                    </div>
									
                                    
                                   
                                    <div class="text-center">
                                        <button type="button" class="btn btn-info btn-fill btn-wd" onclick="update()">增加器材</button>
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

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="${domain}/assets1/js/bootstrap-checkbox-radio.js"></script>



	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="${domain}/assets1/js/demo.js"></script>
	<script src="${domain}/assets1/js/layer.js"></script>
	<script type="text/javascript">
	function update(){
			var name = document.getElementById("name").value;
			if(name==""){
				layer.msg('请把信息填写完整!',{icon: 2,time:2000});   
				return false;
			}
			$.post("addAppInfo",{
				'aname' : name,
			},function(result){
				if(result == "true"){
					layer.msg('添加成功!',{icon: 1,time:2000});
				}
			})
	}
	</script>
</html>
