<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<form action="manager/add.action" method="post">
		<table align="center" width="95%">
			<tr height="30px" align="center">
				<td colspan="2">添加岗位信息<input name="type" value="job"
					type="hidden" /><input name="action" value="add" type="hidden" /></td>
			</tr>
			<tr style="background-color: #aaaaaa" height="25px">
				<th align="left" colspan="4">岗位基本信息</th>
			</tr>
			<tr height="30px">
				<td width="20%">岗位名称</td>
				<td><input name="name" /></td>
			</tr>
			<tr height="30px">
				<td>岗位需求技能</td>
				<td><textarea name="skills" cols="68" rows="4"
						style="overflow-x: hidden"></textarea></td>
			</tr>
			<tr height="30px">
				<td>提供单位</td>
				<td><input name="employer" /></td>
			</tr>
			<tr height="30px">
				<td>所需人数</td>
				<td><input name="allNumber"
					onkeyup="value=value.replace(/[^\d]/g,'') "
					onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />人</td>
			</tr>
			<tr height="30px">
				<td>工作地点</td>
				<td><input name="workpoint" size="68" /></td>
			</tr>
			<tr height="30px">
				<td>工作时间</td>
				<td><input name="worktime" size="68" /></td>
			</tr>
			<tr height="30px">
				<td>面试说明</td>
				<td><textarea name="interview" rows="4" cols="70"
						style="overflow-x: hidden"></textarea></td>
			</tr>
			<tr align="center" height="30px">
				<td colspan="2"><input type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
</div>