<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head> 
  <%@include file="../../../include/incss.jsp"%>
  <script type="text/javascript" src="${emp}/assets/js/jquery-3.4.1.min.js"></script>
  <%@include file="../../../include/inlink.jsp"%>
   <% pageContext.setAttribute("emp",request.getContextPath());%> 
       <script language="javascript" type="text/javascript">
            //保存成功的提示消息
            $(function(){
            	if('${act}' != ''){
            		showResult();
            	}
            	$("#fsubmit").click(function(){
            		$("#fForm").submit();
            	})           	
            })
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                if(flag){     
                	$("#save_result_info").css("display","block");
                    location.href="${emp}/selectAdminUsers";
                }else{
                	$("#save_result_info").css("display","none");
                }
            }
        </script>
  <!-- bootstrap-3.3.7 -->
  <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
	<%@include file="../../../include/injs.jsp"%>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- /.search form -->
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="assets/img/avatar5.png" class="img-circle"
							alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${admin1.aname}</p>
						<!-- Status -->
						<a href="#"><i class="fa fa-circle text-success"></i> BAT</a>
					</div>
				</div>

				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">系统功能</li>
					<c:forEach items="${admin1.lip}" var="power">
						<c:choose>
							<c:when test="${power.pclass=='index'}">
								<li class="treeview" name="index">
									<a href="#">
									<i class="fa fa-dashboard"></i>
										<span>主页</span>
										<span class="pull-right-container">
											<small class="label pull-right bg-green">z</small>
										</span>
									</a>
									<ul class="treeview-menu">
										<li><a href="${emp}/index"><i class="fa fa-circle-o"></i> 主页面</a></li>
										<li><a href="${emp}/login.jsp"><i class="fa fa-circle-o"></i> 重新登录</a></li>
									</ul>
								</li>							
							</c:when>
							<c:when test="${power.pclass=='role'}">
								<li class="treeview">
									<a href="#">
									<i class="fa fa-files-o"></i>
									<span>角色管理</span></a>
									<ul class="treeview-menu">
										<li><a href="${emp}/selectRoles"><i class="fa fa-circle-o"></i> 查询角色</a></li>
										<li><a href="${emp}/role/AddPowers"><i class="fa fa-circle-o"></i> 增加角色</a></li>
										<li><a href="${emp}/selectRoles"><i class="fa fa-circle-o"></i> 修改角色</a></li>
										<li><a href="${emp}/selectRoles"><i class="fa fa-circle-o"></i> 删除角色</a></li>
									</ul>
								</li>
							</c:when>
							<c:when test="${power.pclass=='admin'}">
								<li class="active treeview" name="index">
									<a href="#">
									<i class="fa fa-laptop"></i>
										<span>管理员</span>
										<span class="pull-right-container">
											<span class="label label-primary pull-right">a</span>
										</span>
									</a>
									<ul class="treeview-menu">
										<li><a href="${emp}/selectAdminUsers"><i class="fa fa-circle-o"></i> 查询管理员</a></li>
										<li class="active"><a href="${emp}/addAdminRoles"><i class="fa fa-circle-o"></i> 增加管理员</a></li>
										<li><a href="${emp}/selectAdminUsers"><i class="fa fa-circle-o"></i> 修改管理员</a></li>
										<li><a href="${emp}/selectAdminUsers"><i class="fa fa-circle-o"></i> 删除管理员</a></li>
									</ul>
								</li>
							</c:when>
							<c:when test="${power.pclass=='fee'}">
								<li class="treeview">
									<a href="#">
									<i class="fa fa-edit"></i>
										<span>资费管理</span>
										<span class="pull-right-container">
											<span class="label label-primary pull-right">f</span>
										</span>
									</a>
									<ul class="treeview-menu">
										<li><a href="${emp}/fee_list"><i class="fa fa-circle-o"></i> 查询</a></li>
										<li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i> 增加</a></li>
										<li><a href="pages/layout/fixed.html"><i class="fa fa-circle-o"></i> 修改</a></li>
										<li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> 删除</a></li>
									</ul>
								</li>
							</c:when>
							<c:when test="${power.pclass=='account'}">
								<li class="treeview">
									<a href="#">
									<i class="fa fa-table"></i> 
										<span>账务账号</span>
										<span class="pull-right-container">
											<span class="label label-primary pull-right">c</span>
										</span>
									</a>
									<ul class="treeview-menu">
										<li><a href="${emp}/account_list"><i class="fa fa-circle-o"></i> 查询</a></li>
										<li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i> 增加</a></li>
										<li><a href="pages/layout/fixed.html"><i class="fa fa-circle-o"></i> 修改</a></li>
										<li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> 删除</a></li>
									</ul>
								</li>
							</c:when>
							<c:when test="${power.pclass=='service'}">
								<li class="treeview">
									<a href="#">
									<i class="fa fa-folder"></i>
										<span>业务账号</span>
										<span class="pull-right-container">
											<span class="label label-primary pull-right">s</span>
										</span>
									</a>
									<ul class="treeview-menu">
										<li><a href="${emp}/service_list"><i class="fa fa-circle-o"></i> 查询</a></li>
										<li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i> 增加</a></li>
										<li><a href="pages/layout/fixed.html"><i class="fa fa-circle-o"></i> 修改</a></li>
										<li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> 删除</a></li>
									</ul>
								</li>
							</c:when>
							<c:when test="${power.pclass=='bill'}">
								<li class="treeview">
									<a href="#">
									<i class="fa fa-calendar"></i>
										<span>账单管理</span>
										<span class="pull-right-container">
											<span class="label label-primary pull-right">b</span>
										</span>
									</a>
									<ul class="treeview-menu">
										<li><a href="${emp}/bill_list"><i class="fa fa-circle-o"></i> 查询</a></li>
										<li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i> 增加</a></li>
										<li><a href="pages/layout/fixed.html"><i class="fa fa-circle-o"></i> 修改</a></li>
										<li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> 删除</a></li>
									</ul>
								</li>
							</c:when>
							<c:when test="${power.pclass=='report'}">
								<li class="treeview">
									<a href="#">
									<i class="fa fa-book"></i>
										<span>报表</span>
										<span class="pull-right-container">
											<span class="label label-primary pull-right">e</span>
										</span>
									</a>
									<ul class="treeview-menu">
										<li><a href="${emp}/report_list"><i class="fa fa-circle-o"></i> 查看报表</a></li>
										<li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i> 打印报表</a></li>
									</ul>
							</c:when>
							<c:when test="${power.pclass=='information'}">
								<li>
									<a href="${emp}/user_info">
									<i class="fa fa-circle-o text-aqua"></i>
										<span>个人信息</span>
										<span class="pull-right-container">
											<small class="label pull-right bg-yellow">i</small>
										</span>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="${emp}/user_modi_pwd">
									<i class="fa fa-circle-o text-yellow"></i>
										<span>修改密码</span>
										<span class="pull-right-container">
											<small class="label pull-right bg-red">p</small>
										</span>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
	  <div class="content-wrapper">
	    <!-- Content Header (Page header) -->
	    <section class="content-header">
	      <h1>
	        Data Tables
	        <small>advanced tables</small>
	      </h1>
	      <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li><a href="#">Tables</a></li>
	        <li class="active">Data tables</li>
	      </ol>
	    </section>
	
		<!--数据区域：用表格展示数据-->
		 <div id="main">            
            <div id="save_result_info" class="save_success" style="display:none">${act}</div>
            <form action="${emp}/addAdmin" id="fForm" method="post" enctype="multipart/form-data" class="main_form" >
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" name="aname"/>
                        <span class="required"></span>
                        <div class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info">
                        <input type="text" name="acname" />
                        <span class="required"></span>
                        <div class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>密码：</span></div>
                    <div class="input_info">
                        <input type="password" name="apwd" />
                        <span class="required"></span>
                        <div class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>重复密码：</span></div>
                    <div class="input_info">
                        <input type="password" name="apwd1" />
                        <span class="required"></span>
                        <div class="validate_msg_long"></div>
                    </div>      
					<div class="text_info clearfix"><span>上传头像</span></div>
                    <div class="input_info">
                        <input type="file" name="userimg"  />
                        <span class="required"></span>
                        <div class="validate_msg_long"></div>
                    </div>  
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="aphone"/>
                        <span class="required"></span>
                        <div class="validate_msg_medium"></div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="aemail"/>
                        <span class="required"></span>
                        <div class="validate_msg_medium"></div>
                    </div>
                    <div class="text_info clearfix"><span>角色：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                            <ul>
	                            <c:forEach items="${role}" var="r">
	                            	<li><input type="checkbox" name="rolename" value="${r.rid}"/>${r.rname}</li>
	                            </c:forEach>       
                            </ul>
                        </div>
                        <span class="required"></span>
                        <div class="validate_msg_tiny"></div>
                    </div>
                    <div class="button_info clearfix">
                        <input type="button" value="保存" class="btn_save" id="fsubmit" />
                        <input type="button" value="取消" class="btn_save" />
                    </div>
                    <input type="hidden" name="dlname" value="${admin.aname}"/>
                </form>  
        </div>
	    
	</div>
	<!-- /.content-wrapper -->
	<footer class="main-footer">
		<div class="pull-right hidden-xs">
		   <b>Version</b> 2.4.18
		</div>
		<strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE</a>.</strong> All rights
		    reserved.
	</footer>
</body>
</html>
