<%@page import="com.slg.zxgl.entity.Job"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		Job job = (Job) session.getAttribute("show");
		if (job != null) {
	%><!--manager/update.action-->
	<form action="manager/update.action" method="post">
		<table width="95%">
			<tr height="30px">
				<td><a href="manager/update.action?action=return&type=job">返回</a></td>
				<th colspan="3">修改岗位信息</th>
			</tr>
			<tr style="background-color: #aaaaaa" height="25px">
				<th align="left" colspan="4">岗位基本信息</th>
			</tr>
			<tr height="30px">
				<td width="20%">岗位名称</td>
				<td><input name="name" value="<%=job.getName()%>" /></td>
			</tr>
			<tr height="30px">
				<td>岗位需求技能</td>
				<td><textarea name="skills" cols="68" rows="4"
						style="overflow-x: hidden"><%=job.getSkills()%></textarea></td>
			</tr>
			<tr height="30px">
				<td>提供单位</td>
				<td><input name="employer" value="<%=job.getEmplyer()%>" /></td>
			</tr>
			<tr height="30px">
				<td>所需人数</td>
				<td><input name="allNumber" value="<%=job.getAllNumber()%>"
					onkeyup="value=value.replace(/[^\d]/g,'') "
					onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />人</td>
			</tr>
			<tr height="30px">
				<td>工作地点</td>
				<td><input name="workpoint" value="<%=job.getWorkpoint()%>"
					size="68" /></td>
			</tr>
			<tr height="30px">
				<td>工作时间</td>
				<td><input name="worktime" value="<%=job.getWorktime()%>"
					size="68" /></td>
			</tr>
			<tr height="30px">
				<td>面试说明</td>
				<td><textarea name="interview" rows="4" cols="70"
						style="overflow-x: hidden"><%=job.getInterview()%></textarea></td>
			</tr>
			<tr>
				<td><input type="hidden" name="id" value="<%=job.getId()%>" /><input
					type="hidden" name="type" value="job" /> <input type="hidden"
					name="action" value="update" /></td>
			</tr>
			<tr align="center" height="30px">
				<td colspan="2"><input type="submit" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>