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
			  <div class="header"> 
                         <h1 class="page-header">
                            	${kind.kindname } &amp; 试卷
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">首页</a></li>
					  <li><a href="#">我的</a></li>
					  <li><a href="#">试卷 </a></li>
					  
					</ol> 
									
		</div>
		
                                           
            <div class="row">
              <form action="<%=Const.ROOT%>timu/tijiao" onsubmit="return check()" id="kform">
              	
              	<div class="col-lg-12">
              	<input type="hidden" name="daans" id="daans"/>
              		<input type="hidden" name="kindid" id="kindid" value="${kind.id }"/>
             <c:forEach items="${tlist}" var="item" varStatus="count">
              		
               		
 		
                    <div class="card">
                        <div class="card-action" style="padding-bottom:10px;">
                           ${count.count }.${item.title }
                        </div>
                        <div class="card-content" style="padding-top:10px;">
							
					    <p>
					      <input name="group${count.index}" type="radio" value="A" style="position:static;opacity:1"> A.${item.opa }
					    </p>
					   <p>
					      <input name="group${count.index}" type="radio" value="B" style="position:static;opacity:1"> B.${item.opb }
					    </p>
					    <p>
					      <input name="group${count.index}" type="radio" value="C" style="position:static;opacity:1"> C.${item.opc }
					    </p>
					    <p>
					      <input name="group${count.index}" type="radio" value="D" style="position:static;opacity:1" >D.${item.opd }
					    </p>
					    <p>
					      正确答案：${item.answer }
					    </p>
  						 <p>
					      我的答案${item.daan }
					    </p>
         </div>
                               
                            </div>
                            <!-- /.row (nested) -->
                        
              
               </c:forEach>
               
               </div>
               
               </form>
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
function tolook(id){
	 location.href="${pageContext.request.contextPath }/news/lookNews/"+id;
}
function check(){
	var daans="";
	if($("#kform input[type='radio']:checked").length!=${count}){
		alert("有题目未作答");
		return false;
	}
	$("#kform input[type='radio']:checked").each(function(index,op){
		daans+=op.value+",";
	});
	$("#daans").val(daans.substring(0,daans.length-1));
	
	return true;
}
</script>
</html>
