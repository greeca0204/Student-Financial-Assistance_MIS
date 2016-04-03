<%@page import="com.slg.zxgl.entity.GrantShip"%>
<%@page import="com.slg.zxgl.entity.Job"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<table width="90%" align="center">

		<tr height="30px">
			<th colspan="5">助学金基本情况</th>
		</tr>
		<tr height="30px">
			<th colspan="2"></th>
			<th colspan="3"><form action="student/request.action"
					method="post">
					<input name="action" value="search" hidden="true" /> <input
						name="type" value="grantship" hidden="true" /> 关键字：<input
						type="search" name="word"> <input type="submit" value="搜索">
				</form></th>
		</tr>
		<%
			List<GrantShip> grantships = (List<GrantShip>) session.getAttribute("grantships");
			int pageNumber = 1;
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch (Exception e) {
			}
			int allpages = grantships != null ? (grantships.size() / 10 + ((grantships.size() % 10 == 0) ? 0 : 1)) : 0;
			if (pageNumber > allpages) {
				pageNumber = allpages;
			}
			if (grantships != null) {
		%>
		<tr height="30px">
			<td width="10%">序号</td>
			<td width="30%">项目名称</td>
			<td width="30%">简要信息</td>
			<td width="15%">时间</td>
			<td width="15%">操作</td>
		</tr>
		<%
		for (int i = 0; i < 10; i++) {
			int idx = i + 10 * (pageNumber - 1);
			if (idx >=  grantships.size()) {
				break;
			}
			 GrantShip ship =  grantships.get(idx);
		%>
		<tr height="30px">
			<td width="10%"><%=i + 1%></td>
			<td width="30%"><%=ship.getName()%></td>
			<td width="30%"><%=ship.getRequest().substring(0,
							ship.getRequest().length() < 10 ? ship.getRequest().length() : 10)
							+ "..."%></td>
			<td width="15%"><%=ship.getAddtime().toString().substring(0, 10)%></td>
			<td width="15%">
				<%
					if (ship.isActivition()) {
				%><a
				href="student/request.action?type=grantship&action=add&id=<%=ship.getId()%>">申请</a>
				<%
					} else {
				%>无法申请<%
					}
				%>
			</td>
		</tr>
		<%
			}
		%>
		<tr>
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
		%>


		<tr height="30px">
			<th>没有可申请的助学金!</th>
		</tr>
		<%
			}
		%>
	</table>
</div>
