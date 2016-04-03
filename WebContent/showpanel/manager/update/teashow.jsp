<%@page import="com.slg.zxgl.entity.Teacher"%>
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
		if (form.phone.value == '') {
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
<%
	Teacher tea = (Teacher) session.getAttribute("show");
%>
<div align="center" style="margin-top: 10px">
	<form name="form" method="post" action="manager/update.action"
		onsubmit="return checkTea(this)">
		<table width="95%">
			<tr height="30px">
				<td><a href="manager/update.action?action=return&type=tea">返回</a></td>
				<th colspan="4">修改教职工详细信息</th>
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
					onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
					value="<%=tea != null ? tea.getaccname() : ""%>" /></td>
				<td>姓名</td>
				<td width="30%"><input name="name" type="text"
					value="<%=tea != null ? tea.getName() : ""%>" /></td>
			</tr>
			<tr height="30px">
				<td></td>
				<td>邮箱</td>
				<td><input name="email" type="text"
					value="<%=tea != null ? tea.getEmail() : ""%>" /></td>
				<td>联系方式（手机）</td>
				<td><input name="phone" type="text"
					onkeyup="value=value.replace(/[^\d]/g,'') "
					value="<%=tea != null ? tea.getPhone() : ""%>" /></td>
			</tr>
			<tr height="30px">
				<td></td>
				<th colspan="4" style="background-color: #aaaaaa" align="left">班级与职位信息</th>
			</tr>

			<tr height="30px">
				<td></td>
				<td>部门</td>
				<td><input name="department" type="text"
					value="<%=tea != null ? tea.getDepartment() : ""%>" /></td>
				<td>职位</td>
				<td><input name="position" type="text"
					value="<%=tea != null ? tea.getPosition() : ""%>" /></td>
			</tr>
			<tr height="30px">
				<td></td>
				<td>职称</td>
				<td><input name="positiontitle" type="text"
					value="<%=tea != null ? tea.getPositiontitle() : ""%>" /></td>
				<td>选择所带班级</td>
				<td colspan="1"><select name="classid">
						<%
							Map<Integer, String> cs = (Map) session.getAttribute("cs");
							if (cs != null) {
						%>
						<option value="0">不带班级</option>
						<%
							for (int c : cs.keySet()) {
						%><option value="<%=c%>"
							<%if (tea != null && tea.getClassId() == c) {%> selected="selected"
							<%}%>><%=cs.get(c)%></option>
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
					name="action" value="update" type="hidden" /><input
					name="id" value="<%=tea.getId() %>" type="hidden" /><input type="submit"
					value="提交" /></th>
				<th colspan="2"><input type="reset" value="重置" /></th>
			</tr>
		</table>
	</form>
</div>