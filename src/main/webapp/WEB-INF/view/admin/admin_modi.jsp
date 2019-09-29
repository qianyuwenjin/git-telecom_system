<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>王贵文</title>
        <%
    	pageContext.setAttribute("emp",request.getContextPath());
        %> 
        <%@include file="../../../include/inlink.jsp"%>
        <script type="text/javascript" src="${emp}/assets/js/jquery-3.4.1.min.js"></script>
        <script language="javascript" type="text/javascript">
            //保存成功的提示消息
            $(function(){
            	if('${emp}' != ''){
            		showResult();
            	}
            	$("#gsubmit").click(function(){
            		$("#gForm").submit();
            	})           	
            })
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                if(flag){     
                	$("#save_result_info").css("display","block");
                    location.href="${pageContext.request.contextPath}/sau/SelectAdminUsers.et";
                }else{
                	$("#save_result_info").css("display","none");
                }
            }
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <%@include file="../../../include/menu.jsp"%>
        <div id="navi">
            <ul id="menu">
                <c:forEach items="${admin1.lip}" var="power">
	                <c:choose>
	                    <c:when test="${power.pclass=='admin'}">
	                    	<li><a href="${emp}${power.purl}" class="admin_on"></a></li>
	                    </c:when>	                    
	                    <c:otherwise>
	                    	<li><a href="${emp}${power.purl}" class="${power.pclass}_off"></a></li>
	                    </c:otherwise>
	                </c:choose>   
                </c:forEach>   
            </ul>
 		</div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <div id="save_result_info" class="save_success" style="display:none">${emp}</div>
            <form action="${emp}/aus/UpdateAdminUserServlet.et" method="post" class="main_form" enctype="multipart/form-data" id="gForm">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" name="adminuseraname" value="${adminuser.aname}"/>
                        <span class="required"></span>
                        <div class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info">
                        <input type="text" name="adminuseracname" value="${adminuser.acname}" />
                        <span class="required"></span>
                        <div class="validate_msg_long"></div>
                    </div>                   
					<div class="text_info clearfix"><span>上传头像</span></div>
                    <div class="input_info">
                        <img style="width:30px;height:30px;" src="${emp}${adminuser.aimg}"/>
                        <input type="file" name="adminuserimg"/>
                        <span class="required"></span>
                        <div class="validate_msg_long"></div>
                    </div>  
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="adminuseraphone" value="${adminuser.aphone}"/>
                        <span class="required"></span>
                        <div class="validate_msg_medium"></div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="adminuseraemail" value="${adminuser.aemail}"/>
                        <span class="required"></span>
                        <div class="validate_msg_medium"></div>
                    </div>
                    <div class="text_info clearfix"><span>角色：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                            <ul>
	                            <c:forEach items="${role}" var="r">
	                            	<li><input type="checkbox" name="adminuserrolename" value="${r.rid}"
	                            	     <c:forEach items="${adminuser.lir}" var="lr">
	                            	         <c:if test="${r.rid == lr.rid}">
	                            	             checked="checked";
	                            	         </c:if>
	                            	     </c:forEach>
	                            	/>${r.rname}</li>
	                            </c:forEach>       
                            </ul>
                        </div>
                        <span class="required"></span>
                        <div class="validate_msg_tiny"></div>
                    </div>
                    <div class="button_info clearfix">
                        <input type="button" value="保存" class="btn_save" id="gsubmit" />
                        <input type="button" value="取消" class="btn_save" />
                    </div>
                    <input type="hidden" name="dlname" value="${admin.aname}"/>
                    <input type="hidden" name="adminuseraid" value="${adminuser.aid}"/>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
    