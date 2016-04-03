<%@page import="com.slg.zxgl.entity.StudentInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		StudentInfo stu = (StudentInfo) session.getAttribute("show");
		if (stu != null) {
	%><table width="95%">
		<tr>
			<td><a href="teacher/show.action?action=return&type=stu">返回</a></td>
			<th>学生详细信息</th>
		</tr>
		<tr>
			<td>学号</td>
			<td width="80%"><%=stu.getAccname()%></td>
		</tr>
		<tr>
			<td>姓名</td>
			<td width="80%"><%=stu.getName()%></td>
		</tr>
		<tr>
			<td>民族</td>
			<td width="80%"><%=stu.getPoliticsStatus()%></td>
		</tr>
		<tr>
			<td>地址</td>
			<td width="80%"><%=stu.getAddress()%></td>
		</tr>
		<tr>
			<td>性别</td>
			<td width="80%">
				<%
					if ("M".equals(stu.getGender())) {
				%>男<%
					} else {
				%>女<%
					}
				%>
			</td>
		</tr>
		<tr>
			<td>所在班级</td>
			<td width="80%"><%=stu.getClassname()%></td>
		</tr>
		<tr>
			<td>所在学院</td>
			<td width="80%"><%=stu.getCollegename()%></td>
		</tr>
		<tr>
			<td>所在年级</td>
			<td width="80%"><%=stu.getGradename()%></td>
		</tr>
		<tr>
			<td>所在专业</td>
			<td width="80%"><%=stu.getMajorname()%></td>
		</tr>
	</table>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>