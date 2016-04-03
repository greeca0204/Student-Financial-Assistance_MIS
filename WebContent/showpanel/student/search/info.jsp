<%@page import="com.slg.zxgl.entity.Message"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
%>
<div>
	<table width="90%" style="margin-top: 50px" align="center">

		<tr align="center" height="30px">
			<td width="75%">标题</td>
			<td>时间</td>
		</tr>
		<%
			List<Message> ms = (List<Message>) session.getAttribute("msgs");
			List<Message> myms = (List<Message>) session.getAttribute("mymsgs");
			int pageNumber = 1;
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch (Exception e) {
			}
			int allnumber = ((ms != null) ? ms.size() : 0) + ((myms != null) ? myms.size() : 0);
			int allpages = allnumber / 10 + ((allnumber % 10 == 0) ? 0 : 1);
			if (pageNumber > allpages) {
				pageNumber = allpages;
			}
			if (ms != null) {

				for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >=  ms.size()) {
						break;
					}
					 Message m =  ms.get(idx);
		%>
		<tr align="center" height="30px">
			<td><a href="student/show.action?type=info&id=<%=m.getId()%>"><%=m.getTitle()%></a></td>
			<td><%=df.format(m.getAddtime().getTime())%></td>
		</tr>
		<%
			}
				if (myms != null) {
					for (Message m : myms) {
		%>
		<tr align="center" height="30px">
			<td><a href="student/show.action?type=info&id=<%=m.getId()%>"><%=m.getTitle()%></a></td>
			<td><%=df.format(m.getAddtime().getTime())%></td>
		</tr>
		<%
			}
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