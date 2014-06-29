<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="testMS.*"%>
<jsp:useBean id="loginInfo" scope="session" class="testMS.LoginInfo"/>
<%
   String errorMsg="";
   if(request.getParameter("errorMsg")!=null)
   {
       errorMsg=request.getParameter("errorMsg");
   }
   if(request.getParameter("userType")!=null)
   {
       String sql="select "+request.getParameter("userType")+"ID,password from "+request.getParameter("userType")+" where name='"+request.getParameter("userName")+"'";
       
       DataConnection dataConn=new DataConnection();
       dataConn.excuteQuery(sql);
       if(dataConn.getRs().next())
       {
/*     	   if(dataConn.getRs().getString("password").compareTo(new MD5(request.getParameter("password")).compute())==0) */
           if(dataConn.getRs().getString("password").equals(request.getParameter("password")))
           {
               ((LoginInfo)session.getAttribute("loginInfo")).login(dataConn.getRs().getInt(request.getParameter("userType")+"ID"),request.getParameter("userName"),request.getParameter("userType"));
               response.sendRedirect("index.jsp");
           }
           else
           {
               errorMsg="密码错误！";
           }
       }
       else
       {
           errorMsg="该帐号不存在！";
       }
   }
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
                           用户登录
                        <div align="center"><font color="#ff0000"><%=errorMsg%></font></div>
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
                    </td>
                </tr>
                <tr>
                    <td><%@include file="footer.jsp"%></td>
                </tr>
        </table>
    </body>
</html>

