<%@page import="com.slg.zxgl.entity.Teacher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		List<Teacher> teas = (List<Teacher>) session.getAttribute("teas");
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
		}
		int allpages = teas != null ? (teas.size() / 10 + ((teas.size() % 10 == 0) ? 0 : 1)) : 0;
		if (pageNumber > allpages) {
			pageNumber = allpages;
		}
	%>
	<table width="95%">
		<tr align="center" height="25px">
			<th colspan="4">教职工信息</th>
		</tr>
		<tr align="center" height="25px">
			<td colspan="2"></td>
			<td colspan="2"><form action="manager/search.action"
					method="post">
					<input type="hidden" name="type" value="stu" /> <input
						type="search" name="word" /><input type="submit" value="搜索" />
				</form></td>
		</tr>
		<tr align="center" height="25px">
			<td width="10%">序号</td>
			<td width="20%">职工号</td>
			<td width="20%">姓名</td>
			<td width="20%">所带班级</td>
			<td width="10%">操作</td>
		</tr>
		<%
			if (teas != null) {
				for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= teas.size()) {
						break;
					}
					Teacher tea = teas.get(idx);
		%><tr align="center" height="25px">
			<td><%=i + 1%></td>
			<td><%=tea.getaccname()%></td>
			<td><%=tea.getName()%></td>
			<td><%=tea.getClassName()%></td>
			<td><a
				href="manager/update.action?action=show&type=tea&id=<%=tea.getId()%>"><button>修改</button></a></td>
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
			<th colspan="4">无教职工信息</th>
		</tr>
		<%
			}
		%>
	</table>
</div>