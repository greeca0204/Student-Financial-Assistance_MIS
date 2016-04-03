<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.slg.zxgl.entity.ClassInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function checkClass(form) {
		if (form.name.value == '') {
			alert("请输入班级名称!");
			form.name.focus();
			return false;
		}
		if (form.shortname.value == '') {
			alert("请输入班级简称!");
			form.shortname.focus();
			return false;
		}
		if (form.description.value == '') {
			alert("请输入班级简介!");
			form.description.focus();
			return false;
		}
		if (form.collegeid.value == '') {
			alert("选择所在学院!");
			form.collegeid.focus();
			return false;
		}
		if (form.majorid.value == '') {
			alert("选择所在专业!");
			form.majorid.focus();
			return false;
		}
		if (form.gradeid.value == '') {
			alert("选择所在年级!");
			form.gradeid.focus();
			return false;
		}
		return true;
	}
</script>
<div align="center" style="margin-top: 30px">
	<form action="manager/add.action" onsubmit="return checkClass(this)"
		method="post">
		<table width="90%">
			<tr height="60px">
				<th width="80%" align="center" colspan="2">添加班级详细内容<input
					name="type" value="class" type="hidden" /><input name="action"
					value="add" type="hidden" /></th>
			</tr>
			<tr height="30px">
				<td align="right">班级名称</td>
				<td align="left"><input name="name" /></td>
			</tr>
			<tr height="30px">
				<td align="right">班级简称</td>
				<td align="left"><input name="shortname" /></td>
			</tr>
			<tr height="30px">
				<td align="right">班级简介</td>
				<td align="left"><textarea name="description" cols="60"
						rows="10"></textarea></td>
			</tr>
			<tr height="30px">
				<td align="right">所在学院</td>
				<%
					Map cos = (HashMap) session.getAttribute("cos");
				%>
				<td align="left"><select name="collegeid">
						<option value="">请选择所在学院</option>

						<%
							if (cos != null) {
								for (Object key : cos.keySet()) {
						%><option value="<%=key%>"><%=cos.get(key)%></option>
						<%
							}
							} else {
						%><option value="">没有可选的学院</option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr height="30px">
				<td align="right">所在专业</td>
				<%
					Map ms = (HashMap) session.getAttribute("ms");
				%>
				<td align="left"><select name="majorid">
						<option value="">请选择所在专业</option>

						<%
							if (ms != null) {
								for (Object key : ms.keySet()) {
						%><option value="<%=key%>"><%=ms.get(key)%></option>
						<%
							}
							} else {
						%><option value="">没有可选的专业</option>
						<%
							}
						%>
				</select></td>
			</tr>
			
			<tr height="30px">
				<td align="right">所在年级</td>
				<%
					Map gs = (HashMap) session.getAttribute("gs");
				%>
				<td align="left"><select name="gradeid">
						<option value="">请选择所在年级</option>

						<%
							if (gs != null) {
								for (Object key : gs.keySet()) {
						%><option value="<%=key%>"><%=gs.get(key)%></option>
						<%
							}
							} else {
						%><option value="">没有可选的年级</option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr height="30px">
				<td colspan="2" align="center"><input type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" /></td>
			</tr>
		</table>
	</form>
</div>