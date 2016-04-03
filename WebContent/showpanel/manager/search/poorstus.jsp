<%@page import="com.slg.zxgl.entity.PoorStudentInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="javascript">
function firm(k)
{
    if(confirm("是否删除该学生的贫困生信息？"))
    {
        location.href="manager/delete.action?type=poorstu&stuid="+k+"&action=delete";
    }
}
</script>
<div align="center" style="margin-top: 10px">
	<%
		List<PoorStudentInfo> poorstus = (List<PoorStudentInfo>) session.getAttribute("poorstus");
		int pageNumber = 1;
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
		}
		int allpages = poorstus != null ? (poorstus.size() / 10 + ((poorstus.size() % 10 == 0) ? 0 : 1)) : 0;
		if (pageNumber > allpages) {
			pageNumber = allpages;
		}
	%>
	<table width="95%">
		<tr align="center" height="25px">
			<th colspan="5">贫困生信息</th>
		</tr>
		<tr align="center" height="25px">
			<td colspan="2"></td>
			<td colspan="3"><form action="manager/search.action"
					method="post">
					<input type="hidden" name="type" value="poorstu" /> <input
						type="search" name="word" /><input type="submit" value="搜索" />
				</form></td>
		</tr>
		<tr align="center" height="25px">
			<td width="10%">序号</td>
			<td width="30%">学号</td>
			<td width="30%">姓名</td>
			<td width="15%">贫困等级</td>
			<td width="15%" align="center">操作</td>
		</tr>
		<%
			if (poorstus != null) {
			for (int i = 0; i < 10; i++) {
					int idx = i + 10 * (pageNumber - 1);
					if (idx >= poorstus.size()) {
						break;
					}
					PoorStudentInfo poorstu = poorstus.get(idx);
		%><tr align="center" height="25px">
			<td><%=i + 1%></td>
			<td><a
				href="manager/search.action?action=show&type=poorstu&id=<%=idx%>"><%=poorstu.getStuAccname()%></a></td>
			<td><a
				href="manager/search.action?action=show&type=poorstu&id=<%=idx%>"><%=poorstu.getStuName()%></a></td>
			<td><%=poorstu.getPoorName()%></td>
			<td width="20%" align="center"><a
				href="manager/update.action?type=poorstu&action=show&stuid=<%=poorstu.getStuId()%>"><button>修改</button></a>
				<input type="submit" value="删除"
				onclick="firm(<%=poorstu.getStuId()%>)" /></td>
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
			<th colspan="4">无贫困生信息</th>
		</tr>
		<%
			}
		%>
	</table>
</div>