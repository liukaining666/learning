<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
	
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
    
    <link href="<%=Const.ROOT %>css/ft-carousel.css" rel="stylesheet" type="text/css" />
</head>
<style>
.example {width: 624px;height: 336px;font-size: 40px;text-align: center;margin: 20px auto;background-color: #464576;}
.carousel-item{line-height: 336px;color: #fff;font-family:  Arial Black}
</style>
<body>
    <div id="wrapper">
          <%@include file="/top.jsp"%>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" style="margin-top: -20px">
		  <div class="header"> 
                        <h1 class="page-header">
                            ${sessionScope.userSession.username } <small>欢迎.</small>
                        </h1>
                        <c:if test="${sessionScope.userSession.username != null}">
                        	<div style="margin-left: 50px" class="row">
							公告：
							<h3 style="text-align: center;">${gonggao.title }</h3>
							<p>${gonggao.content }</p>
							<p>发布时间：${gonggao.pubtime }</p>
						</div>
                        </c:if>
						
									
		</div>
		<div class="main">
      <div class="example">
	      	<div class="ft-carousel" id="carousel_1">
				<ul class="carousel-inner">
					<li class="carousel-item"><img src="<%=Const.ROOT %>img/01.jpg"/></li>
					<li class="carousel-item"><img src="<%=Const.ROOT %>img/02.jpg" /></li>
					<li class="carousel-item"><img src="<%=Const.ROOT %>img/03.jpg" /></li>
					<li class="carousel-item"><img src="<%=Const.ROOT %>img/04.jpg" /></li>
				</ul>
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
<script src="<%=Const.ROOT %>js/jquery.min.js"></script>
<script src="<%=Const.ROOT %>js/ft-carousel.min.js"></script>
<script type="text/javascript">
function toadduser(){
	$("#addmodal").show();
}
$("#carousel_1").FtCarousel();
</script>
</html>
