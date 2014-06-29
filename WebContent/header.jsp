<%@page import="testMS.LoginInfo"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>

<div align="center" title="header">
<%
if(((LoginInfo)session.getAttribute("loginInfo")).isLogined()){
    String userType=((LoginInfo)session.getAttribute("loginInfo")).getUserType();
%>
    <%=((LoginInfo)session.getAttribute("loginInfo")).getUserName()%>
    &nbsp;|&nbsp;<a href="index.jsp">首页</a>
    &nbsp;|&nbsp;<a href="changePSW.jsp">修改密码</a>
    &nbsp;|&nbsp;<a href="logout.jsp">退出</a>
<%
   if(userType.compareTo("teacher")==0)
   {
%>
    &nbsp;|&nbsp;<a href="testManger.jsp">试题管理</a>
<%
   }
}else{
%>
    您尚未 &nbsp; 登录 &nbsp;注册学生用户
<%
}
%>
</div>