<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@include file="checkLogin.jsp"%>
<%
   String errorMsg="";
   if(request.getParameter("oldPassword")!=null && request.getParameter("newPassword").compareTo(request.getParameter("rePassword"))==0)
   {
/*        String oldPassword=new MD5(request.getParameter("oldPassword")).compute();
       String newPassword=new MD5(request.getParameter("newPassword")).compute(); */
       String oldPassword=request.getParameter("oldPassword");
       String newPassword=request.getParameter("newPassword");
       String sql="select password from "+((LoginInfo)session.getAttribute("loginInfo")).getUserType()+" where "+((LoginInfo)session.getAttribute("loginInfo")).getUserType()+"ID="+((LoginInfo)session.getAttribute("loginInfo")).getUserID();
       DataConnection dataConn=new DataConnection();
       dataConn.excuteQuery(sql);
       if(dataConn.getRs().next())
       {
           if(dataConn.getRs().getString("password").compareTo(oldPassword)==0)
           {
               sql="update "+((LoginInfo)session.getAttribute("loginInfo")).getUserType()+" set password='"+newPassword+"' where "+((LoginInfo)session.getAttribute("loginInfo")).getUserType()+"ID="+((LoginInfo)session.getAttribute("loginInfo")).getUserID();
               dataConn.excute(sql);
               errorMsg="密码修改成功！";
           }
           else
           {
               errorMsg="密码修改失败，您输入的原密码不正确！";
           }
       }
   }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>阳光题库管理系统</title>
    </head>
    <body>
        <table border="0" width="500" align="center">
                <tr>
                    <td><%@include file="header.jsp"%></td>
                </tr>
                <tr>
                    <td>
                       <fieldset>
                           修改密码：
                           <div align="center"><font color="#ff0000"><%=errorMsg%></font></div>
                           <form name="changePswForm" method="POST">
                           <div>
                               <ul>
                                   <li>
                                       原密码：<input type="password" name="oldPassword" />
                                   </li>
                                   <li>
                                       新密码：<input type="password" name="newPassword" />
                                   </li>
                                   <li>
                                       确认新密码：<input type="password" name="rePassword" />
                                   </li>
                                   <li>
                                       <input type="submit" value="确定" />
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

