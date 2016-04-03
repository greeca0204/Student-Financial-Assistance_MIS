<%@page import="com.slg.zxgl.entity.PoorStudentInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script language="javascript">
function firm(k)
{
    if(confirm("是否删除该学生的贫困生信息？"))
    {
        location.href="manager/delete.action?stuid="+k+"&action=delete&type=poorstu";
    }
}
</script>
<div align="center" style="margin-top: 10px">
	<%
		PoorStudentInfo poorstu = (PoorStudentInfo) session.getAttribute("show");
		if (poorstu != null) {
	%><table width="95%">
		<tr height="30px">
			<td><a href="manager/search.action?action=return&type=poorstu">返回</a></td>
			<th colspan="3">学生详细信息</th>
		</tr>
		<tr style="background-color: #aaaaaa" height="25px">
			<th align="left" colspan="4">学生基本信息</th>
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
			<th align="left" colspan="4">学生专业信息</th>
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
			<th align="left" colspan="4">学生贫困信息</th>
		</tr>
		<tr height="25px">
			<td width="15%">家庭年收入</td>
			<td width="30%"><%=poorstu.getPoorHomeIncome()%>元/年</td>
			<td width="15%">家庭人数</td>
			<td width="40%"><%=poorstu.getPoorHomePeople()%>人</td>
		</tr>
		<tr height="25px">
			<td width="15%">贫困等级</td>
			<td width="85%" colspan="3"><%=poorstu.getPoorName()%></td>
		</tr>
		<tr align="center" height="30px">
			<td colspan="2"><a
				href="manager/update.action?type=poorstu&action=show&stuid=<%=poorstu.getStuId()%>"><button>修改</button></a></td>
			<td colspan="2"><input type="submit" value="删除"
				onclick="firm(<%=poorstu.getStuId()%>)" /></td>
		</tr>
	</table>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>