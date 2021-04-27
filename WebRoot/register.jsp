<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>课程教学网站</title>
	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="<%=Const.ROOT %>assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="<%=Const.ROOT %>assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="<%=Const.ROOT %>assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="<%=Const.ROOT %>assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="<%=Const.ROOT %>assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="<%=Const.ROOT %>assets/js/Lightweight-Chart/cssCharts.css"> 
</head>
<body>
    <div id="wrapper">
          <%@include file="/top.jsp"%>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" style="margin-top: -20px">
		  <div class="header"> 
                        <h1 class="page-header">
                            	注册 <small>课程教学网站.</small>
                        </h1>
						
									
		</div>
		
		
		<div id="page-inner"> 
			 <div class="row">
			 <div class="col-lg-12">
			 <div class="card">
                        <div class="card-action">
                            	<c:if test="${item!=null}">您的个人信息</c:if>
                            	<c:if test="${item==null}">请填写表单</c:if>
                        </div>
                       
                        <div class="card-content">
                         <c:if test="${item==null}">
    <form class="col s12" action="<%=Const.ROOT%>user/addUser" method="post" enctype="multipart/form-data">
     					
                         			
								  <div class="row">
									<div class="input-field col s6">
									  <i class="material-icons prefix">account_circle</i>
									  <label for="icon_prefix">用户名</label>
									  <input id="username" name="username"  required="" type="text" class="validate">
									  
									</div>
									<div class="input-field col s6">
									  <i class="material-icons prefix">phone</i>
									  <input id="phone" name="phone" type="number"  required="" class="validate">
									  <label for="icon_telephone">phone</label>
									</div>
								  </div>
								
								 
								  <div class="row">
									<div class="input-field col s6">
									
									  <input id="realname" name="realname" type="text"  required="" class="validate">
									  <label for="icon_prefix">真实姓名</label>
									</div>
									<div class="input-field col s6">
									 
									  <input id="password" name="password" type="text"  required="" class="validate">
									  <label for="icon_telephone">密码</label>
									</div>
								  </div>
								   <div class="row">
									<div class="input-field col s12">
									  <input id="email" name="email" type="email"  class="validate">
									  <label for="email" data-error="wrong" data-success="right">Email</label>
									</div>
								  </div>
								   <div class="row">
									<div class="input-field col s12">
									  <input id="address" name="address" type="text"  required="" class="validate">
									  <label for="address" data-error="wrong"  data-success="right">地址</label>
									</div>
								  </div>
								    <div class="row">
									<div class="input-field col s12">
									  <input type="file" name="file" style="margin-left: 50px;margin-top: 15px"  required="" class="validate">
									  <label for="file" data-error="wrong" data-success="right">头像</label>
									</div>
								  </div>
								 
								  <div class="row">
									<div class="input-field col s2">
									
						 				<select class="form-control"  id="role" name="role">
						 				 <option value="3">--学生--</option>
						 				<option value="2">--教师--</option>
									  
									</select>
							
									</div>
								  </div>
								  
								  
								  
									
								  
								  <div class="modal-footer">
									   
									   <button type="submit" class="btn btn-primary">保存</button>
									   
								   </div>
    </form>
    
    </c:if>
    
     <c:if test="${item!=null}">
    <form class="col s12" action="<%=Const.ROOT%>user/updateMe" method="post" enctype="multipart/form-data">
     					<input type="hidden" id="id" name="id" value="${item.id }">
                         			 <input id="role" name="role" type="hidden"  value="2" >
								  <div class="row">
									<div class="input-field col s6">
									  <i class="material-icons prefix">account_circle</i>
									  <input id="username" name="username" value="${item.username }" required="" type="text" class="validate">
									  <label for="icon_prefix">用户名</label>
									</div>
									<div class="input-field col s6">
									  <i class="material-icons prefix">phone</i>
									  <input id="phone" name="phone" type="number" value="${item.phone }" required="" class="validate">
									  <label for="icon_telephone">phone</label>
									</div>
								  </div>
								
								 
								  <div class="row">
									<div class="input-field col s6">
									
									  <input id="realname" name="realname" type="text" value="${item.realname }" required="" class="validate">
									  <label for="icon_prefix">真实姓名</label>
									</div>
									<div class="input-field col s6">
									 
									  <input id="password" name="password" type="text" value="${item.password }" required="" class="validate">
									  <label for="icon_telephone">密码</label>
									</div>
								  </div>
								   <div class="row">
									<div class="input-field col s12">
									  <input id="email" name="email" type="email" value="${item.email }" class="validate">
									  <label for="email" data-error="wrong" data-success="right">Email</label>
									</div>
								  </div>
								   <div class="row">
									<div class="input-field col s12">
									  <input id="address" name="address" type="text" value="${item.address }" required="" class="validate">
									  <label for="address" data-error="wrong"  data-success="right">地址</label>
									</div>
								  </div>
								    <div class="row">
									<div class="input-field col s12">
									  <input type="file" name="file" style="margin-left: 50px;margin-top: 15px"  class="validate">
									  <label for="file" data-error="wrong" data-success="right">头像</label>
									</div>
								  </div>
								  
									
								  
								  <div class="modal-footer">
									   
									   <button type="submit" class="btn btn-primary">保存</button>
									   
								   </div>
    </form>
    </c:if>
	<div class="clearBoth"></div>
  </div>
    
	
    </div>
 </div>	
	 </div>		
              
              
		
		
           
           
          
   </div>
        </div>
		
		
		
			
        
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="<%=Const.ROOT %>assets/js/jquery-1.10.2.js"></script>
	
	<!-- Bootstrap Js -->
    <script src="<%=Const.ROOT %>assets/js/bootstrap.min.js"></script>
	
	<script src="<%=Const.ROOT %>assets/materialize/js/materialize.min.js"></script>
	
    <!-- Metis Menu Js -->
		<script src="<%=Const.ROOT %>assets/js/jquery.metisMenu.js"></script> 
    <!-- Custom Js -->
    <script src="<%=Const.ROOT %>assets/js/custom-scripts.js"></script> 
	
 

</body>
<script type="text/javascript">
function toadduser(){
	$("#addmodal").show();
}
</script>
</html>
