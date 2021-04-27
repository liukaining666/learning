<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>精品课程教学网站</title>
	
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
        <div id="page-wrapper" style="margin-top: -14px">
		  <div class="header"> 
		  <form action="<%=Const.ROOT%>news/getNewslist" method="post">
		  <div class="row">
		  <div class="col-sm-6">
                        <h1 class="page-header">
                            	话题<small>管理</small> 
                            <c:if test="${sessionScope.role==-1}">
	                            	<a class="waves-effect waves-light btn" >
	                            	<i class="material-icons left">cloud</i>
	                            	被禁言</a>
	                            	<!-- 按钮触发模态框 -->
                            	</c:if>
                            	
                            	<a class="waves-effect waves-light btn" data-toggle="modal" data-target="#myModal" onclick="toadduser()">
                            	<i class="material-icons left">cloud</i>
                            	发布话题</a>
                            	<!-- 按钮触发模态框 -->
                            	
                            	

                        </h1>
                        </div>
                          <c:if test="${sessionScope.role==1}">
                          	<div class="col-sm-3">
                          		<div id="dataTables-example_filter" class="dataTables_filter">
                          		   <label>查询:<input type="search" name="username" value="${username }" class="form-control input-sm" placeholder="请输入用户名" aria-controls="dataTables-example">
                          		    
                          		   </label>
                          		   </div>
                           </div>
                           </c:if>
                           <div class="col-sm-3">
                          		<div id="dataTables-example_filter" class="dataTables_filter">
                          		   <label>查询:<select class="form-control"  id="kindid" name="kindid">
						 				 <option value="-1">--请选择视频课程--</option>
						 				<c:forEach items="${kindList}" var="item" varStatus="count">
						 					<option value="${item.id }">${item.kindname }</option>
						 				</c:forEach>
									  
									</select>
                          		     <button class="btn" type="submit"> GO!</button>
                          		   </label>
                          		   </div>
                           </div>
                          	</div>
                        </form>
                    
								
		</div>
		
			<!-- 表格 -->
           <div class="col-md-12">
                     <!--    Context Classes  -->
                    <div class="card">
                        <div class="card-content">
                            <div class="table-responsive">
                                <table class="table" >
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>名称</th>
                                            <th>类型</th>
                                            <th>发布人</th>
                                            <th>发布时间</th>
                                           
                                            
                                            <th width="30%">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.list}" var="item" varStatus="count">
                                        <tr class="info">
                                            <td>${count.count }</td>  
                                              <td>${item.title }</td>  
                                               <td>${item.kindname }</td>
                                              <td>${item.username }</td>
                                              
                                              <td>${item.pubtime }</td>
                                             
                                               <td>
                                               <a class="waves-effect waves-light btn"  onclick="tolook('${item.id}')">
                            						查看</a>
                            						
                                               <a class="waves-effect waves-light btn" data-toggle="modal" data-target="#updateModal" onclick="toupdate('${item.id}')">
                            						修改</a>
                                  
									 <a class="waves-effect waves-light btn" data-toggle="modal" data-target="#deleteModal" onclick="todelete('${item.id}')">
                            						删除</a>
                                               </td>
                                           
                                        </tr>
                                      </c:forEach>  
                                    </tbody>
                                </table>
                                
                                <!--分页-->
                                <form action="<%=Const.ROOT%>news/getNewslist" method="post" id="Page">
                                	
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
                              
                            </div>
                        </div>
                    </div>
                    <!--  end  Context Classes  -->
                </div>
                
                
                

<!-- 模态框（Modal） -->

 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">发布话题</h4>
            </div>
            <!-- 新增 -->
           <div class="row" id="addmodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>news/addNews" method="post" enctype="multipart/form-data">
                         			<input type="hidden" id="top" name="top" value="1">
                         			
								  <div class="row">
									<div class="input-field col s6">
									
						 				<input id="title" name="title" required="" type="text" class="validate">
									  <label for="icon_prefix">标题</label>
							
									</div>
									<div class="input-field col s6">
									
						 				<select class="form-control"  id="kindid" name="kindid">
						 				 <option>--请选择话题课程--</option>
						 				<c:forEach items="${kindList}" var="item" varStatus="count">
						 					<option value="${item.id }">${item.kindname }</option>
						 				</c:forEach>
							           </select>
									</div>
								  </div>
								<div class="row">
								<div class="input-field col s12">
								  <textarea id="textarea1" name="content" required="" id="content" class="materialize-textarea"></textarea>
								  <label for="textarea1">内容</label>
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
          
        
         <!--修改 -->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改话题信息</h4>
            </div>
           <div class="row" id="updatemodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>news/updateNews" method="post" enctype="multipart/form-data">
                         		<input id="id" name="id" type="hidden"/>
                         			
								  <div class="row">
									<div class="input-field col s6">
									
						 				<input id="title" name="title" type="text" required="" class="validate">
									  <label for="icon_prefix">标题</label>
							
									</div>
									<div class="input-field col s6">
									
						 				<input id="kindid" name="kindid" type="number" required="" class="validate">
									  <label for="icon_prefix">话题类型</label>
							
									</div>
								  </div>
								<div class="row">
								<div class="input-field col s12">
								  <textarea  name="content" id="content" required="" class="materialize-textarea"></textarea>
								  <label for="textarea1">内容</label>
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
       
       <!--删除 -->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">删除视频</h4>
            </div>
           <div class="row" id="deletemodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>news/delNews" method="post" enctype="multipart/form-data">
                         		
                         		<input id="id" name="id"  type="hidden"/>	
									 <div class="row">
									<div class="input-field col s12">
									  
									  <label>是否删除？</label>
									</div>
								  </div>
					   
								  <div class="modal-footer">
									   
									
									    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						   <button type="submit" class="btn btn-danger">确定</button>
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
	function doPage(page){
		$("#pageNum").val(page);
		$("#Page").submit();
	}

	function tolook(id){
		 location.href="${pageContext.request.contextPath }/news/lookNews/"+id;
	}
	
	function toadduser(){
		$("#addmodal").show();
	}

	function todelete(id){
		 $("#deletemodal #id").val(id);
			$("#deletemodal").show();
	}

	function toupdate(id){
        $.getJSON("${pageContext.request.contextPath }/news/toupdateNews/"+id,function(data){
            $("#updatemodal #id").val(id);
           
            $("#updatemodal #title").val(data.title);
            $("#updatemodal #content").val(data.content);
            $("#updatemodal #kindid").val(data.kindid);
            
            $("#updatemodal").show();
            
        });
    }

	
</script>

</html>
