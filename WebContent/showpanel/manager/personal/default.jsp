<%@page import="com.slg.zxgl.entity.Teacher"%>
<%@page import="com.slg.zxgl.entity.Manager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Manager t = (Manager) session.getAttribute("user");
%>
<c:if test="${user!=null }">
	<div>
		<table
			style="vertical-align: middle; margin-left: 280px; margin-top: 160px;">
			<tr align="center">
				<td>管理员账号</td>
				<td><%=t.getaccname()%></td>
			</tr>
			<tr align="center">
				<td>姓&nbsp;&nbsp;&nbsp;名</td>
				<td><%=t.getName()%></td>
			</tr>

			<tr align="center">
				<td colspan="2"><a
					href="manager/personal.action?action=password">修改密码</a></td>
			</tr>
		</table>
	</div>
</c:if>