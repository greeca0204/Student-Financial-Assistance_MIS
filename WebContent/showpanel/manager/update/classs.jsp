<%@page import="com.slg.zxgl.entity.ClassInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		List<ClassInfo> classs = (List<ClassInfo>) session.getAttribute("classs");
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
		}
		int allpages = classs != null ? (classs.size() / 10 + ((classs.size() % 10 == 0) ? 0 : 1)) : 0;
		if (pageNumber > allpages) {
			pageNumber = allpages;
		}
	%>
	<table width="95%">
		<tr align="center" height="25px">
			<th colspan="5">班级信息</th>
		</tr>
		<tr align="center" height="25px">
			<td colspan="2"></td>
			<td colspan="3"><form action="manager/delete.action"
					method="post">
					<input type="hidden" name="type" value="class" /> <input
						type="search" name="word" /><input type="submit" value="搜索" />
				</form></td>
		</tr>
		<tr align="center" height="25px">
			<td width="10%">序号</td>
			<td width="25%">班级名称</td>
			<td width="25%">班级简称</td>
			<td width="25%">班级简介</td>
			<td width="10%" align="center">操作</td>
		</tr>
		<%
			if (classs != null) {
				for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= classs.size()) {
						break;
					}
					ClassInfo cls = classs.get(idx);
		%><tr align="center" height="25px">
			<td><%=i + 1%></td>
			<td><%=cls.getName()%></td>
			<td><%=cls.getShortname()%></td>
			<td><%=cls.getDescription().length() > 10 ? cls.getDescription().substring(0, 10)
							: cls.getDescription()%>...</td>
			<td><a
				href="manager/update.action?action=show&type=class&classid=<%=cls.getId()%>"><button>修改</button></a></td>
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
		<%
			} else {
		%><tr align="center" height="25px">
			<th colspan="4">无可删除的班级信息</th>
		</tr>
		<%
			}
		%>
	</table>
</div>