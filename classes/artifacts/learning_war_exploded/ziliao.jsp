<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>课堂交互</title>
	
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
                            ${item.voidname } &amp; ${item.voidcontent }
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">${item.teachername }</a></li>
					  <li><a href="#">${item.kindname } </a></li>
					  <li class="active">发布于&amp;${item.time }</li>
					</ol> 
									
		</div>
		
            <div id="page-inner"> 
                                 
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="card blue-grey darken-1">
						<div class="card-content white-text">
						  <span class="card-title">${item.voidname }</span>
						  <p>${item.voidcontent }</p>
						   <p>发布时间：${item.time }</p>
						</div>
						<div class="card-action">
						  <a href="#">${item.teachername }</a>
						  <a href="#">${item.kindname }</a>
						  <a href="${pageContext.request.contextPath }/void/down?id=${item.id}">下载查看</a>
						   
						</div>
					  </div>
                </div>
               
               
            </div>
         
         
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
	function shoucang(nid){
		location.href="<%=Const.ROOT %>void/addRecordFir/"+nid;
	}

	function toadduser(nid){
		$("#addmodal #nid").val(nid);
		$("#addmodal").show();
	}

	function hufu(nid){
		$("#hufumodal #nid").val(nid);
		$("#hufumodal").show();
	}

	function toaddRecordthr(nid){
		$("#addRecordmodal #nid").val(nid);
		$("#addRecordmodal").show();
	}
</script>
</html>
