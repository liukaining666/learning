<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>教学网站</title>
	
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
                            	我的 <small>私信</small> 
                            
                            	

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
                                            <th>发信人</th>
                                            
                                            
                                            <th width="40%">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list}" var="item" varStatus="count">
                                        <tr class="info">
                                            <td>${count.count }</td>
                                            <td>${item.username }</td>
                                            <td>
                                               <a class="waves-effect waves-light btn" data-toggle="modal" data-target="#deleteModal" onclick="tolook(${item.id })" >
                            						查看</a>
                                  	
                                               </td>
                                           
                                        </tr>
                                      </c:forEach>  
                                    </tbody>
                                </table>
                                
                              
                              
                                
                                
                                
                            </div>
                        </div>
                    </div>
                    <!--  end  Context Classes  -->
                </div>
                
               

           
        </div>
        </div>
       
       <!--删除 -->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">收信内容</h4>
            </div>
           <div class="row" id="deletemodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	
                         		<input id="id" name="id"  type="hidden"/>	
									 <div class="row">
									<div class="input-field col s12">
									 <textarea  name="content" id="content" class="materialize-textarea"></textarea>
									  
									</div>
								  </div>
					   
								  <div class="modal-footer">
									   
									
									    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						  
								   </div>
								
							
							
							
 
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


	

	function tolook(id){
        $.getJSON("${pageContext.request.contextPath }/user/tolooksixin/"+id,function(data){
            $("#deletemodal #id").val(id);
           
            $("#deletemodal #content").val(data.content);
            
            $("#deletemodal").show();
            
        });
    }

	
</script>

</html>
