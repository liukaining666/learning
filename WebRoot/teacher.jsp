<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>课堂交互系统</title>
	
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
		  <form action="<%=Const.ROOT%>user/getTeacherlist" method="post">
		  <div class="row">
		  <div class="col-sm-6">
                        <h1 class="page-header">
                            	教师 <small>管理</small> 
                            
                            	<a class="waves-effect waves-light btn" data-toggle="modal" data-target="#myModal" onclick="toadduser()">
                            	<i class="material-icons left">cloud</i>
                            	新增教师</a>
                            	<!-- 按钮触发模态框 -->

                        </h1>
                        </div>
                          	<div class="col-sm-6"><div id="dataTables-example_filter" class="dataTables_filter"><label>查询:<input type="search" value="${username }" name="username" class="form-control input-sm" placeholder="请输入教师名" aria-controls="dataTables-example"><button class="btn" type="submit"> GO!</button></label></label></div></div>
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
                                            <th>用户名</th>
                                            <th>真实姓名</th>
                                            <th>密码</th>
                                            <th>电话</th>
                                            <th>Email</th>
                                            <th>住址</th>
                                            <th>头像</th>
                                            <th width="20%">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageInfo.list}" var="item" varStatus="count">
                                        <tr class="info">
                                            <td>${count.count }</td>
                                            <td>${item.username }</td>
                                            <td>${item.realname }</td>
                                            <td>${item.password }</td>
                                            <td>${item.phone }</td>
                                            <td>${item.email }</td>
                                             <td>${item.address }</td>
                                              <td><img style="width: 30px" src="<%=Const.ROOT%>headpic/${item.headpic}"/></td>  
                                              
                                               <td>
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
                                <form action="<%=Const.ROOT%>user/getTeacherlist" method="post" id="Page">
                                	
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
                <h4 class="modal-title" id="myModalLabel">新增老师</h4>
            </div>
            <!-- 新增 -->
           <div class="row" id="addmodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>user/addUser" method="post" enctype="multipart/form-data">
                         		<input id="role" name="role" value="2" type="hidden"/>
                         			
								  <div class="row">
									<div class="input-field col s6">
									  <i class="material-icons prefix">account_circle</i>
									  <input id="username" name="username" required="" type="text" class="validate">
									  <label for="icon_prefix">教师名</label>
									</div>
									<div class="input-field col s6">
									  <i class="material-icons prefix">phone</i>
									  <input id="phone" name="phone" type="number" required="" class="validate">
									  <label for="icon_telephone">phone</label>
									</div>
								  </div>
								
								 
								  <div class="row">
									<div class="input-field col s6">
									
									  <input id="realname" name="realname" type="text" required="" class="validate">
									  <label for="icon_prefix">真实姓名</label>
									</div>
									<div class="input-field col s6">
									 
									  <input id="password" name="password" type="text" required="" class="validate">
									  <label for="icon_telephone">密码</label>
									</div>
								  </div>
								   <div class="row">
									<div class="input-field col s12">
									  <input id="email" name="email" type="email" class="validate">
									  <label for="email" data-error="wrong" data-success="right">Email</label>
									</div>
								  </div>
								   <div class="row">
									<div class="input-field col s12">
									  <input id="address" name="address" type="text" required="" class="validate">
									  <label for="address" data-error="wrong"  data-success="right">地址</label>
									</div>
								  </div>
								    <div class="row">
									<div class="input-field col s12">
									  <input type="file" name="file" style="margin-left: 50px;margin-top: 15px" required="" class="validate">
									  <label for="file" data-error="wrong"  data-success="right">头像</label>
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
                <h4 class="modal-title" id="myModalLabel">修改教师</h4>
            </div>
           <div class="row" id="updatemodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>user/updateUser" method="post" enctype="multipart/form-data">
                         		<input id="role" name="role" type="hidden"/>
                         		<input id="id" name="id"  type="hidden"/>	
								  <div class="row">
									<div class="input-field col s6">
									教师名：
									  <input id="username" name="username" required="" type="text" class="validate">
									  
									</div>
									<div class="input-field col s6">
									  电话：
									  <input id="phone" name="phone" type="number" required="" class="validate">
									
									</div>
								  </div>
								
								 
								  <div class="row">
									<div class="input-field col s6">
									真实姓名：
									  <input id="realname" name="realname" type="text" required="" class="validate">
							
									</div>
									<div class="input-field col s6">
									 密码：
									  <input id="password" name="password" type="text" required="" class="validate">
									  
									</div>
								  </div>
								   <div class="row">
									<div class="input-field col s12">
									Email
									  <input id="email" name="email" type="email" class="validate">
									  
									</div>
								  </div>
								   <div class="row">
									<div class="input-field col s12">
									地址：
									  <input id="address" name="address" type="text" required="" class="validate">
									 
									</div>
								  </div>
								    <div class="row">
									<div class="input-field col s12">
									  <input type="file" name="file" style="margin-left: 50px;margin-top: 15px" class="validate">
									  <label for="file" data-error="wrong"  data-success="right">头像</label>
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
                <h4 class="modal-title" id="myModalLabel">删除教师</h4>
            </div>
           <div class="row" id="deletemodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>user/delUser" method="post" enctype="multipart/form-data">
                         		<input id="role" name="role" type="hidden"/>
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
       
      <!--删除 -->
        <div class="modal fade" id="deleteModalT" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">禁言教师</h4>
            </div>
           <div class="row" id="deletemodalT" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>user/delUserT" method="post" enctype="multipart/form-data">
                         		<input id="role" name="role" type="hidden" value="-1"/>
                         		<input id="id" name="id"  type="hidden"/>	
									 <div class="row">
									<div class="input-field col s12">
									  
									  <label>是否禁言？</label>
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
       
        <!--删除 -->
        <div class="modal fade" id="deleteModalJ" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">解禁教师</h4>
            </div>
           <div class="row" id="deletemodalJ" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>user/delUserJ" method="post" enctype="multipart/form-data">
                         		<input id="role" name="role" type="hidden" value="-1"/>
                         		<input id="id" name="id"  type="hidden"/>	
									 <div class="row">
									<div class="input-field col s12">
									  
									  <label>是否解除禁言？</label>
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

function todeleteT(id){
	 $("#deletemodalT #id").val(id);
		$("#deletemodalT").show();
}

function todeleteJ(id){
	 $("#deletemodalJ #id").val(id);
		$("#deletemodalJ").show();
}
	function toadduser(){
		$("#addmodal").show();
	}

	function todelete(id){
		 $("#deletemodal #id").val(id);
			$("#deletemodal").show();
	}

	function toupdate(id){
        $.getJSON("${pageContext.request.contextPath }/user/toupdateUser/"+id,function(data){
            $("#updatemodal #id").val(id);
            $("#updatemodal #role").val(data.role);
            $("#updatemodal #username").val(data.username);
            $("#updatemodal #realname").val(data.realname);
            $("#updatemodal #phone").val(data.phone);
            $("#updatemodal #password").val(data.password);
            $("#updatemodal #address").val(data.address);
            $("#updatemodal #email").val(data.email);
            $("#updatemodal #headpic").val(data.headpic);
            $("#updatemodal").show();
            
        });
    }

	
</script>

</html>
