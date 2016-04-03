<%@page import="com.slg.zxgl.entity.Teacher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="javascript">
function firm(k)
{
    if(confirm("是否删除该教职工信息？"))
    {
        location.href="manager/delete.action?teaid="+k+"&action=delete&type=tea";
    }
}
</script>
<div align="center" style="margin-top: 10px">
	<%
		Teacher tea = (Teacher) session.getAttribute("show");
		if (tea != null) {
	%><table width="95%">
		<tr height="30px">
			<td><a href="manager/search.action?action=return&type=tea">返回</a></td>
			<th colspan="2">教职工详细信息</th>
		</tr>
		<tr height="30px">
			<td></td>
			<td>职工号</td>
			<td width="80%"><%=tea.getaccname()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>姓名</td>
			<td width="80%"><%=tea.getName()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>所带班级</td>
			<td width="80%"><%=tea.getClassName()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>所在部门</td>
			<td width="80%"><%=tea.getDepartment()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>所在职位</td>
			<td width="80%"><%=tea.getPosition()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>职位职称</td>
			<td width="80%"><%=tea.getPositiontitle()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>手机号码</td>
			<td width="80%"><%=tea.getPhone()%></td>
		</tr>
		<tr height="30px">
			<td></td>
			<td>邮箱</td>
			<td width="80%"><%=tea.getEmail()%></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" align="center"><a
				href="manager/update.action?action=show&type=tea&id=<%=tea.getId()%>"><button>修改</button></a>&nbsp;&nbsp;&nbsp;
				<input type="submit" value="删除" onclick="firm(<%=tea.getId()%>)" /></td>
		</tr>
	</table>
	<%
		} else {
	%>系统错误<%
		}
	%>
</div>