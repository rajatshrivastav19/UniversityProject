<%-- 
    Document   : a
    Created on : Feb 13, 2021, 10:39:51 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
       <% 
           int a=  Integer.parseInt(session.getAttribute("Enroll").toString()); 
           String b=session.getAttribute("ln").toString();
           out.print(a);
           out.print(b);
            
       %>
    </body>
</html>
