<%@page import="com.slg.zxgl.entity.Manager"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="javascript">
function firm(k)
{
    if(confirm("是否删除该学生相关的全部信息？"))
    {
        location.href="manager/delete.action?adminid="+k+"&action=delete&type=admin";
    }
}
</script>
<div align="center" style="margin-top: 10px">
	<%
		List<Manager> admins = (List<Manager>) session.getAttribute("admins");
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
		}
		int allpages = admins != null ? (admins.size() / 10 + ((admins.size() % 10 == 0) ? 0 : 1)) : 0;
		if (pageNumber > allpages) {
			pageNumber = allpages;
		}
	%>
	<table width="95%">
		<tr align="center" height="25px">
			<th colspan="5">管理员信息</th>
		</tr>
		<tr align="center" height="25px">
			<td colspan="2"></td>
			<td colspan="3"><form action="manager/delete.action"
					method="post">
					<input type="hidden" name="type" value="admin" /> <input
						type="search" name="word" /><input type="submit" value="搜索" />
				</form></td>
		</tr>
		<tr align="center" height="25px">
			<td width="10%">序号</td>
			<td width="25%">学号</td>
			<td width="25%">姓名</td>
			<td width="25%">所在班级</td>
			<td width="10%" align="center">操作</td>
		</tr>
		<%
			if (admins != null) {
				for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= admins.size()) {
						break;
					}
					Manager admin = admins.get(idx);
		%><tr align="center" height="25px">
			<td><%=i + 1%></td>
			<td><%=admin.getaccname()%></td>
			<td><%=admin.getName()%></td>
			<%
				String permission = "无权限";
						switch (admin.getPermssion()) {
						case 0:
							permission = "无权限";
							break;
						case 1:
							permission = "系统管理员";
							break;
						case 2:
							permission = "人事管理员";
							break;
						case 3:
							permission = "贫困生管理员";
							break;
						case 4:
							permission = "助学管理员";
							break;
						}
			%>
			<td width="30%"><%=permission%></td>
			<td align="center"><input type="submit" value="删除"
				onclick="firm(<%=admin.getId()%>)" /></td>
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
			<th colspan="4">无可删除的管理员信息</th>
		</tr>
		<%
			}
		%>
	</table>
</div>