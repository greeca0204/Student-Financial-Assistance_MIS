<%@page import="com.slg.zxgl.entity.GradeInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
	GradeInfo grade = (GradeInfo) session.getAttribute("show");
		if (grade != null) {
	%><table width="95%">
		<tr>
			<td><a href="teacher/show.action?action=return&type=grade">返回</a></td>
			<th>年级详细信息</th>
		</tr>
		<tr>
			<td>年级名称</td><td width="80%"><%=grade.getName()%></td>
		</tr>
		<tr>
			<td>年级介绍</td><td width="80%"><%=grade.getDescription()%></td>
		</tr>
	</table>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>