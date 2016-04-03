<%@page import="com.slg.zxgl.entity.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
	Message msg = (Message) session.getAttribute("show");
		if (msg != null) {
	%><table width="95%">
		<tr>
			<td><a href="manager/search.action?action=return&type=info">返回</a></td>
			<th>通知详细信息</th>
		</tr>
		<tr>
			<td>标题</td><td width="80%"><%=msg.getTitle()%></td>
		</tr>
		<tr>
			<td>内容</td><td width="80%"><%=msg.getDetails()%></td>
		</tr>
		<tr>
			<td>时间</td><td width="80%"><%=msg.getAddtime()%></td>
		</tr>
	</table>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>