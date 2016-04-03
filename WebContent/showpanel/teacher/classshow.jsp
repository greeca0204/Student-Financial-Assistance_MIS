<%@page import="com.slg.zxgl.entity.ClassInfo"%>
<%@page import="com.slg.zxgl.entity.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
	ClassInfo cls = (ClassInfo) session.getAttribute("show");
		if (cls != null) {
	%><table width="95%">
		<tr>
			<td><a href="teacher/show.action?action=return&type=class">返回</a></td>
			<th>班级详细信息</th>
		</tr>
		<tr>
			<td>班级名称</td><td width="80%"><%=cls.getName()%></td>
		</tr>
		<tr>
			<td>班级简称</td><td width="80%"><%=cls.getShortname()%></td>
		</tr>
		<tr>
			<td>班级简介</td><td width="80%"><%=cls.getDescription()%></td>
		</tr>
		<tr>
			<td>所在学院</td><td width="80%"><%=cls.getCollegename()%></td>
		</tr>
		<tr>
			<td>所在年级</td><td width="80%"><%=cls.getGradename()%></td>
		</tr>
		<tr>
			<td>坐在专业</td><td width="80%"><%=cls.getMajorname()%></td>
		</tr>
	</table>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>