<%@page import="com.slg.zxgl.entity.MajorInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkMajor(form) {
		if (form.name.value == '') {
			alert("请输入专业名称!");
			form.name.focus();
			return false;
		}
		if (form.shortname.value == '') {
			alert("请输入专业简称!");
			form.shortname.focus();
			return false;
		}
		if (form.description.value == '') {
			alert("请输入专业简介!");
			form.description.focus();
			return false;
		}
		return true;
	}
</script>
<div>
	<%
		MajorInfo m = (MajorInfo) session.getAttribute("show");
	%>
	<form action="manager/update.action" method="post"
		onsubmit="return checkMajor(this)" style="top: 30px">
		<table align="center" width="70%">
			<tr height="30px" align="center">
				<td colspan="2">修改专业信息<input name="type" value="major"
					type="hidden" /><input name="action" value="update" type="hidden" /><input
					name="id" value="<%=m != null ? m.getId() : 0%>" type="hidden" /></td>
			</tr>
			<tr height="30px" align="center">
				<td width="30%">专业名称</td>
				<td width="60%"><input name="name"
					value="<%=m != null ? m.getName() : ""%>" /></td>
			</tr>
			<tr height="30px" align="center">
				<td>专业简称</td>
				<td><input name="shortname"
					value="<%=m != null ? m.getShortname() : ""%>" /></td>
			</tr>
			<tr height="30px">
				<td align="right">简介</td>
				<td align="left"><textarea name="description" cols="50"
						rows="10"><%=m!=null?m.getDescription():"" %></textarea></td>
			</tr>
			<tr align="center" height="30px">
				<td colspan="2"><input type="submit" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
</div>