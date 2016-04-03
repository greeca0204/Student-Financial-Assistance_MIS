<%@page import="com.slg.zxgl.entity.Manager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkAdmin(form) {
		if (form.accname.value == '') {
			alert("请输入管理员账号!");
			form.accname.focus();
			return false;
		}
		if (form.name.value == '') {
			alert("请输入管理员姓名!");
			form.name.focus();
			return false;
		}
		return true;
	}
</script>
<div>
	<%
		Manager m = (Manager) session.getAttribute("show");
	%>
	<form action="manager/update.action" method="post"
		onsubmit="return checkAdmin(this)" style="top: 30px">
		<table align="center" width="70%">
			<tr height="30px" align="center">
				<td colspan="2">修改管理员信息<input name="type" value="admin"
					type="hidden" /><input name="action" value="update" type="hidden" /><input
					name="id" value="<%=m != null ? m.getId() : 0%>" type="hidden" /></td>
			</tr>
			<tr height="30px" align="center">
				<td width="30%">管理员账号</td>
				<td width="30%"><input name="accname"
					value="<%=m != null ? m.getaccname() : ""%>" /></td>
			</tr>
			<tr height="30px" align="center">
				<td>管理员姓名</td>
				<td><input name="name" value="<%=m != null ? m.getName() : ""%>" /></td>
			</tr>
			<tr height="30px" align="center">
				<td>管理员类型</td>
				<td><select name="permission">
						<option value="1" <%if (m.getPermssion() == 1) {%> selected="selected"
							<%}%>>系统管理员</option>
						<option value="2" <%if (m.getPermssion() == 2) {%> selected="selected"
							<%}%>>人事管理员</option>
						<option value="3" <%if (m.getPermssion() == 3) {%> selected="selected"
							<%}%>>贫困生管理员</option>
						<option value="4" <%if (m.getPermssion() == 4) {%> selected="selected"
							<%}%>>助学管理员</option>
				</select></td>
			</tr>
			<tr align="center" height="30px">
				<td colspan="2"><input type="submit" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
</div>