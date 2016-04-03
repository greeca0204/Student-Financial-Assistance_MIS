<%@page import="com.slg.zxgl.entity.Poorinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Poorinfo p = (Poorinfo) session.getAttribute("poorinfo");
	if (p != null) {
%>
<div>
	<table width="90%" style="margin-top: 50px" align="center" border="1">
		<tr align="center" height="40px">
			<td>家庭人数</td>
			<td><%=p.getHomepeople()%>(人)</td>
		</tr>
		<tr align="center" height="40px">
			<td>家庭年收入</td>
			<td><%=p.getHomeincome()%>(元)</td>
		</tr>
		<tr align="center" height="40px">
			<td>贫困生等级</td>
			<td><%=p.getPoorgrade()%></td>
		</tr>
		<tr align="left" height="40px">
			<td colspan="2">等级说明:1、一般困难；2、困难；3、特殊困难.</td>
		</tr>
		<tr align="center" height="40px">
			<td colspan="2"><a href="student/personal.action?action=search">返回个人资料</a></td>
		</tr>
	</table>
</div>
<%
	}else{
		%><center>你不是平困生</center><%
	}
%>