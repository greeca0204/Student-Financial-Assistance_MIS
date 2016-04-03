<%@page import="com.slg.zxgl.entity.JobApplication"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		JobApplication job = (JobApplication) session.getAttribute("job");
		if (job != null) {
	%><table width="95%">
		<tr height="25px">
			<td><a href="manager/audit.action?type=job">返回</a></td>
			<th colspan="3">助学金申请详细信息</th>
		</tr>
		<tr style="background-color: #aaaaaa" height="25px">
			<th align="left" colspan="4">学生基本信息</th>
		</tr>
		<tr height="25px">
			<td width="15%">姓名</td>
			<td width="30%"><%=job.getStuName()%></td>
			<td width="20%">学号</td>
			<td width="35%"><%=job.getStuAccname()%></td>
		</tr>
		<tr height="25px">
			<td>政治面目</td>
			<td><%=job.getStuPoliticsStatus()%></td>
			<td>民族</td>
			<td><%=job.getStuNationality()%></td>
		</tr>
		<tr height="25px">
			<td>性别</td>
			<td><%=job.getStuGender()%></td>
			<td>身份证号码</td>
			<td><%=job.getStuIdentification()%></td>
		</tr>
		<tr height="25px">
			<td>手机号码</td>
			<td><%=job.getStuPhone()%></td>
			<td>地址</td>
			<td><%=job.getStuAddress()%></td>
		</tr>
		<tr style="background-color: #aaaaaa" height="25px">
			<th align="left" colspan="4">学生专业信息</th>
		</tr>
		<tr height="25px">
			<td>班级</td>
			<td><%=job.getStuClassName()%></td>

			<td>年级</td>
			<td colspan="3"><%=job.getStuGradename()%></td>
		</tr>
		<tr height="25px">
			<td>学院</td>
			<td><%=job.getStuCollegename()%></td>
			<td>专业</td>
			<td><%=job.getStuMajorname()%></td>
		</tr>
		<tr style="background-color: #aaaaaa" height="25px">
			<th align="left" colspan="4">申请项目详情</th>
		</tr>
		<tr height="25px">
			<td>岗位名称</td>
			<td><%=job.getJobName()%></td>
			<td>工作地点</td>
			<td><%=job.getJobWorkPoint()%></td>
		</tr>
		<tr height="25px">
			<td>岗位提供单位</td>
			<td><%=job.getJobEmplyer()%></td>
		</tr>
		<tr  height="25px">
			<td>面试需求</td>
			<td colspan="3"><%=job.getJobInterview()%></td>
		</tr>
		<tr height="25px">
			<td>工作时间</td>
			<td colspan="3"><%=job.getJobWorkTime()%></td>
		</tr>
		<tr>
			<td>技能需求</td>
			<td colspan="3"><%=job.getJobSkills()%></td>
		</tr>
	</table>
	<table width="95%">
		<tr align="center">
			<td colspan="2"><input type="button"
				onclick="window.location.href='manager/audit.action?type=job&action=audit&status=true'"
				value="通过"></td>
			<td colspan="2"><input type="button"
				onclick="window.location.href='manager/audit.action?type=job&action=audit&status=false'"
				value="不通过"></td>
		</tr>
	</table>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>