<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="testMS.*"%>
<%
   if(!((LoginInfo)session.getAttribute("loginInfo")).isLogined()){
       response.sendRedirect("login.jsp");
   }
%>