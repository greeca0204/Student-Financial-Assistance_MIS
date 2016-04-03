<%@page import="com.slg.zxgl.entity.CollegeInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div align="center" style="margin-top: 30px">
	<table width="90%">
		<tr>
			<td width="20%"><a
				href="manager/search.action?action=return&type=college">返回</a></td>
			<td width="80%" align="center">学院详细内容</td>
		</tr>
	</table>
	<%
		CollegeInfo info = (CollegeInfo) session.getAttribute("show");
		if (info != null) {
	%>
	<table width="90%">
		<tr height="30px" align="center">
			<td>学院名称</td>
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