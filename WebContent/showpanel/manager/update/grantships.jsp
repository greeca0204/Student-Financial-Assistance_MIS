<%@page import="com.slg.zxgl.entity.GrantShip"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		List<GrantShip> grantships = (List<GrantShip>) session.getAttribute("grantships");
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
		}
		int allpages = grantships!=null?(grantships.size() / 10 + ((grantships.size() % 10 == 0) ? 0 : 1)):0;
		if (pageNumber > allpages) {
			pageNumber = allpages;
		}
	%>
	<table width="95%">
		<tr align="center" height="25px">
			<th colspan="5">修改助学项目信息</th>
		</tr>
		<tr align="center" height="25px">
			<td colspan="2"></td>
			<td colspan="3"><form action="manager/update.action"
					method="post">
					<input type="hidden" name="type" value="grantship" /> <input
						type="search" name="word" /><input type="submit" value="搜索" />
				</form></td>
		</tr>
		<tr align="center" height="25px">
			<td width="10%">序号</td>
			<td width="30%">名称</td>
			<td width="30%">发放类型</td>
			<td width="15%">添加时间</td>
		</tr>
		<%
			if (grantships != null) {
			for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= grantships.size()) {
						break;
					}
					GrantShip ship = grantships.get(idx);
		%><tr align="center" height="25px">
			<td><%=i + 1%></td>
			<td><a
				href="manager/update.action?action=show&type=grantship&id=<%=ship.getId()%>"><%=ship.getName()%></a></td>
			<td><%=ship.getStype()%></td>
			<td><%=ship.getAddtime().toString().substring(0, 10)%></td>
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
			<th colspan="4">无助学项目信息</th>
		</tr>
		<%
			}
		%>
	</table>
</div>