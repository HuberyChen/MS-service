<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@include file="checkTeacher.jsp"%>
<%
   String errorMsg="";
   String sql="";
   int questionID;
   DataConnection dataConn=new DataConnection();
   if(request.getParameter("questionID")!=null)
   {
       sql="delete from questionselect where questionID="+request.getParameter("questionID");
       dataConn.excute(sql);
       errorMsg="";
   }
   if(request.getParameter("questionname")!=null)
   {
       sql="select * from questionselect where questionname='"+request.getParameter("questionname")+"'";
       dataConn.excuteQuery(sql);
       if(dataConn.getRs().next())
       {
           errorMsg="增加试题失败，该试题已经存在！";
       }
       else
       {
           sql="insert into questionselect(questionname,questiontype,questionlevel,question1,question2,question3,question4,answer) value('"+request.getParameter("questionname")+"','"+request.getParameter("questiontype")+"','"+request.getParameter("questionlevel")+"','"+request.getParameter("question1")+"','"+request.getParameter("question2")+"','"+request.getParameter("question3")+"','"+request.getParameter("question4")+"','"+request.getParameter("answer")+"')";
            dataConn.excute(sql);
            errorMsg="增加试题成功！";
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
                        <table border="0" cellspacing="2">
                                <tr>
                                    <td width="198" valign="top">
                                       <fieldset>
                                           试题列表
                                           <table border="1" width="100%">
                                               <thead>
                                                   <tr>
                                                       <th>ID</th>
                                                       <th>试题名称</th>
                                                       <th>难度</th>
													   <th>范围</th>
                                                       <th>操作</th>
                                                   </tr>
                                               </thead>
                                               <tbody>
<%
       sql="select questionID,questionname,questionlevel,questiontype from questionselect";
       dataConn.excuteQuery(sql);
       while(dataConn.getRs().next())
       {
           questionID=dataConn.getRs().getInt("questionID");
%>
                                                   <tr>
                                                       <td><%=questionID%></td>
                                                       <td><%=Tools.toChinese(dataConn.getRs().getString("questionname"))%></td>
													   <td><%=dataConn.getRs().getString("questionlevel")%></td>
                                                       <td><%=dataConn.getRs().getString("questiontype")%></td>
                                                       <td>
                                                           <a href="questionSelectManger.jsp?questionID=<%=questionID%>">删除</a>
                                                       </td>
                                                   </tr>
<%
       }
%>
                                               </tbody>
                                           </table>
                                       </fieldset>                                   
                                  </td>
                                    <td width="260" valign="top">
                                       <fieldset>
                                           增加试题
                                           <div align="center"><font color="#ff0000"><%=errorMsg%></font></div>
                                        <form name="addSubjectForm" method="POST">
                                           <div>
                                               <ul>
                                                 <li>题目:
                                                   <label>
                                                   <textarea name="questionname"></textarea>
                                                   </label>
                                                 </li>
                                                   <li>选项：
                                                     <label>
                                                     <br>
                                                     A
                                                     <input type="text" name="question1">
</label>
                                                     <label><br>
                                                     B
                                                     <input type="text" name="question2">
                                                     </label>
                                                     <label><br>
                                                     C
                                                     <input type="text" name="question3">
                                                     </label>
                                                     <label><br>
                                                     D
                                                     <input type="text" name="question4">
                                                     </label>
                                                   </li>
                                                   <li>难度：
                                                     <label>
                                                     <select name="questionlevel">
                                                       <option value="A">困难</option>
                                                       <option value="B">中等</option>
                                                       <option value="C">简单</option>
                                                     </select>
                                                       </label>
                                                     </li>
                                                   <li>范围：
                                                     <input type="text" name="questiontype" />
                                                   </li>
                                                   <li>答案：                                                     
                                                     <select name="answer">
                                                       <option value="A">A</option>
                                                       <option value="B">B</option>
                                                       <option value="C">C</option>
                                                       <option value="D">D</option>
                                                                                                          </select>
                                                     <br/>
                                                   </li>
                                                 <li>
                                                     <input type="submit" value="增加" />
                                                 </li>
                                               </ul>
                                          </div>
                                       </form>
                                      </fieldset>                                    
                                  </td>
                                </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td><%@include file="footer.jsp"%></td>
                </tr>
        </table>
    </body>
</html>