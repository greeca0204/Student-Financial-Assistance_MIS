<%@page import="com.slg.zxgl.entity.StudentInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		StudentInfo stu = (StudentInfo) session.getAttribute("show");
		if (stu != null) {
	%><table width="95%">
		<tr height="30px">
			<td><a href="manager/search.action?action=return&type=stu">返回</a></td>
			<th colspan="4">学生详细信息</th>
		</tr>
		<tr height="30px">
			<td></td>
			<th colspan="4" style="background-color: #aaaaaa" align="left">基本信息</th>
		</tr>
		<tr height="30px">
			<td></td>
			<td>学号</td>
			<td width="35%"><%=stu.getAccname()%></td>
			<td>姓名</td>
			<td width="35%"><%=stu.getName()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>性别</td>
			<td>
				<%
					if ("M".equals(stu.getGender())) {
				%>男<%
					} else {
				%>女<%
					}
				%>
			</td>
			<td>政治面貌</td>
			<td><%=stu.getPoliticsStatus()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>民族</td>
			<td><%=stu.getNationality()%></td>
			<td>身份证号码</td>
			<td><%=stu.getIdentification()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>地址</td>
			<td colspan="3"><%=stu.getAddress()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<th colspan="4" style="background-color: #aaaaaa" align="left">班级信息</th>
		</tr>
		<tr height="30px">
			<td></td>
			<td>所在班级</td>
			<td colspan="3"><%=stu.getClassname()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>所在学院</td>
			<td colspan="3"><%=stu.getCollegename()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>所在年级</td>
			<td colspan="3"><%=stu.getGradename()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>所在专业</td>
			<td colspan="3"><%=stu.getMajorname()%></td>
		</tr>
	</table>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>