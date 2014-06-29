<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="testMS.*"%>
<%@include file="checkTeacher.jsp"%>
<%
   String errorMsg="";
   String sql=null;
   int teacherID;
   DataConnection dataConn=new DataConnection();
   if(request.getParameter("search")!=null)
   {
       sql="select teacherID,name,realName from teacher where 1=1";
       if(request.getParameter("name")!=null)
       {
           sql+=" and name like '%"+request.getParameter("name")+"%'";
       }
       if(request.getParameter("realName")!=null)
       {
           sql+=" and name like '%"+request.getParameter("realName")+"%'";
       }
       if(request.getParameter("subjectID").compareTo("0")!=0)
       {
           sql+=" and teacherID in (select teacherID from teacherRight where subjectID="+request.getParameter("subjectID")+")";
       }
   }
   if(request.getParameter("add")!=null)
   {
       if(request.getParameter("name")!=null && request.getParameter("realName")!=null && request.getParameter("password")!=null && request.getParameter("password").compareTo(request.getParameter("repassword"))==0)
       {
           String sql2="select * from teacher where name='"+request.getParameter("name")+"'";
           dataConn.excuteQuery(sql2);
           if(dataConn.getRs().next())
           {
               errorMsg="增加教师失败，该科目已经存在！";
           }
           else
           {
               sql2="insert into teacher(name,realName,password) value('"+request.getParameter("name")+"','"+request.getParameter("realName")+"','"+new MD5(request.getParameter("password")).compute()+"')";
                dataConn.excute(sql2);
                errorMsg="增加教师成功！";
           }
       }
       else
       {
           errorMsg="您的输入不正确";
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
                           教师查询
                           <form name="searchTeacherForn" method="POST">
                               <div>
                                    帐号:<input type="text" name="name"/>
                                    姓名:<input type="text" name="realName"/>
                                    科目:<select name="subjectID">
                                           <option value="0">所有科目</option>
<%
    String sql3="select subjectID,name from subject";
    dataConn.excuteQuery(sql3);
    while(dataConn.getRs().next())
    {
%>
                                           <option value="<%=dataConn.getRs().getString("subjectID")%>"><%=Tools.toChinese(dataConn.getRs().getString("name"))%></option>
<%
    }
%>
                                       </select>
                                       <input type="submit" name="search" value="查询" />
                               </div>
                           </form>
                           <table border="1" width="100%">
                               <thead>
                                   <tr>
                                       <th>ID</th>
                                       <th>帐号</th>
                                       <th>姓名</th>
                                       <th>操作</th>
                                   </tr>
                               </thead>
                               <tbody>
<%
       if(sql!=null)
       {
           dataConn.excuteQuery(sql);
           while(dataConn.getRs().next())
           {
               teacherID=dataConn.getRs().getInt("teacherID");
%>
                                   <tr>
                                       <td><%=teacherID%></td>
                                       <td><%=Tools.toChinese(dataConn.getRs().getString("name"))%></td>
                                       <td><%=Tools.toChinese(dataConn.getRs().getString("realName"))%></td>
                                       <td>
                                           <a href="teacherManage.jsp?teacherID=<%=teacherID%>">删除</a>
                                       </td>
                                   </tr>
<%
           }
       }
%>
                               </tbody>
                           </table>

                       </fieldset>
                       <br/>
                       <fieldset>
                           增加教师
                        <div align="center"><font color="#ff0000"><%=errorMsg%></font></div>
                        <form name="addTeacherForm" method="POST">
                           <div>
                               <ul>
                                   <li>
                                       帐号：<input type="text" name="name" />
                                   </li>
                                   <li>
                                       姓名：<input type="text" name="realName" />
                                   </li>
                                   <li>
                                       密码：<input type="password" name="password" />
                                   </li>
                                   <li>
                                       确认密码：<input type="password" name="repassword" />
                                   </li>
                                   <li>
                                       <input type="submit" name="add" value="增加" />
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