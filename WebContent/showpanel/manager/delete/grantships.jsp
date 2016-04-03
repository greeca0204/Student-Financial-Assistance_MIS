<%@page import="com.slg.zxgl.entity.GrantShip"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="javascript">
function firm(k)
{
    if(confirm("是否删除该助学项目信息？"))
    {
        location.href="manager/delete.action?shipid="+k+"&action=delete&type=grantship";
    }
}
</script>
<div align="center" style="margin-top: 10px">
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
	%>
	<table width="95%">
		<tr align="center" height="25px">
			<th colspan="5">贫困生信息</th>
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
			<td width="30%">名称</td>
			<td width="30%">人数</td>
			<td width="15%">发放金额</td>
			<td width="15%">操作</td>
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
			<td><%=ship.getName()%></td>
			<td><%=ship.getNumber()%>人</td>
			<td><%=ship.getMoney()%>元</td>
			<td><input type="submit" value="删除"
				onclick="firm(<%=ship.getId()%>)" /></td>
			</td>
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