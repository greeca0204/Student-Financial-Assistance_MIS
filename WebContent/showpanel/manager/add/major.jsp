<%@page import="com.slg.zxgl.entity.MajorInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div align="center" style="margin-top: 30px">
	<form action="manager/add.action" onsubmit="return checkMajor(this)" method="post"> 
		<table width="90%">
			<tr height="60px">
				<th width="80%" align="center" colspan="2">添加专业详细内容<input
					name="type" value="major" type="hidden"/><input name="action" value="add" type="hidden"/></th>
			</tr>
			<tr height="30px">
				<td align="right">专业名称</td>
				<td align="left"><input name="name" /></td>
			</tr>
			<tr height="30px">
				<td align="right">简称</td>
				<td align="left"><input name="shortname" /></td>
			</tr>
			<tr height="30px">
				<td align="right">简介</td>
				<td align="left"><textarea name="description" cols="60"
						rows="10"></textarea></td>
			</tr>
			<tr height="30px">
				<td colspan="2" align="center"><input type="submit" />&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" /></td>
			</tr>
		</table>
	</form>
</div>