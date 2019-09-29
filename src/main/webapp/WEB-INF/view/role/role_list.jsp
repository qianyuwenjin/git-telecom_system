<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head> 
  <%@include file="../../../include/incss.jsp"%>
  <%@include file="../../../include/inlink.jsp"%>
   <% pageContext.setAttribute("emp",request.getContextPath());%> 
        <script language="javascript" type="text/javascript">
            function deleteRole(rid) {
                var r = window.confirm("确定要删除此角色吗？");
                location.href="${pageContext.request.contextPath}/deleteRole?rid="+rid;
            }
            function updateRole(rid) {
                location.href="${pageContext.request.contextPath}/updateViewRole?rid="+rid;
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
								<li class="active treeview" name="index">
									<a href="#">
									<i class="fa fa-files-o"></i>
									<span>角色管理</span></a>
									<ul class="treeview-menu">
										<li class="active"><a href="${emp}/selectRoles"><i class="fa fa-circle-o"></i> 查询角色</a></li>
										<li><a href="${emp}/role/AddPowers"><i class="fa fa-circle-o"></i> 增加角色</a></li>
										<li><a href="${emp}/selectRoles"><i class="fa fa-circle-o"></i> 修改角色</a></li>
										<li><a href="${emp}/selectRoles"><i class="fa fa-circle-o"></i> 删除角色</a></li>
									</ul>
								</li>
							</c:when>
							<c:when test="${power.pclass=='admin'}">
								<li class="treeview">
									<a href="#">
									<i class="fa fa-laptop"></i>
										<span>管理员</span>
										<span class="pull-right-container">
											<span class="label label-primary pull-right">a</span>
										</span>
									</a>
									<ul class="treeview-menu">
										<li><a href="${emp}/selectAdminUsers"><i class="fa fa-circle-o"></i> 查询管理员</a></li>
										<li><a href="${emp}/addAdminRoles"><i class="fa fa-circle-o"></i> 增加管理员</a></li>
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
	    <!-- Main content -->
	    <section class="content" style="background: #445566">
		      <div class="row">
		        <div class="col-xs-12">
		          <div class="box">
		            <div class="box-header">
		              <h3 class="box-title">Data Table With Full Features</h3>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		              <table id="example1" class="table table-bordered table-striped">
		                <thead>
		                	<tr>
				                <th>角色 ID</th>
				                <th>角色名称</th>
				                <th>拥有的权限</th>
				                <th>修改角色</th>
				                <th>删除角色</th>
				            </tr>
		                </thead>
		                <tbody>            
		                <c:forEach items="${roles}" var="role">
							<tr>
								<td >${role.rid}</td>
								<td >${role.rname}</td>
								<td >${role.pname}</td>
								<td><input type="button" value="修改" class="btn_modify" onclick="updateRole('${role.rid}')"/></td>
						        <td><input type="button" value="删除" class="btn_delete" onclick="deleteRole('${role.rid}');" /></td>				
							</tr>
						</c:forEach>
		                </tbody>
		                <tfoot>
		                <tr>
		                  <th>Rendering engine</th>
		                  <th>Browser</th>
		                  <th>Platform(s)</th>
		                  <th>Engine version</th>
		                  <th>CSS grade</th>
		                </tr>
		                </tfoot>
		              </table>
		              <nav aria-label="Page navigation">
						 <ul  class="pagination pagination-lg">
						    <li>
						      <a href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li><a href="#">1</a></li>
						    <li><a href="#">2</a></li>
						    <li><a href="#">3</a></li>
						    <li><a href="#">4</a></li>
						    <li><a href="#">5</a></li>
						    <li>
						      <a href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
		            </div>
		            <!-- /.box-body -->
		          </div>
		          <!-- /.box -->
		        </div>
		        <!-- /.col -->
		      </div>
		      <!-- /.row -->
		</section>
	<!-- /.content -->
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
