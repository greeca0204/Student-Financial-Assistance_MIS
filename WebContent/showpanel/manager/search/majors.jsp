<%@page import="com.slg.zxgl.entity.MajorInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		List<MajorInfo> majors = (List<MajorInfo>) session.getAttribute("majors");
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
		}
		int allpages = majors != null ? (majors.size() / 10 + ((majors.size() % 10 == 0) ? 0 : 1)) : 0;
		if (pageNumber > allpages) {
			pageNumber = allpages;
		}
	%>
	<table width="95%">
		<tr align="center" height="25px">
			<th colspan="4">专业信息</th>
		</tr>
		<tr align="center" height="25px">
			<td colspan="2"></td>
			<td colspan="2"><form action="MajorInfo/search.action"
					method="post">
					<input type="hidden" name="type" value="major" /> <input
						type="search" name="word" /><input type="submit" value="搜索" />
				</form></td>
		</tr>
		<tr align="center" height="25px">
			<td width="10%">序号</td>
			<td width="30%">专业名称</td>
			<td width="30%">专业简称</td>
			<td width="30%">专业简介</td>
		</tr>
		<%
			if (majors != null) {
				for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= majors.size()) {
						break;
					}
					MajorInfo major = majors.get(idx);
		%><tr align="center" height="25px">
			<td width="10%"><%=i + 1%></td>
			<td width="30%"><a href="manager/search.action?action=show&type=major&id=<%=idx%>"><%=major.getName()%></a></td>
			<td width="30%"><%=major.getShortname()%></td>
			<td width="30%"><%=major.getDescription().length() > 10 ? major.getDescription().substring(0, 10)
							: major.getDescription()%>...</td>
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
			<th colspan="4">无管理员信息</th>
		</tr>
		<%
			}
		%>
	</table>
</div>