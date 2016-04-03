<%@page import="com.slg.zxgl.entity.MajorInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
	MajorInfo major = (MajorInfo) session.getAttribute("show");
		if (major != null) {
	%><table width="95%">
		<tr>
			<td><a href="teacher/show.action?action=return&type=major">返回</a></td>
			<th>专业详细信息</th>
		</tr>
		<tr>
			<td>专业名称</td><td width="80%"><%=major.getName()%></td>
		</tr>
		<tr>
			<td>专业简称</td><td width="80%"><%=major.getShortname()%></td>
		</tr>
		<tr>
			<td>专业简介</td><td width="80%"><%=major.getDescription()%></td>
		</tr>
	</table>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>