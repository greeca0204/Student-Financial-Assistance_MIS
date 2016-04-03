<%@page import="com.slg.zxgl.entity.CollegeInfo"%>
<%@page import="com.slg.zxgl.entity.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
	CollegeInfo show = (CollegeInfo) session.getAttribute("show");
		if (show != null) {
	%><table width="95%">
		<tr>
			<td><a href="teacher/show.action?action=return&type=college">返回</a></td>
			<th>学院详细信息</th>
		</tr>
		<tr>
			<td>学院名称</td><td width="80%"><%=show.getName()%></td>
		</tr>
		<tr>
			<td>学院简称</td><td width="80%"><%=show.getShortname()%></td>
		</tr>
		<tr>
			<td>学院描述</td><td width="80%"><%=show.getDescription()%></td>
		</tr>
	</table>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>