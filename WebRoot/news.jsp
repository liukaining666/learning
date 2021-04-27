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
                            ${item.title }
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">${item.username }</a></li>
					  <li><a href="#">${item.kindname } </a></li>
					  <li class="active">发布于&amp;${item.pubtime }</li>
					</ol> 
									
		</div>
		
            <div id="page-inner"> 
                                 
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="card blue-grey darken-1">
						<div class="card-content white-text">
						  <span class="card-title">${item.title }</span>
						  <p>${item.content }</p>
						   <p>发布时间：${item.pubtime }</p>
						</div>
						<div class="card-action">
						  <a href="#">${item.username }</a>
						  <a href="#">${item.kindname }</a>
						 
						</div>
					  </div>
                </div>
               
               
            </div>
            
            
           <div class="row">

			  <div class="col-md-12">
	               <div class="card">
			<div class="card-content">
					<c:forEach items="${pinglunlist}" var="item" varStatus="count">
						<div class="alert alert-success">
							<strong>${item.username }---${item.time}</strong><br/>_评论：${item.content }
							<c:if test="${sessionScope.userSession!=null}">
							<c:if test="${sessionScope.role==-1}">
								<a >被禁言</a>
							</c:if>
							<c:if test="${sessionScope.role==2}">
							<a data-toggle="modal" data-target="#hufuModal" onclick="hufu(${item.id })">回复</a>
							</c:if>
							</c:if>
							<br/>
						
						<c:forEach items="${item.hSet}" var="item2" varStatus="count">
							<strong style="margin-left: 20px">${item2.username }---${item.time}</strong>_回复:${item2.content }<br/>
						</c:forEach>
						</div>
					</c:forEach>
	   							
								
	</div>
	<div class="card-action">
	<c:if test="${sessionScope.userSession!=null}">
		<c:if test="${sessionScope.role==-1}">
		
	  <b><a style="margin-left: 30px" class="waves-effect waves-light btn"  >
                            	<i class="material-icons left">cloud</i>
                            	被禁言</a></b> 
    	</c:if>
    	<c:if test="${sessionScope.role!=null}">
		<b><a style="margin-left: 30px" class="waves-effect waves-light btn" data-toggle="modal" data-target="#myRecordModal" onclick="toaddRecordthr(${item.id })" >
                            	<i class="material-icons left">cloud</i>
                            	发表评论</a></b> 
	</c:if>
    	
    </c:if>
    <c:if test="${sessionScope.userSession==null}">
    	<b>登录后可以发表评论</b> 
     </c:if>
	</div>
  </div>
			</div>	

              

<div class="modal fade" id="hufuModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">回复</h4>
            </div>
            <!-- 新增 -->
           <div class="row" id="hufumodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>news/addhufu" method="post" enctype="multipart/form-data">
                         		
                         		<input type="hidden" id="nid" name="nid">
								  <div class="row">
									<div class="input-field col s12">
									
									  <textarea id="textarea1" name="content" id="content" class="materialize-textarea"></textarea>
									  <label for="icon_prefix">回复内容</label>
									</div>
									
								  </div>
								   
								  <div class="modal-footer">
									   
									   <button type="submit" class="btn btn-primary">保存</button>
									   
								   </div>
								  
								
							</form>
							 
 
   <!-- 模态框结尾 -->
  <div class="switch">
    <label>
    </label>
  </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</div>
</div>



     <div class="modal fade" id="myRecordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">发表评论</h4>
            </div>
            <!-- 新增 -->
          <div class="row" id="addRecordmodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>news/addRecordthr" method="post" enctype="multipart/form-data">
                         		<input type="hidden" id="role" name="role" value="6">
                         		<input type="hidden" id="nid" name="nid">
								  <div class="row">
									<div class="input-field col s12">
									
									  <textarea id="textarea1" name="content" id="content" class="materialize-textarea"></textarea>
									  <label for="icon_prefix">评论内容</label>
									</div>
									
								  </div>
								   
								  <div class="modal-footer">
									   
									   <button type="submit" class="btn btn-primary">保存</button>
									   
								   </div>
								  
								
							</form>
							 
 
   <!-- 模态框结尾 -->
  <div class="switch">
    <label>
    </label>
  </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
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
