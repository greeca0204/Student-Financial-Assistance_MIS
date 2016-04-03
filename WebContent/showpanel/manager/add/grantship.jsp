<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<form action="manager/add.action">
		<table align="center" width="95%">
			<tr height="30px" align="center">
				<td colspan="2">添加助学项目<input name="type" value="grantship"
					type="hidden" /><input name="action" value="add"
					type="hidden" /></td>
			</tr>
			<tr height="30px" align="center">
				<td width="30%">奖项名称</td>
				<td align="left"><input name="name" type="text" size="65%" /></td>
			</tr>
			<tr height="30px" align="center">
				<td>申请要求</td>
				<td><textarea name="req" style="overflow-x: hidden" rows="10"
						cols="70"></textarea></td>
			</tr>
			<tr height="30px" align="center">
				<td>人数（人）</td>
				<td align="left"><input name="number" type="text" size="20px"
					onkeyup="value=value.replace(/[^\d]/g,'') "
					onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" /></td>
			</tr>
			<tr height="30px" align="center">
				<td>发放金额（元）</td>
				<td align="left"><input name="money" type="text" size="20px"
					onkeyup="value=value.replace(/[^\d]/g,'') "
					onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" /></td>
			</tr>
			<tr height="30px" align="center">
				<td>发放方式</td>
				<td align="left"><input name="stype" type="text" size="20px" /></td>
			</tr>
			<tr height="30px" align="center">
				<td colspan="2"><input type="submit" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重填" /></td>
			</tr>
		</table>
	</form>
</div>