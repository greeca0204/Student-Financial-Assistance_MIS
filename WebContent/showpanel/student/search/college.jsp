<%@page import="com.slg.zxgl.entity.CollegeInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<table width="90%" style="margin-top: 50px" align="center">

		<tr align="center" height="30px">
			<td width="75%">学院</td>
		</tr>
		<%
			List<CollegeInfo> cs = (List<CollegeInfo>) session.getAttribute("colleges");
			int pageNumber = 1;
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch (Exception e) {
			}
			int allpages = cs != null ? cs.size() / 10 + ((cs.size() % 10 == 0) ? 0 : 1) : 0;
			if (pageNumber > allpages) {
				pageNumber = allpages;
			}
			if (cs != null) {
				for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= cs.size()) {
						break;
					}
					CollegeInfo c = cs.get(idx);
		%>
		<tr align="center" height="30px">
			<td><a href="student/show.action?type=college&id=<%=c.getId()%>"><%=c.getName()%></a></td>
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
			<td colspan="2" align="center" height="30px">没有任何信息</td>
		</tr>
		<%
			}
		%>
	</table>
</div>