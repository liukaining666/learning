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
                <div class="col-md-6 col-sm-6">
                    <div class="card">
						<div class="card-image waves-effect waves-block waves-light">
						 
						  <video src="${pageContext.request.contextPath }${item.viodpath}" class="col-md-12" controls="controls"/>
						 
						</div>
						<div class="card-content">
						  <span class="card-title activator grey-text text-darken-4"> ${item.voidname }<i class="material-icons right">more_vert</i></span>
						  <c:if test="${sessionScope.userSession!=null}">
						  	<c:if test="${record==null}">
						  	  <p><a href="javascript:shoucang('${item.id}')">点击收藏</a></p>
						  	 
						  </c:if>
						  
						  	<c:if test="${recordguan==null}">
						  	 
						  	  <p><a href="javascript:guanzhu('${item.id}')">点击关注</a></p>
						  </c:if>
						   <c:if test="${record!=null}">
						  	  <p><a href="">已收藏</a></p>
						  	  
						  </c:if>
						   <c:if test="${recordguan!=null}">
						  	  
						  	   <p><a href="">已关注</a></p>
						  </c:if>
						  </c:if>
						  
						</div>
						<div class="card-reveal">
						  <span class="card-title grey-text text-darken-4">名称：${item.voidname }<i class="material-icons right">close</i></span>
						  <p>简介：${item.voidcontent }</p>
						  <p>发布人：${item.teachername }</p>
						</div>
					  </div>
                </div>
                
           			
                <div class="col-md-6 col-sm-6" style="display: none;">
                    <div class="card">
                    	 <c:if test="${sessionScope.userSession!=null}">
                        	<div class="card-action">
                            	我的笔记<a style="margin-left: 30px" class="waves-effect waves-light btn"  data-toggle="modal" data-target="#myModal" onclick="toadduser(${item.id })">
                            	<i class="material-icons left">cloud</i>
                            	新增笔记</a>
                        	</div>
                         </c:if>
                          <c:if test="${sessionScope.userSession==null}">
                          <div class="card-action">
                            	登录后可以在线记笔记
                        	</div>
                          </c:if>
                        <div class="card-content"> 
							 <ul class="collapsible" data-collapsible="accordion">
							 	<c:forEach items="${recordlist}" var="item" varStatus="count">
							 	
							 	
								<li>
								  <div class="collapsible-header"><i class="material-icons dp48">mode_edit</i>${count.count }----${item.time }</div>
								  <div class="collapsible-body"><p>${item.content }</p></div>
								</li>
								
								</c:forEach>
							  </ul> 
                            
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
							<c:if test="${sessionScope.role!=1}">
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
	<c:if test="${sessionScope.role!=1}">
		<b><a style="margin-left: 30px" class="waves-effect waves-light btn" data-toggle="modal" data-target="#myRecordModal" onclick="toaddRecordthr(${item.id })" >
                            	<i class="material-icons left">cloud</i>
                            	发表评论</a></b> 
	</c:if>
		<c:if test="${sessionScope.role==-1}">
		
	  <b><a style="margin-left: 30px" class="waves-effect waves-light btn"  >
                            	<i class="material-icons left">cloud</i>
                            	被禁言</a></b> 
    	</c:if>
    </c:if>
    <c:if test="${sessionScope.userSession==null}">
    	<b>登录后可以发表评论</b> 
     </c:if>
	</div>
  </div>
			</div>	

                
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">新增笔记</h4>
            </div>
            <!-- 新增 -->
           <div class="row" id="addmodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>void/addbiji" method="post" enctype="multipart/form-data">
                         		<input type="hidden" id="role" name="role" value="5">
                         		<input type="hidden" id="nid" name="nid">
								  <div class="row">
									<div class="input-field col s12">
									
									  <textarea id="textarea1" name="content" id="content" class="materialize-textarea"></textarea>
									  <label for="icon_prefix">笔记内容</label>
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
                         	<form class="col s12" action="<%=Const.ROOT%>void/addhufu" method="post" enctype="multipart/form-data">
                         		
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
                         	<form class="col s12" action="<%=Const.ROOT%>void/addRecordthr" method="post" enctype="multipart/form-data">
                         		<input type="hidden" id="role" name="role" value="3">
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
                    <!-- /. ROW  --> 
				<footer></footer>
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

	function guanzhu(nid){
		location.href="<%=Const.ROOT %>void/addRecordFou/"+nid;
	}
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
