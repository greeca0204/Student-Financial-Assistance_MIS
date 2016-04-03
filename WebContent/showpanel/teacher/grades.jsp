<%@page import="com.slg.zxgl.entity.GradeInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		List<GradeInfo> grades = (List<GradeInfo>) session.getAttribute("grades");
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
		}
		int allpages = grades != null ? (grades.size() / 10 + ((grades.size() % 10 == 0) ? 0 : 1)) : 0;
		if (pageNumber > allpages) {
			pageNumber = allpages;
		}
	%>
	<table width="95%">
		<tr align="center" height="25px">
			<th colspan="4">通知信息</th>
		</tr>
		<tr align="center" height="25px">
			<td colspan="2"></td>
			<td colspan="2"><form action="teacher/search.action"
					method="post">
					<input type="hidden" name="type" value="stu" /> <input
						type="search" name="word" /><input type="submit" value="搜索" />
				</form></td>
		</tr>
		<tr align="center" height="25px">
			<td width="10%">序号</td>
			<td width="30%">标题</td>
			<td width="30%">部分内容</td>
			<td width="30%">时间</td>
		</tr>
		<%
			if (grades != null) {

				for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >=  grades.size()) {
						break;
					}
					 GradeInfo gr =  grades.get(idx);
		%><tr align="center" height="25px">
			<td width="10%"><%=i + 1%></td>
			<td width="30%"><a
				href="teacher/show.action?type=grade&id=<%=idx%>"><%=gr.getName()%></a></td>
			<td width="30%"><%=gr.getDescription().substring(0, gr.getDescription().length() > 10
							? 10 : gr.getDescription().length())%></td>
		</tr>
		<%
			}
		%><tr>
			<td colspan="5" align="right"><a
				href="teacher.jsp?pageNumber=<%=pageNumber - 1%>"><input
					value="上一页 " type="button" <%if (pageNumber <= 1) {%>
					disabled="disabled" <%}%> /></a>|<input type="text"
				value="<%=pageNumber%>/<%=allpages%>" size="2"
				style="text-align: center" disabled="disabled" /> |<a
				href="teacher.jsp?pageNumber=<%=pageNumber + 1%>"><input
					value="下一页 " <%if (pageNumber >= allpages) {%> disabled="disabled"
					<%}%> type="button" /></a></td>
		</tr>
		<%
			} else {
		%><tr align="center" height="25px">
			<th colspan="4">无年级信息</th>
		</tr>
		<%
			}
		%>
	</table>
</div>