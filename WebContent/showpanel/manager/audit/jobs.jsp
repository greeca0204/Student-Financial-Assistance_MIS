<%@page import="com.slg.zxgl.entity.JobApplication"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<%
		List<JobApplication> jobs = (List<JobApplication>) session.getAttribute("jobs");
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
		}
		int allpages = jobs != null ? (jobs.size() / 10 + ((jobs.size() % 10 == 0) ? 0 : 1)) : 0;
		if (pageNumber > allpages) {
			pageNumber = allpages;
		}
		if (jobs != null) {
	%>
	<table align="center" width="95%" style="margin-top: 10px">
		<tr height="25px">
			<th colspan="5" align="center">助学金项目申请情况</th>
		</tr>
		<tr height="25px">
			<td width="10%">序号</td>
			<td width="30%">岗位名称</td>
			<td width="20%">学生学号</td>
			<td width="20%">学生信息</td>
			<td width="20%">审核状态</td>
		</tr>
		<%
			for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= jobs.size()) {
						break;
					}
					JobApplication shipapp = jobs.get(idx);
		%>
		<tr height="25px">
			<td width="10%"><%=i + 1%></td>
			<td width="30%"><%=shipapp.getAppName()%></td>
			<td width="20%"><%=shipapp.getStuAccname()%></td>
			<td width="20%"><%=shipapp.getStuName()%></td>
			<td width="20%">
				<%
					if (shipapp.isCheck()) {
				%><%=shipapp.getStatus()%> <%
 	} else {
 %><a href="manager/audit.action?type=job&action=show&id=<%=idx%>">进入审核</a>
				<%
					}
				%>
			</td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="5" align="right"><a
				href="manager.jsp?pageNumber=<%=pageNumber - 1%>"><input
					value="上一页 " type="button" <%if (pageNumber <= 1) {%>
					disabled="disabled" <%}%> /></a>|<input type="text"
				value="<%=pageNumber%>/<%=allpages%>" size="2"
				style="text-align: center" disabled="disabled" /> |<a
				href="manager.jsp?pageNumber=<%=pageNumber + 1%>"><input
					value="下一页 " <%if (pageNumber >= allpages) {%> disabled="disabled"
					<%}%> type="button" /></a></td>
		</tr>
	</table>
	<%
		}
	%>
</div>