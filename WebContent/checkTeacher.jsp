<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="testMS.*"%>
<%
   if(!((LoginInfo)session.getAttribute("loginInfo")).isLogined() || ((LoginInfo)session.getAttribute("loginInfo")).getUserType().compareTo("teacher")!=0){
       response.sendRedirect("login.jsp");
   }
%>