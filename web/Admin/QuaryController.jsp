<%-- 
    Document   : QuaryController
    Created on : Feb 1, 2021, 12:52:06 PM
    Author     : Lenovo
--%>

<%@page import="adminPackage.EDUParents"%>
<%@page import="adminPackage.EDUTeacher"%>
<%@page import="adminPackage.EDUStudent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        if(request.getParameter("page").equals("adminmainpage"))
        {
            EDUStudent student= new EDUStudent();
            EDUTeacher teacher= new EDUTeacher();
            EDUParents parents= new EDUParents();
            
            String enrolID = request.getParameter("NumberID").toString();   //enroll num
            String person = request.getParameter("person").toLowerCase().toString(); //person student
            String quaryName = request.getParameter("quaryName").toLowerCase().toString();  //update
            
           //Student
           out.print("  ID: "+ enrolID);
            if( person.equals("student") && student.enrollVailedation(enrolID))  //EDU Students 1
            {
                        session.setAttribute("status",1);
                        session.setAttribute("enrollID", enrolID);
                        
                        if(quaryName.equals("update")) // udate
                            response.sendRedirect("UpdateStudent.jsp");
                        if(quaryName.equals("insert")) // inset
                            response.sendRedirect("InsetStudent.jsp");
                        if(quaryName.equals("delete"))
                            response.sendRedirect("DeleteStudent.jsp");    
            }
            else
            {
                        request.getSession().setAttribute("status",-1);
                        response.sendRedirect("AdminMainPage.jsp?value=2");
            }
        }
%>