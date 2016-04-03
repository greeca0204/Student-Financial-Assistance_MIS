<%@page import="com.slg.zxgl.entity.GradeInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div align="center" style="margin-top: 30px">
	<table width="90%">
		<tr>
			<td width="20%"><a
				href="manager/search.action?action=return&type=grade">返回</a></td>
			<td width="80%" align="center">年级详细内容</td>
		</tr>
	</table>
	<%
		GradeInfo info = (GradeInfo) session.getAttribute("show");
		if (info != null) {
	%>
	<table width="90%">
		<tr height="30px" align="center">
			<td>年级名称</td>
			<td><%=info.getName()%></td>
		</tr>
		<tr height="30px" align="center">
			<td>年级简介</td>
			<td><%=info.getDescription()%></td>
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