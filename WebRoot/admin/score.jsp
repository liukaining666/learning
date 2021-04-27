<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

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
        <div id="page-wrapper" style="margin-top: -14px">
		  <div class="header"> 
		  <form action="<%=Const.ROOT%>timu/getTimulist" method="post">
		  <div class="row">
		  <div class="col-sm-6">
                        <h1 class="page-header">
                            	我的<small>成绩</small> 
                           
                            	
                            	

                        </h1>
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
                                          
                                          <th>时间</th>
                                            <th>分数</th>
                                           	 <th>操作</th>
                                           
                                            
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list}" var="item" varStatus="count">
                                        <tr class="info">
                                            <td>${count.count }</td>  
                                           
                                              <td>${item.ctime }</td>  
                                             
                                              <td>${item.score }</td>
                                               <th><a class="waves-effect waves-light btn"  onclick="tolook('${item.id}')">
                            						查看</a>
                                             </th>
                                             
                                              
                                           
                                        </tr>
                                      </c:forEach>  
                                    </tbody>
                                </table>
                                
                                
                              
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
                <h4 class="modal-title" id="myModalLabel">新增试题</h4>
            </div>
            <!-- 新增 -->
           <div class="row" id="addmodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>timu/addTimu" method="post" enctype="multipart/form-data">
                         			
                         			
								  <div class="row">
									
									<div class="input-field col s6">
									
						 				<select class="form-control"  id="kindid" name="kindid">
						 				 <option>--请选择试题课程--</option>
						 				<c:forEach items="${kindList}" var="item" varStatus="count">
						 					<option value="${item.id }">${item.kindname }</option>
						 				</c:forEach>
							           </select>
									</div>
								  </div>
								<div class="row">
								<div class="input-field col s12">
								  <textarea id="title" name="title" required="" class="materialize-textarea"></textarea>
								  <label for="textarea1">题干</label>
								</div>
							  </div>
								<div class="row">
								<div class="input-field col s6">
								  <textarea id="opa" name="opa" required="" id="content" class="materialize-textarea"></textarea>
								  <label for="textarea1">选项A</label>
								</div>
								<div class="input-field col s6">
								  <textarea id="opb" name="opb" required=""  class="materialize-textarea"></textarea>
								  <label for="textarea1">选项B</label>
								</div>
							  </div>
							 
							  <div class="row">
								<div class="input-field col s6">
								  <textarea id="opc" name="opc" required="" class="materialize-textarea"></textarea>
								  <label for="textarea1">选项c</label>
								</div>
								<div class="input-field col s6">
								  <textarea id="opd" name="opd" required=""  class="materialize-textarea"></textarea>
								  <label for="textarea1">选项D</label>
								</div>
							  </div>
							  
							  <div class="row">
								<div class="input-field col s6">
								  <select class="form-control"  id="answer" name="answer">
						 				 <option>--请选择正确答案--</option>
						 				
						 					<option value="A">A</option>
						 				<option value="B">B</option>
						 				<option value="C">C</option>
						 				<option value="D">D</option>
							           </select>
								</div>
								<div class="input-field col s6">
								  <input id="score" name="score" type="number" required="" class="validate">
									  <label for="icon_prefix">请输入此题分数</label>
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
                <h4 class="modal-title" id="myModalLabel">修改题目信息</h4>
            </div>
           <div class="row" id="updatemodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>timu/updateTimu" method="post" enctype="multipart/form-data">
                         		<input id="id" name="id" type="hidden"/>
                         			
								  <div class="row">
									
									<div class="input-field col s6">
									
						 				<select class="form-control"  id="kindid" name="kindid">
						 				 <option>--请选择试题课程--</option>
						 				<c:forEach items="${kindList}" var="item" varStatus="count">
						 					<option value="${item.id }">${item.kindname }</option>
						 				</c:forEach>
							           </select>
									</div>
								  </div>
								<div class="row">
								<div class="input-field col s12">
								  <textarea id="title" name="title" required="" class="materialize-textarea"></textarea>
								  <label for="textarea1">题干</label>
								</div>
							  </div>
								<div class="row">
								<div class="input-field col s6">
								  <textarea id="opa" name="opa" required="" id="content" class="materialize-textarea"></textarea>
								  <label for="textarea1">选项A</label>
								</div>
								<div class="input-field col s6">
								  <textarea id="opb" name="opb" required=""  class="materialize-textarea"></textarea>
								  <label for="textarea1">选项B</label>
								</div>
							  </div>
							 
							  <div class="row">
								<div class="input-field col s6">
								  <textarea id="opc" name="opc" required="" class="materialize-textarea"></textarea>
								  <label for="textarea1">选项c</label>
								</div>
								<div class="input-field col s6">
								  <textarea id="opd" name="opd" required=""  class="materialize-textarea"></textarea>
								  <label for="textarea1">选项D</label>
								</div>
							  </div>
							  
							  <div class="row">
								<div class="input-field col s6">
								  <select class="form-control"  id="answer" name="answer">
						 				 <option>--请选择正确答案--</option>
						 				
						 					<option value="A">A</option>
						 				<option value="B">B</option>
						 				<option value="C">C</option>
						 				<option value="D">D</option>
							           </select>
								</div>
								<div class="input-field col s6">
								  <input id="score" name="score" type="number" required="" class="validate">
									  <label for="icon_prefix">请输入此题分数</label>
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
                <h4 class="modal-title" id="myModalLabel">删除题目</h4>
            </div>
           <div class="row" id="deletemodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>timu/delTimu" method="post" enctype="multipart/form-data">
                         		
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

	
	
	function toadduser(){
		$("#addmodal").show();
	}


	function tolook(id){
		location.href="<%=Const.ROOT %>timu/look/"+id;
	}

	function todelete(id){
		 $("#deletemodal #id").val(id);
			$("#deletemodal").show();
	}

	function toupdate(id){
        $.getJSON("${pageContext.request.contextPath }/timu/toupdateTimu/"+id,function(data){
            $("#updatemodal #id").val(id);
           
            $("#updatemodal #title").val(data.title);
            $("#updatemodal #opa").val(data.opa);
            $("#updatemodal #opb").val(data.opb);
            $("#updatemodal #opc").val(data.opc);
            $("#updatemodal #opd").val(data.opd);
            $("#updatemodal #kindid").val(data.kindid);
            $("#updatemodal #answer").val(data.answer);
            $("#updatemodal #score").val(data.score);
            
            $("#updatemodal").show();
            
        });
    }

	
</script>

</html>
