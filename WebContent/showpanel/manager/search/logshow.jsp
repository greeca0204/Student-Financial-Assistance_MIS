<%@page import="com.slg.zxgl.entity.AdminLog"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<div align="center" style="margin-top: 30px">
		<table width="90%">
			<tr>
				<td width="20%"><a
					href="manager/search.action?action=return&type=log">返回</a></td>
				<td width="80%" align="center">日志详情</td>
			</tr>
		</table>
	</div>
	<%
	AdminLog log = (AdminLog) session.getAttribute("show");

		if (log != null) {
	%>
	<table align="center" width="90%" style="margin-top: 30px">
		<tr height="30px">
			<td width="20%">管理员</td>
			<td><%=log.getAdminname()%></td>
		</tr>
		<tr height="30px">
			<td width="20%">操作</td>
			<td><%=log.getOperation()%></td>
		</tr>
		<tr height="30px">
			<td width="20%">操作时间</td>
			<td><%=log.getOpttime()%></td>
		</tr>
	</table>
	<%
		} else {
			session.setAttribute("result", "search_log");
	%>
	<table align="center" width="90%" style="margin-top: 100px">
		<tr align="center" height="30px">
			<td>系统错误</td>
		</tr>
	</table>
	<%
		}
	%>
</div>