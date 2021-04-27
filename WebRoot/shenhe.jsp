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
		  <form action="<%=Const.ROOT%>kind/getKindlist" method="post">
		  <div class="row">
		  <div class="col-sm-6">
                        <h1 class="page-header">
                            	学习计划审核<small>管理</small> 
                            	
                            	

                        </h1>
                       
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
                                            <th>学习计划名称</th>
                                            <th>员工名</th>
                                            
                                            <th width="60%">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.list}" var="item" varStatus="count">
                                        <tr class="info">
                                            <td>${count.count }</td>
                                            <td>${item.kindname }</td>
                                             <td>${item.username }</td>
                                            <td>
                                                                               
									 <a class="waves-effect waves-light btn" data-toggle="modal" data-target="#deleteModal" onclick="todelete('${item.id}')">
                            						审核通过</a>
                                               </td>
                                           
                                        </tr>
                                      </c:forEach>  
                                    </tbody>
                                </table>
                                
                                <!--分页-->
                                <form action="<%=Const.ROOT%>kind/getshenhe" method="post" id="Page">
                                	
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
                <h4 class="modal-title" id="myModalLabel">新增学习计划</h4>
            </div>
            <!-- 新增 -->
           <div class="row" id="addmodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>kind/addKind" method="post" enctype="multipart/form-data">
                         		
								  <div class="row">
									<div class="input-field col s6">
									
									  <input id="kindname" name="kindname" required="" type="text" class="validate">
									  <label for="icon_prefix">学习计划名称</label>
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
                <h4 class="modal-title" id="myModalLabel">修改学习计划</h4>
            </div>
           <div class="row" id="updatemodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>kind/updateKind" method="post" enctype="multipart/form-data">
                         		<input type="hidden" id="id" name="id">
								  
								 
								  <div class="row">
									<div class="input-field col s6">
									
									  <input id="kindname" name="kindname" required="" type="text" class="validate">
									  <label for="icon_prefix">学习计划名称</label>
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
                <h4 class="modal-title" id="myModalLabel">审核学习计划</h4>
            </div>
           <div class="row" id="deletemodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>kind/doshenhe" method="post" enctype="multipart/form-data">
                         		<input id="id" name="id"  type="hidden"/>	
									 <div class="row">
									<div class="input-field col s12">
									  
									  <label>是否审核通过？</label>
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


	function toadduser(){
		$("#addmodal").show();
	}

	function todelete(id){
		 $("#deletemodal #id").val(id);
			$("#deletemodal").show();
	}

	function toupdate(id){
        $.getJSON("${pageContext.request.contextPath }/kind/toupdateKind/"+id,function(data){
            $("#updatemodal #id").val(id);
           
            $("#updatemodal #kindname").val(data.kindname);
            
            $("#updatemodal").show();
            
        });
    }
	function tolookVoid(id){
		 location.href="${pageContext.request.contextPath }/kind/getVoidlist/"+id;
	}
	function tolookziliao(id){
		 location.href="${pageContext.request.contextPath }/kind/getziliaolist/"+id;
	}
	
</script>

</html>
