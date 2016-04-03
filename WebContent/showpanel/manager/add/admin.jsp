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
	<form action="manager/add.action" method="post" onsubmit="return checkAdmin(this)" style="margin-top: 100px">
		<table align="center" width="70%" >
			<tr height="30px" align="center">
				<td colspan="2">添加管理员信息<input name="type" value="admin"
					type="hidden" /><input name="action" value="add" type="hidden" /></td>
			</tr>
			<tr height="30px" align="center">
				<td width="30%">管理员账号</td>
				<td width="30%"><input name="accname" /></td>
			</tr>
			<tr height="30px" align="center">
				<td>管理员姓名</td>
				<td><input name="name" /></td>
			</tr>
			<tr height="30px" align="center">
				<td>管理员类型</td>
				<td><select name="permission">
						<option value="1">系统管理员</option>
						<option value="2">人事管理员</option>
						<option value="3">贫困生管理员</option>
						<option value="4">助学管理员</option>
				</select></td>
			</tr>
			<tr align="center" height="30px">
				<td colspan="2"><input type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
</div>