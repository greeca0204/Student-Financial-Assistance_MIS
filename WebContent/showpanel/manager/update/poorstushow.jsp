<%@page import="com.slg.zxgl.entity.PoorStudentInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center" style="margin-top: 10px">
	<%
		PoorStudentInfo poorstu = (PoorStudentInfo) session.getAttribute("show");
		if (poorstu != null) {
	%><!--manager/update.action-->
	<form action="manager/update.action">
		<table width="95%">
			<tr height="30px">
				<td><a href="manager/update.action?action=return&type=poorstu">返回</a></td>
				<th colspan="3">贫困生详细信息</th>
			</tr>
			<tr style="background-color: #aaaaaa" height="25px">
				<th align="left" colspan="4">贫困生基本信息</th>
			</tr>
			<tr height="25px">
				<td width="15%">姓名</td>
				<td width="30%"><%=poorstu.getStuName()%></td>
				<td width="15%">学号</td>
				<td width="40%"><%=poorstu.getStuAccname()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">政治面目</td>
				<td width="30%"><%=poorstu.getStuPoliticsStatus()%></td>
				<td width="15%">民族</td>
				<td width="40%"><%=poorstu.getStuNationality()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">性别</td>
				<td width="30%"><%=poorstu.getStuGender()%></td>
				<td width="15%">身份证号码</td>
				<td width="40%"><%=poorstu.getStuIdentification()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">手机号码</td>
				<td width="30%"><%=poorstu.getStuPhone()%></td>
				<td width="15%">地址</td>
				<td width="40%"><%=poorstu.getStuAddress()%></td>
			</tr>
			<tr style="background-color: #aaaaaa" height="25px">
				<th align="left" colspan="4">贫困生专业信息</th>
			</tr>
			<tr height="25px">
				<td width="15%">班级</td>
				<td width="85%" colspan="3"><%=poorstu.getStuClassName()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">年级</td>
				<td width="85%" colspan="3"><%=poorstu.getStuGradename()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">学院</td>
				<td width="85%" colspan="3"><%=poorstu.getStuCollegename()%></td>
			</tr>
			<tr height="25px">
				<td width="15%">专业</td>
				<td width="85%" colspan="3"><%=poorstu.getStuMajorname()%></td>
			</tr>
			<tr style="background-color: #aaaaaa" height="25px">
				<th align="left" colspan="4">贫困生贫困信息</th>
			</tr>
			<tr height="25px">
				<td width="15%">家庭年收入</td>
				<td width="30%"><input size="5px" name="homeincome"
					onKeyPress="if((event.keyCode<48 || event.keyCode>57) && event.keyCode!=46 || /\.\d\d$/.test(value))event.returnValue=false"
					value="<%=poorstu.getPoorHomeIncome()%>" />元/年</td>
				<td width="15%">家庭人数</td>
				<td width="40%"><input size="5px" name="homepeople"
					onkeyup="this.value=this.value.replace(/\D/g, '')"
					value="<%=poorstu.getPoorHomePeople()%>" />人</td>
			</tr>
			<tr height="25px">
				<td width="15%">贫困等级</td>
				<td width="85%" colspan="3"><select name="poorgrade">
						<option value="1" <%if (poorstu.getPoorGrade() == 1) {%>
							selected="selected" <%}%>>一般困难</option>
						<option value="2" <%if (poorstu.getPoorGrade() == 2) {%>
							selected="selected" <%}%>>困难</option>
						<option value="3" <%if (poorstu.getPoorGrade() == 3) {%>
							selected="selected" <%}%>>特别困难</option>
				</select></td>
			</tr>
			<tr align="center" height="30px">
				<td colspan="2"><input type="hidden" name="id"
					value="<%=poorstu.getId()%>" /> <input type="hidden"
					name="type" value="poorstu" /> <input type="hidden" name="action"
					value="update" /><input type="submit" value="修改" /></td>
				<td colspan="2"><input type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>