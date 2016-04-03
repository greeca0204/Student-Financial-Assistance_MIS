<%@page import="com.slg.zxgl.entity.Student"%>
<%@page import="com.slg.zxgl.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Student s = (Student) session.getAttribute("user");
%>
<c:if test="${user!=null }">
	<div>
		<table width="90%" style="margin-top: 50px" align="center"
			border="1" >
			<tr align="center" height="40px">
				<td>学&nbsp;&nbsp;号</td>
				<td><c:out value="<%=s.getaccname()%>" /></td>
			</tr>
			<tr align="center" height="40px">
				<td>姓&nbsp;&nbsp;名</td>
				<td><c:out value="<%=s.getName()%>" /></td>
			</tr>
			<tr align="center" height="40px">
				<td>性&nbsp;&nbsp;别</td>
				<td>
					<%
						if ("M".equals(s.getGender())) {
					%>男<%
						} else {
					%>女<%
						}
					%>
				</td>
			</tr>
			<tr align="center" height="40px">
				<td>民&nbsp;&nbsp;族</td>
				<td><%=s.getNationlity()%></td>
			</tr>
			<tr align="center" height="40px">
				<td>身份证</td>
				<td><%=s.getIdentification()%></td>
			</tr>
			<tr align="center" height="40px">
				<td>联系方式</td>
				<td><%=s.getPhone()%></td>
			</tr>
			<tr align="center" height="40px">
				<td>地&nbsp;&nbsp;址</td>
				<td><c:out value="<%=s.getAddress()%>" /></td>
			</tr>
			<tr align="center" height="40px">
				<td>所在班级</td>
				<td><c:out value="<%=s.getClassname()%>" /></td>
			</tr>
			<tr align="center" height="40px">
				<td><a href="student/personal.action?action=poorinfo">查看个人贫困资料</a></td>
				<td><a href="student/personal.action?action=password">修改密码</a></td>
			</tr>
		</table>
	</div>
</c:if>