<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	pageContext.setAttribute("emp",request.getContextPath());
    %>
	<div id="header">
	    <img src="${emp}/assets/images/logo.png" alt="logo" class="left"/>
	    <img style="width:50px;height:60px;" src="${emp}${admin1.aimg}"/>
	    <a>管理员:  ${admin1.aname}</a> 	                          
	</div> 
	<div align="right"> 
	    <a href="${emp}/login.jsp"><font color="white" size="4">[退出]</font></a>
	</div>
