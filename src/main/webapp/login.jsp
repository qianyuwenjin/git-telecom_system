<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ch">
<head>
    <meta charset="utf-8">
    <title>电信资费系统</title>
    <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
    <meta name="author" content="Wen Jin" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" media="screen" href="assets/css/login.css">
    
    <% pageContext.setAttribute("emp",request.getContextPath());%> 
    <%@include file="../../include/inlink.jsp"%>
    <script type="text/javascript" src="${emp}/assets/js/jquery-3.4.1.min.js"></script> 
    <script type="text/javascript">
          $(function(){
        	  $("#asubmit").click(function(){
        		  $("#adminForm").submit();
        	  })
        	 /*  $("#imgv").click(function(){
        		  var date = new Date(+new Date()+8*3600*1000).toISOString().replace(/T/g,' ').replace(/\.[\d]{3}Z/,''); 
        		  $(this).attr("src","${emp}/code?date="+date);
        	  }) */
        	  if('${adminError}' != ''){
	            	 showResult();
	             }  
	        })
	        
	        function showResult(){
	        	showResultDiv(true);
             window.setTimeout("showResultDiv(false);", 3000);
	        }
	        function showResultDiv(emp){
	        	if(emp){
	        		$("#dlError").css("display","block");
	        	}else{
	        		$("#dlError").css("display","none");
	        	}
	        }
    </script>
</head>
<body>
    <!-- particles.js container -->
    <div id="particles-js" style="display: flex;align-items: center;justify-content: center">
    </div>
    <form action="loginAdmin" method="post" id="adminForm">
	    <div class="login-page">
	        <div class="login-content">
	            <div class="login-tit">电信资费系统</div>
	            <div class="login-input">
	                <input type="text" name="acname" id="admincname" placeholder="用户名">
	            </div>
	            <div class="login-input">
	                <input type="password" name="apwd" placeholder="密码">
	            </div>
	            <div class="login-btn">
	                <div class="login-btn-left">
	                    <a href="#" id="asubmit"><span>登录</span></a>
	                </div>
	                <div class="login-btn-right" onclick="changeImg()">
	                    <img src="assets/img/check.png" alt="" id="picture"> 记住密码
	                </div>
	                <div>
	    				<span class="required" id="dlError" style="display: none">${adminError}</span>
	    			</div>
	            </div>
	        </div>
	    </div>
    </form>
	<!-- scripts -->
    <script src="assets/js/particles.js"></script>
    <script src="assets/js/app.js"></script>
    <script>
        function changeImg() {
            let pic = document.getElementById('picture');
            console.log(pic.src)
            if (pic.getAttribute("src", 2) == "assets/img/check.png") {
                /* pic.src = "assets/img/checked.png" */
            } else {
                pic.src = "assets/img/check.png"
            }
        }
    </script>

</body>
</html>
