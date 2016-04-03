<%@page import="com.slg.zxgl.entity.ApplicationInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.slg.zxgl.entity.Message"%>
<%@page import="com.slg.zxgl.entity.Poorinfo"%>
<%@page import="com.slg.zxgl.entity.Student"%>
<%@page import="com.slg.zxgl.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<table width="90%" style="margin-top: 50px" align="center">
		<%
			List<ApplicationInfo> apps = (List<ApplicationInfo>) session.getAttribute("appliactions");
			int pageNumber = 1;
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch (Exception e) {
			}
			int allpages = apps != null ? apps.size() / 10 + ((apps.size() % 10 == 0) ? 0 : 1) : 0;
			if (pageNumber > allpages) {
				pageNumber = allpages;
			}
			if (apps != null) {
		%><tr align="center">
			<td>申请项目名字</td>
			<td>申请状态</td>
		</tr>
		<%
			for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= apps.size()) {
						break;
					}
					ApplicationInfo app = apps.get(idx);
		%><tr align="center">
			<td><%=app.getName()%></td>
			<td>
				<%
					switch (app.getCheck()) {
							case 0:
				%>未审核<%
					break;
							case 1:
				%>审核通过<%
					break;
							case 2:
				%>审核未通过<%
					break;
							default:
				%>未知状态<%
					break;
							}
				%>
			</td>
		</tr>
		<%
			}
		%><tr>
			<td colspan="5" align="right"><a
				href="student.jsp?pageNumber=<%=pageNumber - 1%>"><input
					value="上一页 " type="button" <%if (pageNumber <= 1) {%>
					disabled="disabled" <%}%> /></a>|<input type="text"
				value="<%=pageNumber%>/<%=allpages%>" size="2"
				style="text-align: center" disabled="disabled" /> |<a
				href="student.jsp?pageNumber=<%=pageNumber + 1%>"><input
					value="下一页 " <%if (pageNumber >= allpages) {%> disabled="disabled"
					<%}%> type="button" /></a></td>
		</tr>
		<%
			} else {
		%><tr>
			<td colspan="2">没有任何申请</td>
		</tr>
		<%
			}
		%>
	</table>
</div>