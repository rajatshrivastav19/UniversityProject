<%-- 
    Document   : AdminController
    Created on : Jan 31, 2021, 7:40:39 PM
    Author     : Lenovo
--%>

<%@page import="adminPackage.AdminLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(request.getParameter("page").toString().equals("adminpage"))
    {
    String adminID= (request.getParameter("AdminID").toString());
    String adminPass= (request.getParameter("password").toString());
    
    adminPackage.AdminLogin a1= new AdminLogin();   //make object of java class
    
        if(a1.loginValidationAdmin(adminID,adminPass)) // call function
        {
            session.setAttribute("status","Successfully login......!!");
            session.setAttribute("adminname",adminID);
            response.sendRedirect("AdminMainPage.jsp");
        }
        else
        {
            request.getSession().setAttribute("status",-1);
            response.sendRedirect("AdminLogin.jsp?value=2");
        }
    }
%>