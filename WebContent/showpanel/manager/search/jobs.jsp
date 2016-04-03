<%@page import="com.slg.zxgl.entity.Job"%>
<%@page import="com.slg.zxgl.entity.Job"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script language="javascript">
function firm(id)
{
    if(confirm("是否删除该岗位信息？"))
    {
        location.href="manager/delete.action?jobid="+id+"&action=delete&type=job";
    }
}
</script>
<div>
	<table width="90%" align="center">
		<tr height="30px">
			<th colspan="5">岗位</th>
		</tr>
		<tr height="30px">
			<th colspan="2"></th>
			<th colspan="3"><form action="manager/search.action"
					method="post">
					<input name="action" value="search" hidden="true" /> <input
						name="type" value="job" hidden="true" /> 关键字：<input type="search"
						name="word"> <input type="submit" value="搜索">
				</form></th>
		</tr>

		<tr height="30px">
			<td width="10%">序号</td>
			<td width="25%">岗位名称</td>
			<td width="25%">简要信息</td>
			<td width="20%">提供单位</td>
			<td width="20%" align="center">操作</td>
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
			for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= jobs.size()) {
						break;
					}
					Job job = jobs.get(idx);
		%>
		<tr height="30px">
			<td><%=i + 1%></td>
			<td><a
				href="manager/search.action?action=show&type=job&id=<%=idx%>"><%=job.getName()%></a></td>
			<td><%=job.getSkills().substring(0,
							job.getSkills().length() < 10 ? job.getSkills().length() : 10) + "..."%></td>
			<td><%=job.getEmplyer().substring(0,
							job.getEmplyer().length() < 10 ? job.getEmplyer().length() : 10) + "..."%></td>
			<td align="center"><a
				href="manager/update.action?action=show&type=job&id=<%=job.getId()%>"><button>修改</button></a>
				<input type="submit" value="删除"
				onclick="firm(<%=job.getId()%>)" /></td>
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
		%>


		<tr height="30px">
			<th colspan="5">没有任何岗位信息!</th>
		</tr>
		<%
			}
		%>
	</table>
</div>
