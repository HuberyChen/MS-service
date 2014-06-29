<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="testMS.*"%>
<%
((LoginInfo)session.getAttribute("loginInfo")).logout();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>计算机组成原理题库管理系统</title>
    </head>
    <body>
    <table border="0" align="center">
                <tr>
                    <td><%@include file="header.jsp"%></td>
                </tr>
                <tr>
                    <td>
                       <fieldset>
                           <div align="center">
                           <ul><li>再见！</li>
                               <li><a href="index.jsp">返回主页</a></li></ul>                          
                           </div>    
                       </fieldset>
                       <br/>
                    </td>
                </tr>
                <tr>
                    <td><%@include file="footer.jsp"%></td>
                </tr>
        </table>
    </body>
</html>
