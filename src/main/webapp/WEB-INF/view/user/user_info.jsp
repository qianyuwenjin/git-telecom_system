<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<html>
<head> 
  <%@include file="../../../include/incss.jsp"%>
  <link href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<%@include file="../../../include/inlink.jsp"%>
        <script type="text/javascript" src="${emp}/assets/js/jquery-3.4.1.min.js"></script> 
        <script type="text/javascript">
			$(function(){
				$("#csubmit").click(function(){
					$.post({
						url: '${emp}/updateAdminInform',
						data: $("#cForm").serialize(),
					    success : function(result){
					    	showResult(result);
					    }
					})
				})
			})
            //保存成功的提示信息
            function showResult(msg) {
				var emp;
				if("no" == msg){
					emp = "修改失败!";
				}else{
					emp = "修改成功!";
				}
				$("#save_result_info").text(emp);
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 4000);
            }
            function showResultDiv(flag) {
                if (flag)
                    $("#save_result_info").css("display","block");
                else
                	$("#save_result_info").css("display","none");
            }
        </script>
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
          <img src="assets/img/avatar5.png" class="img-circle" alt="User Image">
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
										<span>角色管理</span>
										<span class="pull-right-container">
											<span class="label label-primary pull-right">r</span>
										</span>
									</a>
									<ul class="treeview-menu">
										<li><a href="${emp}/selectRoles"><i class="fa fa-circle-o"></i> 查询角色</a></li>
										<li><a href="${emp}/role/AddPowers"><i class="fa fa-circle-o"></i> 增加角色</a></li>
										<li><a href="pages/layout/fixed.html"><i class="fa fa-circle-o"></i> 修改角色</a></li>
										<li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> 删除角色</a></li>
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
								<li class="active treeview" name="index">
									<a href="#">
									<i class="fa fa-circle-o text-aqua"></i>
										<span>个人信息</span>
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
        Personal Information
        <small>Hero</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>资费家园</a></li>
        <li class="active">欢迎━(*｀∀´*)</li>
      </ol>
    </section>
    
    <div style="margin: 55px;padding: 20px; background: #AAAAFF">
    	<div id="save_result_info" class="save_success" style="display: none"></div><!--保存失败，数据并发错误！-->
    	<form action="" method="" id="cForm">
		  <div class="form-group">
		    <label for="exampleInputPassword1">Administrator account</label>
		    <input type="text" class="form-control" style="background: #AAFF88" name="adminacname" value="${admin1.acname}" id="exampleInputPassword1" placeholder="Account" readonly>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Role</label>
		    <input type="text" class="form-control" style="background: #AAFF88" value="${admin1.rname}" id="exampleInputPassword1" placeholder="Role" readonly>
		  </div>	
		  <div class="form-group">
		    <label for="exampleInputPassword1">Name</label>
		    <input type="text" class="form-control" style="background: #FFFF88" name="adminname" value="${admin1.aname}" id="exampleInputPassword1" placeholder="Name">
		  </div>	
		  <div class="form-group">
		    <label for="exampleInputPassword1">Phone</label>
		    <input type="text" class="form-control" style="background: #FFFF88" name="adminphone" value="${admin1.aphone }" id="exampleInputPassword1" placeholder="Phone">
		  </div>				  
		  <div class="form-group">
		    <label for="exampleInputEmail1">Email address</label>
		    <input type="email" class="form-control" style="background: #FFFF88" name="adminemail" value="${admin1.aemail}" id="exampleInputEmail1" placeholder="Email">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Create date</label>
		    <input type="text" class="form-control" style="background: #AAFF88" value="${admin1.createTime}" id="exampleInputPassword1" placeholder="Date" readonly>
		  </div>	
		  <div align="center" style="margin: 20px">
			  	<button type="submit" class="btn btn-primary btn-lg active" id="csubmit" >Submit</button>&nbsp&nbsp&nbsp
			  	<button type="button" class="btn btn-primary btn-lg active" id="">Cancel</button>
		  </div>
		  <input type="hidden" name="adminid" value="${admin1.aid}"/>
		</form>
    </div>
</body>
</html>
