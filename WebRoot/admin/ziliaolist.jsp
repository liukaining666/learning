<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>欢迎使用在线学习系统</title>
	
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
         <div class="row">
         	<div class="col-md-4">
         
			  <div class="header"> 
                        <h1 class="page-header">
                            	学习 &amp; 资料
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">首页</a></li>
					  <li><a href="#">学习资料 </a></li>
					  
					</ol> 
									
		</div>
		</div>
		
		<div class="col-md-8">
			 <form action="<%=Const.ROOT%>void/getziliaolist" method="post"  class="form-inline">
			 	<input type="hidden" id="role" name="role" value="3">
			 <div class="rows"> 
        				<div class="col-md-push-1 col-md-11">
                          		<div id="dataTables-example_filter" class="dataTables_filter" style="padding-top:30px;">
                          		   <label>
                          		   <input type="text" name="teachername" value="${teachername }" class="form-control input-sm" placeholder="请输入老师名" aria-controls="dataTables-example">
                          		   <input type="text" name="voidname" value="${voidname }" class="form-control input-sm" placeholder="请输入资料名" aria-controls="dataTables-example">
                          		   <select class="form-control"  id="kindid" name="kindid">
						 				 <option value="-1">--请选择资料类型--</option>
						 				<c:forEach items="${kindlist}" var="item" varStatus="count">
						 					<option value="${item.id }">${item.kindname }</option>
						 				</c:forEach>
									  
									</select>
                          		   
                          		   <button class="btn" type="submit">查询</button>
                          		   </label>
                          		   </div>
                           </div>
			  </div>			
                           
                     </form>  
			</div>
		
		</div>
		
            <div id="page-inner"> 
                                 
            <div class="row">
            	<c:forEach items="${pageInfo.list}" var="item" varStatus="count">
            		<div class="col-md-4 col-sm-4">
                    <div class="card blue-grey darken-1">
						<div class="card-content white-text">
						  <span class="card-title">${item.voidname }</span>
						  <p style="">${item.voidcontent }</p>
						   <p>发布时间：${item.time }</p>
						</div>
						<div class="card-action">
						  <a href="#">${item.teachername }</a>
						  <a href="#">${item.kindname }</a>
						   <a onclick="tolook('${item.id}')">查看</a>
						</div>
					  </div>
                	</div>
            	</c:forEach>
                
            </div>
            <!--分页-->
                                <form action="<%=Const.ROOT%>void/getziliaolist" method="post" id="Page">
                                	<input type="hidden" id="role" name="role" value="3">
                                 <div class="col-sm-6">
                               <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate" >
                               	 <ul class="pagination">
                               	 	<li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"> <a href="javascript:doPage('${pageInfo.prePage}')" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a></li>
      
                               	 	<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"> <a href="javascript:doPage('${pageInfo.nextPage}')" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a></li>
                               	 </ul>
                               	 ${pageInfo.pageNum }/${pageInfo.pages }
                               	 </div>
                               	 </div>
                               	 
                               	 <div class="col-sm-6">
                               	 <div id="dataTables-example_filter" class="dataTables_filter">
                               	 	<label >跳转到<input type="number" id="pageNum" name="pageNum" class="form-control input-sm" aria-controls="dataTables-example"><button class="btn" type="submit"> GO!</button></label>
                               	 	
                               	 </div>
                               	 </div>
                             
                               	 
                               	 </form>
         
			 <!-- /. PAGE INNER  -->
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
	

	function tolook(id){
		 location.href="${pageContext.request.contextPath }/void/lookziliao/"+id;
	}

	
</script>
</html>
