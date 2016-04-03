<%@page import="com.slg.zxgl.entity.CollegeInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="javascript">
function deleteCollege(k)
{
    if(confirm("是否删除该学院相关的全部信息？"))
    {
        location.href="manager/delete.action?collegeid="+k+"&action=delete&type=college";
    }
}
</script>
<div align="center" style="margin-top: 10px">
	<%
		List<CollegeInfo> colleges = (List<CollegeInfo>) session.getAttribute("colleges");
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
		}
		int allpages = colleges != null ? (colleges.size() / 10 + ((colleges.size() % 10 == 0) ? 0 : 1)) : 0;
		if (pageNumber > allpages) {
			pageNumber = allpages;
		}
	%>
	<table width="95%">
		<tr align="center" height="25px">
			<th colspan="5">学院信息</th>
		</tr>
		<tr align="center" height="25px">
			<td colspan="2"></td>
			<td colspan="3"><form action="manager/delete.action"
					method="post">
					<input type="hidden" name="type" value="college" /> <input
						type="search" name="word" /><input type="submit" value="搜索" />
				</form></td>
		</tr>
		<tr align="center" height="25px">
			<td width="10%">序号</td>
			<td width="25%">学院名称</td>
			<td width="25%">学院简称</td>
			<td width="25%">学院简介</td>
			<td width="10%" align="center">操作</td>
		</tr>
		<%
			if (colleges != null) {
				for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= colleges.size()) {
						break;
					}
					CollegeInfo college = colleges.get(idx);
		%><tr align="center" height="25px">
			<td><%=i + 1%></td>
			<td><%=college.getName()%></td>
			<td><%=college.getShortname()%></td>
			<td><%=college.getDescription().length() > 10 ? college.getDescription().substring(0, 10)
							: college.getDescription()%>...</td>
			<td align="center"><input type="submit" value="删除"
				onclick="deleteCollege(<%=college.getId()%>)" /></td>
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
			<th colspan="5">无可删除的学院信息</th>
		</tr>
		<%
			}
		%>
	</table>
</div>