<%@page import="com.slg.zxgl.entity.ClassInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div align="center" style="margin-top: 30px">
	<table width="90%">
		<tr>
			<td width="20%"><a
				href="manager/search.action?action=return&type=class">返回</a></td>
			<td width="80%" align="center">班级详细内容</td>
		</tr>
	</table>
	<%
		ClassInfo info = (ClassInfo) session.getAttribute("show");
		if (info != null) {
	%>
	<table width="90%">
		<tr height="30px" align="center">
			<td>班级名称</td>
			<td><%=info.getName()%></td>
		</tr>
		<tr height="30px" align="center">
			<td>简称</td>
			<td><%=info.getShortname()%></td>
		</tr>
		<tr height="30px" align="center">
			<td>简介</td>
			<td><%=info.getDescription()%></td>
		</tr>
		<tr height="30px" align="center">
			<td>所在年级</td>
			<td><%=info.getGradename()%></td>
		</tr>
		<tr height="30px" align="center">
			<td>所在专业</td>
			<td><%=info.getMajorname()%></td>
		</tr>
		<tr height="30px" align="center">
			<td>所在学院</td>
			<td><%=info.getCollegename()%></td>
		</tr>
		<%
			} else {
		%>
		<tr align="center">
			<td colspan="2">系统错误</td>
		</tr>
		<%
			}
		%>
	</table>
</div>