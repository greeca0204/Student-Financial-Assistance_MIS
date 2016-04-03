<%@page import="com.slg.zxgl.entity.GrantShip"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="javascript">
function firm(k)
{
    if(confirm("是否删除该岗位信息？"))
    {
        location.href="manager/delete.action?shipid="+k+"&action=delete&type=grantship";
    }
}
</script>
<div>
	<div align="center" style="margin-top: 30px">
		<table width="90%">
			<tr>
				<td width="20%"><a
					href="manager/search.action?action=return&type=grantship">返回</a></td>
				<td width="80%" align="center">岗位详细内容</td>
			</tr>
		</table>
	</div>
	<%
		GrantShip ship = (GrantShip) session.getAttribute("show");

		if (ship != null) {
	%>
	<table align="center" width="90%" style="margin-top: 30px">
		<tr height="30px">
			<td width="20%">奖项名称</td>
			<td><%=ship.getName()%></td>
		</tr>
		<tr height="30px">
			<td>申请要求</td>
			<td><%=ship.getRequest()%></td>
		</tr>
		<tr height="30px">
			<td>人数</td>
			<td><%=ship.getNumber()%></td>
		</tr>
		<tr height="30px">
			<td>发放金额</td>
			<td><%=ship.getMoney()%></td>
		</tr>
		<tr height="30px">
			<td>发放方式</td>
			<td><%=ship.getStype()%></td>
		</tr>
		<tr height="30px">
			<td>添加时间</td>
			<td><%=ship.getAddtime().toString().substring(0, 10)%></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><a
				href="manager/update.action?action=show&type=grantship&id=<%=ship.getId()%>"><button>修改</button></a>&nbsp;&nbsp;&nbsp;
				<input type="submit"  value="删除" onclick="firm(<%=ship.getId()%>)"/></td>
		</tr>
	</table>
	<%
		} else {
			session.setAttribute("result", "request_grantship");
	%>
	<table align="center" width="90%" style="margin-top: 100px">
		<tr align="center" height="30px">
			<td>系统错误</td>
		</tr>
	</table>
	<%
		}
	%>
</div>