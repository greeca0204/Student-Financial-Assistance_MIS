<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<table>
	<tr>
		<td width="10%"><a href="<%=basePath %>index.jsp" title="主页"><img
				src="<%=basePath %>/images/logo.png" /></a></td>
		<td width="85%"><h1>广东理工职业学院助学系统</h1></td>
	</tr>
</table>

