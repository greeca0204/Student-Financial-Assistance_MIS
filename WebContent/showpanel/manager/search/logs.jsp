<%@page import="com.slg.zxgl.entity.AdminLog"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		List<AdminLog> logs = (List<AdminLog>) session.getAttribute("logs");
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
		}
		int allpages = logs != null ? (logs.size() / 10 + ((logs.size() % 10 == 0) ? 0 : 1)) : 0;
		if (pageNumber > allpages) {
			pageNumber = allpages;
		}
	%>
	<table width="95%">
		<tr align="center" height="25px">
			<th colspan="4">日志简要信息</th>
		</tr>
		<tr align="center" height="25px">
			<td colspan="2"></td>
			<td colspan="2"><form action="manager/search.action"
					method="post">
					<input type="hidden" name="type" value="info" /> <input
						type="search" name="word" /><input type="submit" value="搜索" />
				</form></td>
		</tr>
		<tr align="center" height="25px">
			<td width="10%">序号</td>
			<td width="30%">管理员名称</td>
			<td width="30%">操作内容</td>
			<td width="30%">时间</td>
		</tr>
		<%
			if (logs != null) {
				for (int i = 0; i < 10; i++) {
					int idx = i + (pageNumber - 1) * 10;
					if (idx >= logs.size()) {
						break;
					}
					AdminLog log = logs.get(idx);
		%><tr align="center" height="25px">
			<td width="10%"><%=i + 1%></td>
			<td width="30%"><%=log.getAdminname()%></td>
			<td width="30%"><a
				href="manager/search.action?action=show&type=log&id=<%=idx%>"><%=log.getOperation() != null ? log.getOperation().substring(0,
							log.getOperation().length() >= 10 ? 10 : log.getOperation().length()) : ""%>...</a></td>
			<td width="30%"><%=log.getOpttime().toString().substring(0, 10)%></td>
		</tr>
		<%
			}
		%><tr>
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
		<%
			} else {
		%><tr align="center" height="25px">
			<th colspan="4">暂无任何日志</th>
		</tr>
		<%
			}
		%>
	</table>
</div>