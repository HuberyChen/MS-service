<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" type="text/javascript">
	function pagejump() {
		var str=document.form1.choice.value;
		if(str=="select"){
			window.location.href="questionSelectManger.jsp";
		}
		if(str=="blank"){
			alter("hello");
		}
		
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>计算机组成原理题库管理系统</title>
</head>
<body>
	<table border="0" align="center">
		<tr>
			<td><%@include file="header.jsp"%></td>
		</tr>
		<tr>
			<td><br />
				<div align="center">
					<fieldset>
						<form name="form1" action="" method="post">
							试题类型:&nbsp;&nbsp; <select name="choice">
								<option value="select">选择题</option>
								<option value="blank">填空题</option>
							</select>&nbsp;&nbsp; <input type="button" value="确定" onclick="pagejump()">
						</form>
					</fieldset>
				</div></td>
		</tr>
		<tr>
			<td><%@include file="footer.jsp"%></td>
		</tr>
	</table>
</body>
</html>