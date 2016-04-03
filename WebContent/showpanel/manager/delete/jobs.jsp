<%@page import="com.slg.zxgl.entity.Job"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="javascript">
function firm(k)
{
    if(confirm("是否删除该助学项目信息？"))
    {
        location.href="manager/delete.action?jobid="+k+"&action=delete&type=job";
    }
}
</script>
<div align="center" style="margin-top: 10px">
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
	%>
	<table width="95%">
		<tr align="center" height="25px">
			<th colspan="5">助学项目信息</th>
		</tr>
		<tr align="center" height="25px">
			<td colspan="2"></td>
			<td colspan="3"><form action="manager/delete.action"
					method="post">
					<input type="hidden" name="type" value="poorstu" /> <input
						type="search" name="word" /><input type="submit" value="搜索" />
				</form></td>
		</tr>
		<tr align="center" height="25px">
			<td width="10%">序号</td>
			<td width="25%">岗位名称</td>
			<td width="20%">简要信息</td>
			<td width="20%">提供单位</td>
			<td width="20%" align="center">操作</td>
		</tr>
		<%
			if (jobs != null) {
				for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= jobs.size()) {
						break;
					}
					Job job = jobs.get(idx);
		%><tr align="center" height="25px">
			<td><%=i + 1%></td>
			<td><%=job.getName()%></td>
			<td><%=job.getSkills().substring(0, job.getSkills().length() < 10 ? job.getSkills().length() : 10)
									+ "..."%></td>
			<td><%=job.getEmplyer().substring(0,
							job.getEmplyer().length() < 10 ? job.getEmplyer().length() : 10) + "..."%></td>
			<td align="center"><input type="submit" value="删除"
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
		%><tr align="center" height="25px">
			<th colspan="4">无可删除的助学金信息</th>
		</tr>
		<%
			}
		%>
	</table>
</div>