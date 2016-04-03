<%@page import="com.slg.zxgl.entity.Job"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<table width="90%" align="center">
		<tr height="30px">
			<th colspan="5">岗位基本信息</th>
		</tr>
		<tr height="30px">
			<th colspan="2"></th>
			<th colspan="3"><form action="student/request.action"
					method="post">
					<input name="action" value="search" hidden="true" /> <input
						name="type" value="job" hidden="true" /> 关键字：<input type="search"
						name="word"> <input type="submit" value="搜索">
				</form></th>
		</tr>
		<%
			List<Job> jobs = (List<Job>) session.getAttribute("jobs");
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
		<tr height="30px" align="center">
			<td width="8%">序号</td>
			<td width="35%">岗位名称</td>
			<td width="25%">岗位提供单位</td>
			<td width="15%">添加时间</td>
			<td width="15%">操作</td>
		</tr>
		<%
			for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= jobs.size()) {
						break;
					}
					Job job = jobs.get(idx);
		%>
		<tr height="30px" align="center">
			<td width="8%"><%=i + 1%></td>
			<td width="35%"><%=job.getName()%></td>
			<td width="25%"><%=job.getEmplyer()%></td>
			<td width="15%"><%=job.getAddTime().toString().substring(0, 10)%></td>
			<td width="15%">
				<%
					if (job.isActivition()) {
				%><a
				href="student/request.action?type=job&action=add&id=<%=job.getId()%>">申请</a>
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
			<th>没有相应的岗位可以申请!</th>
		</tr>
		<%
			}
		%>
	</table>
</div>
