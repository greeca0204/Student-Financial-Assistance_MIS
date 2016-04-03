<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function checkTea(form) {
		if (form.accname.value == '') {
			alert("请输入教职工号!");
			form.accname.focus();
			return false;
		}
		if (form.name.value == '') {
			alert("请输入教职工姓名!");
			form.name.focus();
			return false;
		}
		if (form.email.value == '') {
			alert("请输入邮箱!");
			form.email.focus();
			return false;
		}
		if (form.phone.value == '' ) {
			alert("请输入正确的联系方式（手机）!");
			form.phone.focus();
			return false;
		}
		if (form.department.value == '') {
			alert("请输入部门名称!");
			form.department.focus();
			return false;
		}
		if (form.position.value == '') {
			alert("请输入职位!");
			form.position.focus();
			return false;
		}
		if (form.positiontitle.value == '') {
			alert("请输入职称!");
			form.positiontitle.focus();
			return false;
		}
		return true;
	}
</script>
<div align="center" style="margin-top: 10px">
	<form name="form" method="post" action="manager/add.action"
		onsubmit="return checkTea(this)">
		<table width="95%">
			<tr height="30px">
				<td></td>
				<th colspan="4">添加教职工详细信息</th>
			</tr>
			<tr height="30px">
				<td></td>
				<th colspan="4" style="background-color: #aaaaaa" align="left">基本信息</th>
			</tr>
			<tr height="30px">
				<td></td>
				<td>教职工号码</td>
				<td width="30%"><input name="accname" maxlength="21" size="21"
					onkeyup="value=value.replace(/[^\d]/g,'') "
					onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" /></td>
				<td>姓名</td>
				<td width="30%"><input name="name" type="text" /></td>
			</tr>
			<tr height="30px">
				<td></td>
				<td>邮箱</td>
				<td><input name="email" type="text" /></td>
				<td>联系方式（手机）</td>
				<td><input name="phone" type="text"
					onkeyup="value=value.replace(/[^\d]/g,'') " /></td>
			</tr>
			<tr height="30px">
				<td></td>
				<th colspan="4" style="background-color: #aaaaaa" align="left">班级与职位信息</th>
			</tr>

			<tr height="30px">
				<td></td>
				<td>部门</td>
				<td><input name="department" type="text" /></td>
				<td>职位</td>
				<td><input name="position" type="text" /></td>
			</tr>
			<tr height="30px">
				<td></td>
				<td>职称</td>
				<td><input name="positiontitle" type="text" /></td>
				<td>选择所带班级</td>
				<td colspan="1"><select name="classid">
						<%
							Map<Integer, String> cs = (Map) session.getAttribute("cs");
							if (cs != null) {
						%>
						<option value="0">不带班级</option>
						<%
							for (int c : cs.keySet()) {
						%><option value="<%=c%>"><%=cs.get(c)%></option>
						<%
							}
							} else {
						%><option value="0">没有班级可选</option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr height="30px">
				<td></td>
				<th colspan="2"><input name="type" value="tea" type="hidden" /><input
					name="action" value="add" type="hidden" /><input type="submit"
					value="提交" /></th>
				<th colspan="2"><input type="reset" value="重置" /></th>
			</tr>
		</table>
	</form>
</div>