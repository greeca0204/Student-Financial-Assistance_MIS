<%@page import="com.slg.zxgl.entity.ScholarShip"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<div align="center" style="margin-top: 30px">岗位详细内容</div>
	<%
		ScholarShip ship = (ScholarShip) session.getAttribute("scholarship");

		if (ship != null) {
	%>
	<table align="center" width="90%" style="margin-top: 30px">
		<tr height="30px">
			<td>奖项名称</td>
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
	</table>
	<form action="student/request.action" method="post">
		<table align="center" width="90%">
			<tr><td><input type="hidden" name="requestid" value="<%=ship.getId()%>" />
			<input type="hidden" name="type" value="scholarship" />
			<input type="hidden" name="action" value="add_req" /></td></tr>
			<tr align="center">
				<td><input type="submit" value="申请"></td>
			</tr>
		</table>
	</form>
	<%
		} else {
			session.setAttribute("result", "request_scholarship");
	%>
	<table align="center" width="90%" style="margin-top: 100px">
		<tr align="center" height="30px">
			<td>系统错误，重新<a href="student.jsp">选择</a></td>
		</tr>
	</table>
	<%
		}
	%>
</div>