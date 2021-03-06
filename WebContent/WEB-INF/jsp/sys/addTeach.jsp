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
                                                <label>姓名</label>
                                                <input type="text" class="form-control border-input" placeholder="Your Name"  id="name">
                                            </div>
                                        </div>
                                    </div>
									
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>所授课程</label>
                                                <select type="text" class="form-control border-input" placeholder="Your ClassName"  id="cid">
                                                	<c:forEach var="list" items="${classInfo}" >
                                                		<option value="${list.id}" >${list.cname}</option>
                                                		
                                                	</c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>联系电话</label>
                                                <input type="text" class="form-control border-input" placeholder="Your Phone"  id="tel">
                                            </div>
                                        </div>
                                    </div>

                                  
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>详细地址</label>
                                                <input type="text" class="form-control border-input" placeholder="Home Address"  id="address">
                                            </div>
                                        </div>
                                    </div>

                                   
                                    <div class="text-center">
                                        <button type="button" class="btn btn-info btn-fill btn-wd" onclick="update()">增加教练</button>
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
			var tel = document.getElementById("tel").value;
			var cid = document.getElementById("cid").value;
			var address = document.getElementById("address").value;
			if(name==""||tel==""||address==""){
				layer.msg('请把信息填写完整!',{icon: 2,time:2000});   
				return false;
			}
			
			var regTel = new RegExp("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$");
			    if(!regTel.test(tel)){
					   layer.msg('请输入正确的手机格式!',{icon: 2,time:2000});   
					return false;
			    }
			
			$.post("addTeachInfo",{
				'tname' : name,
				'ttel' : tel,
				 cid : cid,
				'taddress' : address,
			},function(result){
				if(result == "true"){
					layer.msg('添加成功!',{icon: 1,time:2000});
				}
			})
	}
	</script>
</html>
