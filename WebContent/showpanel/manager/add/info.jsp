<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="javascript">
	function changeType() {
		var type = document.getElementById('usertype');
		var typeArr = type.options;
		var index = type.selectedIndex;
		var target = document.getElementById('target');
		target.options.length = 0;
		var option = new Option('全部对象', '0');
		target.options.add(option);
		if (index == 1) {
			<%Map<Integer, String> teas = (Map) session.getAttribute("teaids");
			if (teas != null) {
				for (Integer key : teas.keySet()) {%>
					var option = new Option('<%=teas.get(key)%>', '<%=key%>');
					target.options.add(option);
				<%}
			}%>
	} else if (index == 2) {
			<%Map<Integer, String> stus = (Map) session.getAttribute("stuids");
			if (stus != null) {
				for (Integer key : stus.keySet()) {%>
					var option = new Option('<%=stus.get(key)%>', '<%=key%>
	');
			target.options.add(option);
<%}
			}%>
	} else {
			target.options.length = 0;
		}
	}
	function checkinfo(form) {
		if (form.title.value == '') {
			alert("请输入标题!");
			form.title.focus();
			return false;
		} else if (form.details.value == '') {
			alert("请输入内容!");
			form.details.focus();
			return false;
		} else {
			return true;
		}
	}
</script>
<div>
	<form action="manager/add.action" method="post"
		onsubmit="return checkinfo(this)">
		<table align="center" width="95%">
			<tr height="30px" align="center">
				<th colspan="2">发送信息<input name="type" value="info"
					type="hidden" /><input name="action" value="add" type="hidden" /></th>
			</tr>
			<tr style="background-color: #aaaaaa" height="25px">
				<th align="left" colspan="2">信息内容</th>
			</tr>
			<tr align="center" height="30px">
				<td width="10%">标题</td>
				<td align="left"><input name="title" /></td>
			</tr>
			<tr align="center" height="30px">
				<td>内容</td>
				<td align="left"><textarea rows="10" cols="80"
						style="overflow-x: hidden" name="details"></textarea></td>
			</tr>
			<tr style="background-color: #aaaaaa" height="25px">
				<th align="left" colspan="2">发送目标</th>
			</tr>
			<tr align="center" height="30px">
				<td>类型</td>
				<td align="left"><select name="usertype" id="usertype"
					style="width: 100px;" onChange="changeType()">
						<option value="0">所有人</option>
						<option value="1">教师</option>
						<option value="2">学生</option>
				</select> <select name="target" id="target" style="width: 100px;">

				</select></td>
			</tr>
			<tr align="center" height="30px">
				<td colspan="2"><input type="submit" value="发送" />&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
</div>