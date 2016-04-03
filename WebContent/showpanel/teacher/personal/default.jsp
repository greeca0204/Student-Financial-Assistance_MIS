<%@page import="com.slg.zxgl.entity.Teacher"%>
<%@page import="com.slg.zxgl.entity.Manager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Teacher m = (Teacher) session.getAttribute("user");
%>
<c:if test="${user!=null }">
	<div title="默认个人信息界面">
		<table width="70%" style="margin-top: 60px" align="center">
			<tr align="center" height="40px">
				<td>账&nbsp;&nbsp;号</td>
				<td><%=m.getaccname()%></td>
			</tr>
			<tr align="center" height="40px">
				<td>姓&nbsp;&nbsp;名</td>
				<td><%=m.getName()%></td>
			</tr>
			<tr align="center" height="40px">
				<td>部&nbsp;&nbsp;门</td>
				<td><%=m.getDepartment()%></td>
			</tr>
			<tr align="center" height="40px">
				<td>职&nbsp;&nbsp;位</td>
				<td><%=m.getPosition()%></td>
			</tr>
			<tr align="center" height="40px">
				<td>职&nbsp;&nbsp;称</td>
				<td><%=m.getPositiontitle()%></td>
			</tr>
			<tr align="center" height="40px">
				<td>联系方式</td>
				<td><%=m.getPhone()%></td>
			</tr>
			<tr align="center" height="40px">
				<td>邮&nbsp;&nbsp;箱</td>
				<td><%=m.getEmail()%></td>
			</tr>
			<tr align="center" height="40px">
				<td>所带班级</td>
				<td><%=m.getClassName()%></td>
			</tr>

			<tr align="center" height="40px">
				<td align="center" colspan="2"><a
					href="teacher/personal.action?action=password">修改密码</a></td>
			</tr>
		</table>
	</div>
</c:if>