<%@page import="com.slg.zxgl.entity.GrantShip"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		GrantShip ship = (GrantShip) session.getAttribute("show");
		if (ship != null) {
	%><!--manager/update.action-->
	<form action="manager/update.action">
		<table width="95%">
			<tr height="30px">
				<td><a
					href="manager/update.action?action=return&type=grantship">返回</a></td>
				<th colspan="3">修改助学金项目</th>
			</tr>
			<tr style="background-color: #aaaaaa" height="25px">
				<th align="left" colspan="4">助学金基本信息</th>
			</tr>
			<tr height="30px" align="center">
				<td width="30%">奖项名称</td>
				<td align="left"><input name="name" type="text" size="65%" value="<%=ship.getName()%>"/></td>
			</tr>
			<tr height="30px" align="center">
				<td>申请要求</td>
				<td><textarea name="req" style="overflow-x: hidden" rows="10"
						cols="70" ><%=ship.getRequest() %></textarea></td>
			</tr>
			<tr height="30px" align="center">
				<td>人数（人）</td>
				<td align="left"><input name="number" type="text" size="20px"
					onkeyup="value=value.replace(/[^\d]/g,'') "
					onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" value="<%=ship.getNumber()%>"/></td>
			</tr>
			<tr height="30px" align="center">
				<td>发放金额（元）</td>
				<td align="left"><input name="money" type="text" size="20px"
					onkeyup="value=value.replace(/[^\d]/g,'') "
					onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" value="<%=ship.getMoney()%>"/></td>
			</tr>
			<tr height="30px" align="center">
				<td>发放方式</td>
				<td align="left"><input name="stype" type="text" size="20px" value="<%=ship.getStype()%>"/></td>
			</tr>
			<tr align="center" height="30px">
				<td colspan="2"><input type="hidden" name="id"
					value="<%=ship.getId()%>" /><input type="hidden" name="type"
					value="grantship" /> <input type="hidden" name="action"
					value="update" /><input type="submit" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>