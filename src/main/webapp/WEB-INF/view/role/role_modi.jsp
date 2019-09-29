<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <%@include file="../../../include/incss.jsp"%>
    	<%
    	pageContext.setAttribute("emp",request.getContextPath());
        %> 
        <%@include file="../../../include/inlink.jsp"%>
        <script type="text/javascript" src="${emp}/assets/js/jquery-3.4.1.min.js"></script> 
        <script language="javascript" type="text/javascript">
      //保存成功的提示消息
        $(function(){
       	 if('${ook}' != ''){
           	 showResult();
            }
     	     $("#esubmit").click(function(){
     		      $("#eForm").submit();
     	     })
       })
       function showResult(){
       	showResultDiv(true);
           window.setTimeout("showResultDiv(false);", 3000);
       }
       function showResultDiv(flag) {
           if(flag){
        	   $("#save_result_info").css("display","block");
        	  location.href="${pageContext.request.contextPath}/selectRoles";
           }else{
        	   $("#save_result_info").css("display","none");
           }
        }
   </script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
	<%@include file="../../../include/injs.jsp"%>
  <aside class="main-sidebar">
    <section class="sidebar">   
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
      			<!-- 系统栏 -->
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
										<span>角色管理</span>
									</a>
									<ul class="treeview-menu">
										<li><a href="${emp}/selectRoles"><i class="fa fa-circle-o"></i> 查询角色</a></li>
										<li class="active"><a href="${emp}/role/AddPowers"><i class="fa fa-circle-o"></i> 增加角色</a></li>
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
										<li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i> 增加管理员</a></li>
										<li><a href="pages/layout/fixed.html"><i class="fa fa-circle-o"></i> 修改管理员</a></li>
										<li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> 删除管理员</a></li>
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
  </aside>

    <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Home Page
        <small>Hreo</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="glyphicon glyphicon-envelope"></i>资费家园</a></li>
        <li class="active">欢迎━(*｀∀´*)</li>
      </ol>
    </section> 
    
        <div id="main" style="margin: 60px;padding: 50px;background: #AAFFFF">    
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success" style="display: none">${ook}</div><!--保存失败，角色名称重复！-->
            <form action="${emp}/updateRole" id="eForm" method="post" class="main_form">
                <div class="text_info clearfix"><span>角色名称：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" name="rolename" value="${role.rname}"/>
                    <span class="required"></span>
                    <div class="validate_msg_medium"></div>
                </div>                    
               <div class="text_info clearfix"><span>设置权限：</span></div>
                <div class="input_info_high">
                    <div class="input_info_scroll">
                        <ul>
                           <c:forEach items="${powerlist}" var="po">
                            	<li><input type="checkbox" name="powername" value="${po.pid}" 
                            	     <c:forEach items="${role.lp}" var="p">
                            	          <c:if test="${po.pid == p.pid}">
                            	              checked="checked";
                            	          </c:if>
                            	     </c:forEach>
                            	/>${po.pname}</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <span class="required"></span>
                    <div class="validate_msg_tiny"></div>
                </div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn btn-success" id="esubmit" />
                    <input type="button" value="取消" class="btn btn-success" />
                </div>
                <input type="hidden" name="aname" value="${admin.aname}"/>
                <input type="hidden" name="rid" value="${role.rid}"/>
            </form>
        </div>
	</body>
</html>
