<%@page import="com.slg.zxgl.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<style type="text/css">
div#container {
	width: 900px;
	margin: 10px;
}

div#top {
	background-color: #99bbbb;
}

div#login {
	background-color: #ffff99;
	height: 470px;
	width: 900px;
	float: left;
}

div#footer {
	background-color: #99bbbb;
	clear: both;
	text-align: center;
}
</style>
<title>欢迎使用广东理工职业学院助学系统</title>
</head>
<body>
	<center>
		<div id="container">

			<div id="top" align="left">
				<jsp:include page="/commons/top.jsp" />
			</div>
			<div id="login">
				<div style="margin: 100px"><jsp:include page="/commons/loginPanel.jsp" /></div>
				
			</div>
			<div id="footer">
				<jsp:include page="/commons/buttom.jsp" />
			</div>
			<%
				User u = (User) session.getAttribute("user");
				if (u != null) {
					switch (u.getUserType()) {
					case 0:
						response.setHeader("Refresh", "0;URL=manager.jsp");
						break;
					case 1:
						response.setHeader("Refresh", "0;URL=student.jsp");
						break;
					case 2:
						response.setHeader("Refresh", "0;URL=teacher.jsp");
						break;
					}
				}
			%>
		</div>
	</center>
</body>
</html>
