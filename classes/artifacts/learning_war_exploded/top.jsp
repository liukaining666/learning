<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

     <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand waves-effect waves-dark"  href=""> <strong>课堂交互系统</strong></a>
				
		<div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
            </div>
		
            <ul class="nav navbar-top-links navbar-right"> 
				<c:if test="${sessionScope.userSession.headpic!=null }">
				<li><img style="width: 30px;margin-top: -45px" src="<%=Const.ROOT%>headpic/${sessionScope.userSession.headpic }"/></li>
				</c:if>
				
				<li><a class="dropdown-button waves-effect" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>${sessionScope.userSession.username }</b> <i class="material-icons right">arrow_drop_down</i></a></li>
			
            </ul>
        </nav>
		<!-- 用户模块 -->
		
		
			<ul id="dropdown1" class="dropdown-content">
			<c:if test="${sessionScope.userSession!=null }">
				
				</li>
				<li><a href="<%=Const.ROOT%>user/toupdateMe"><i class="fa fa-gear fa-fw"></i> 个人信息</a>
				</li> 
				<li><a href="<%=Const.ROOT%>user/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
				</li>
			 </c:if>
			 <c:if test="${sessionScope.userSession==null }">
				<li><a href="<%=Const.ROOT%>/register.jsp"><i class="fa fa-sign-out fa-fw"></i>注册</a>
				<li><a href="<%=Const.ROOT%>login/login.jsp"><i class="fa fa-sign-out fa-fw"></i> Login</a>
				</li>
			 </c:if>
			</ul>
		
		
			<li><a href="#"><i class="fa fa-user fa-fw"></i> My Profile</a>
				</li>
		
<ul id="dropdown2" class="dropdown-content w250">
  <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
</ul>
<ul id="dropdown3" class="dropdown-content dropdown-tasks w250">
<li>
		<a href="#">
			<div>
				<p>
					<strong>Task 1</strong>
					<span class="pull-right text-muted">60% Complete</span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
						<span class="sr-only">60% Complete (success)</span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li>
		<a href="#">
			<div>
				<p>
					<strong>Task 2</strong>
					<span class="pull-right text-muted">28% Complete</span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100" style="width: 28%">
						<span class="sr-only">28% Complete</span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li>
		<a href="#">
			<div>
				<p>
					<strong>Task 3</strong>
					<span class="pull-right text-muted">60% Complete</span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
						<span class="sr-only">60% Complete (warning)</span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li>
		<a href="#">
			<div>
				<p>
					<strong>Task 4</strong>
					<span class="pull-right text-muted">85% Complete</span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
						<span class="sr-only">85% Complete (danger)</span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li>
</ul>   
<ul id="dropdown4" class="dropdown-content dropdown-tasks w250 taskList">
  <li>
                                <div>
                                    <strong>John Doe</strong>
                                    <span class="pull-right text-muted">
                                        <em>Today</em>
                                    </span>
                                </div>
                                <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...</p>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <p>Lorem Ipsum has been the industry's standard dummy text ever since an kwilnw...</p>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <p>Lorem Ipsum has been the industry's standard dummy text ever since the...</p>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
</ul>  
	   <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu" >
                <!-- 权限为1 ,管理员 -->
					<c:if test="${sessionScope.role==1}">
						 
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>user/getUserlist" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 用户管理</a>
                    </li>
                     <li style="height: 42px">
                        <a href="<%=Const.ROOT%>user/getTeacherlist" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 教师管理</a>
                    </li>
					<li style="height: 42px">
                        <a href="<%=Const.ROOT%>kind/getKindlist" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 课程管理</a>
                    </li>
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>void/getVoidlist" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 视频管理</a>
                    </li>
                     <li style="height: 42px">
                        <a href="<%=Const.ROOT%>void/getziliaolist" class="waves-effect waves-dark"><i class="fa fa-edit"></i> 资料管理 </a>
                    </li>
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>news/getNewslist" class="waves-effect waves-dark"><i class="fa fa-table"></i> 话题管理</a>
                    </li>
                    
					  <li style="height: 42px">
                        <a data-toggle="modal" data-target="#gonggaoModal" onclick="toaddgonggao()" class="waves-effect waves-dark"><i class="fa fa-table"></i> 发布新公告</a>
                    </li>
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>kind/getshenhe" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i>审核</a>
                    </li>
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>timu/getTimulist" class="waves-effect waves-dark"><i class="fa fa-edit"></i> 试题管理 </a>
                    </li> 
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>timu/getKaoshilist" class="waves-effect waves-dark"><i class="fa fa-edit"></i> 成绩查看 </a>
                    </li> 
					</c:if>	
                   <!-- 权限为2 ,教师-->
					<c:if test="${sessionScope.role==2}">
					<li style="height: 42px">
                        <a href="<%=Const.ROOT%>kind/getKindlist" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 课程管理</a>
                    </li>	
                     <li style="height: 42px">
                        <a href="<%=Const.ROOT%>void/getziliaolist" class="waves-effect waves-dark"><i class="fa fa-edit"></i> 资料管理 </a>
                    </li> 
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>void/getVoidlist" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 视频管理</a>
                    </li>
                    
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>news/getNewslist" class="waves-effect waves-dark"><i class="fa fa-table"></i> 话题管理</a>
                    </li>
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>kind/getshenhe" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i>审核</a>
                    </li>
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>timu/getTimulist" class="waves-effect waves-dark"><i class="fa fa-edit"></i> 试题管理 </a>
                    </li> 
                   <li style="height: 42px">
                        <a href="<%=Const.ROOT%>timu/getKaoshilist" class="waves-effect waves-dark"><i class="fa fa-edit"></i> 成绩查看 </a>
                    </li> 
					</c:if>	
					<!--
                    <li style="height: 42px">
                          <a href="<%=Const.ROOT%>void/getVoidlist?role=3" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 学习视频</a>
                    </li> -->
                    
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>news/getNewslist?role=3" class="waves-effect waves-dark"><i class="fa fa-table"></i> 最新话题</a>
                    </li>
                    <li style="height: 42px">
                        <a href="<%=Const.ROOT%>void/getziliaolist?role=3" class="waves-effect waves-dark"><i class="fa fa-edit"></i> 学习资料 </a>
                    </li>
                    
                    <!-- 权限为3 ,学生 -->
                    <c:if test="${sessionScope.role==3}">
                   <!-- <li style="height: 42px">
                    
                         <a href="<%=Const.ROOT%>news/getNewslist" class="waves-effect waves-dark"><i class="fa fa-table"></i> 话题管理</a>
                    </li> -->
                   <!-- <li style="height: 42px">
                          <a href="<%=Const.ROOT%>void/getVoidlist?role=3" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 学习视频</a>
                    </li>-->
					<li style="height: 42px">
                        <a href="#" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i> 我的--<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li style="height: 42px">
                                <a href="<%=Const.ROOT%>kind/getMyjihua">学习计划</a>
                            </li >
                            <li style="height: 42px">
                                <a href="<%=Const.ROOT%>timu/getMyScore">我的成绩</a>
                            </li>
                            
                            
                        </ul>
                    </li>
                    </c:if>	
                </ul>

            </div>

        </nav>
  <!-- 模态框（Modal） -->

 
<div class="modal fade" id="gonggaoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">发布公告</h4>
            </div>
            <!-- 新增 -->
           <div class="row" id="addgonggaomodal" style="display: none">
                <div class="col-lg-12">
                 
                        <div class="card-content">
                         	<form class="col s12" action="<%=Const.ROOT%>news/addNews" method="post" enctype="multipart/form-data">
                         			<input type="hidden" id="top" name="top" value="2">
                         			
								  <div class="row">
									<div class="input-field col s6">
									
						 				<input id="title" name="title" required="" type="text" class="validate">
									  <label for="icon_prefix">标题</label>
							
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
<script type="text/javascript">
function toaddgonggao(){
	$("#addgonggaomodal").show();
}

</script>
