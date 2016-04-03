<%@page import="com.slg.zxgl.entity.Job"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<div align="center" style="margin-top: 30px">岗位详细内容</div>
	<%
		Job j = (Job) session.getAttribute("job");

		if (j != null) {
	%>
	<table align="center" width="90%" style="margin-top: 30px">
		<tr height="30px">
			<td>岗位名称</td>
			<td><%=j.getName()%></td>
		</tr>
		<tr height="30px">
			<td>提供岗位单位</td>
			<td><%=j.getEmplyer()%></td>
		</tr>
		<tr height="30px">
			<td>工作地点</td>
			<td><%=j.getWorkpoint()%></td>
		</tr>
		<tr height="30px">
			<td>所需技能</td>
			<td><%=j.getSkills()%></td>
		</tr>
		<tr height="30px">
			<td>工作时间</td>
			<td><%=j.getWorktime()%></td>
		</tr>
		<tr height="30px">
			<td>工作地点</td>
			<td><%=j.getWorkpoint()%></td>
		</tr>
		<tr height="30px">
			<td>面试说明</td>
			<td><%=j.getInterview()%></td>
		</tr>
		<tr height="30px">
			<td>添加时间</td>
			<td><%=j.getAddTime().toString().substring(0, 10)%></td>
		</tr>
		<tr>
			<td colspan="2">
				<%
					String msg = (String) session.getAttribute("msg");
						if (msg != null) {
				%>您已经申请过了，不能重复申请，在查看结果查看!或者系统故障,稍后申请！<%
					}
				%>
			
			<td>
		</tr>
	</table>
	<form action="student/request.action" method="post">
		<table align="center" width="90%">
			<tr>
				<td><input type="hidden" name="requestid"
					value="<%=j.getId()%>"> <input type="hidden" name="type"
					value="job"> <input type="hidden" name="action"
					value="add_req"></td>
			</tr>
			<tr align="center">
				<td><input type="submit" value="申请"></td>
			</tr>
		</table>
	</form>
	<%
		} else {
			session.setAttribute("result", "request_job");
	%>
	<table align="center" width="90%" style="margin-top: 100px">
		<tr align="center" height="30px">
			<td>系统错误，重新<a href="student.jsp">选择</a></td>
		</tr>
	</table>
	<%
		}
	%>
</div>
