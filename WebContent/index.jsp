<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="testMS.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="loginInfo" scope="session" class="testMS.LoginInfo"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>计算机组成题库管理系统</title>
    </head>
    <body>
        <table border="0" align="center">
                <tr>
                    <td><%@include file="header.jsp"%></td>
                </tr>
                <tr>
                    <td>
                       <br/>
<%
   if(!loginInfo.isLogined())
   {
%>
                       <fieldset>
                           用户登录
                        <form name="loginForm" action="login.jsp" method="POST">
                           <div>
                               <ul>
                                   <li>
                                       帐号：<input type="text" name="userName" />
                                   </li>
                                   <li>
                                       密码：<input type="password" name="password" />
                                   </li>
                                   <li>
                                       用户类型：<select name="userType">
                                           <option value="student">学生</option>
                                           <option value="teacher">教师</option>
                                       </select>
                                       <input type="submit" value="登录" />
                                   </li>
                               </ul>
                           </div>
                           </form>
                        </fieldset>
<%
   }
%>
                    </td>
                </tr>
                <tr>
                    <td><%@include file="footer.jsp"%></td>
                </tr>
        </table>
    </body>
</html>
