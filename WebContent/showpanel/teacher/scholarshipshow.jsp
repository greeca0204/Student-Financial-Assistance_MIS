<%@page import="com.slg.zxgl.entity.ApplicationInfo"%>
<%@page import="com.slg.zxgl.entity.ScholarShip"%>
<%@page import="com.slg.zxgl.entity.ScholarShipApplication"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		ScholarShipApplication ship = (ScholarShipApplication) session.getAttribute("ship");
		if (ship != null) {
	%><table width="95%">
		<tr height="25px">
			<td><a href="teacher/audit.action?type=scholarship">返回</a></td>
			<th colspan="3">奖学金申请详细信息</th>
		</tr>
		<tr style="background-color: #aaaaaa" height="25px">
			<th align="left" colspan="4">学生基本信息</th>
		</tr>
		<tr height="25px">
			<td width="10%">姓名</td>
			<td width="30%"><%=ship.getStuName()%></td>
			<td width="20%">学号</td>
			<td width="40%"><%=ship.getStuAccname()%></td>
		</tr>
		<tr height="25px">
			<td width="10%">政治面目</td>
			<td width="30%"><%=ship.getStuPoliticsStatus()%></td>
			<td width="20%">民族</td>
			<td width="40%"><%=ship.getStuNationality()%></td>
		</tr>
		<tr height="25px">
			<td width="10%">性别</td>
			<td width="30%"><%=ship.getStuGender()%></td>
			<td width="20%">身份证号码</td>
			<td width="40%"><%=ship.getStuIdentification()%></td>
		</tr>
		<tr height="25px">
			<td width="10%">手机号码</td>
			<td width="30%"><%=ship.getStuPhone()%></td>
			<td width="20%">地址</td>
			<td width="40%"><%=ship.getStuAddress()%></td>
		</tr>
		<tr style="background-color: #aaaaaa" height="25px">
			<th align="left" colspan="4">学生专业信息</th>
		</tr>
		<tr height="25px">
			<td width="10%">班级</td>
			<td width="90%" colspan="3"><%=ship.getStuClassName()%></td>
		</tr>
		<tr height="25px">
			<td width="10%">年级</td>
			<td width="90%" colspan="3"><%=ship.getStuGradename()%></td>
		</tr>
		<tr height="25px">
			<td width="10%">学院</td>
			<td width="90%" colspan="3"><%=ship.getStuCollegename()%></td>
		</tr>
		<tr height="25px">
			<td width="10%">专业</td>
			<td width="90%" colspan="3"><%=ship.getStuMajorname()%></td>
		</tr>
		<tr style="background-color: #aaaaaa" height="25px">
			<th align="left" colspan="4">申请项目详情</th>
		</tr>
		<tr height="25px">
			<td width="10%">项目名称</td>
			<td width="30%"><%=ship.getShipName()%></td>
			<td width="20%">项目金额</td>
			<td width="40%"><%=ship.getShipMoney()%></td>
		</tr>
		<tr height="25px">
			<td width="10%">人数说明</td>
			<td width="30%"><%=ship.getShipNumber()%></td>
			<td width="20%">发放方式</td>
			<td width="40%"><%=ship.getShipStype()%></td>
		</tr>
		<tr height="25px">
			<td width="10%">要求</td>
			<td width="90%" colspan="3"><%=ship.getShipRequest()%></td>
		</tr>
	</table>
	<table width="95%">
		<tr align="center">
			<td colspan="2"><input type="button"
				onclick="window.location.href='teacher/audit.action?type=scholarship&action=audit&status=true'"
				value="通过"></td>
			<td colspan="2"><input type="button"
				onclick="window.location.href='teacher/audit.action?type=scholarship&action=audit&status=false'"
				value="不通过"></td>
		</tr>
	</table>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>