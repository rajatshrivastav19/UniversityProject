<%-- 
    Document   : StudentMainPage
    Created on : Feb 8, 2021, 3:01:00 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html> 
    <head>
        <link rel="stylesheet" href="StudentFront.css">
        <link rel="stylesheet" href="table.css">
       <nav>
           <img src="logoblue.jpg" height="120" width="140" align="right">
          
                <input type="checkbox" id="click">
                <label for="click" class="menu-btn">
                    <i class="fas fa-bars"></i>
                </label>
              <ul>
                <li><form action="#"><a class="active"><% out.println(session.getAttribute("fn")+" "+session.getAttribute("ln")); %></a></form></li>
                <li><a href="UpdateProfile.jsp">Update Profile</a></li>
                <li><a href="#">Semester Examination Registration</a></li>
                <li><a href="StudentGiveExam.jsp">Give Exam</a></li>
                <li><a href="../index.html">LogOut</a></li>
              </ul>
           <img src="Phule.jpg" height="120" width="130" align="left">
        </nav> 
        <style>
           /*  body {
                    background-color: #FFB330;
                  }*/
        </style>
      </head>
<body> 
       <div class="maindiv"> 
    <center>
    <h1> Student Profile </h1>
    <%@page import="java.io.PrintWriter"%>
    <%@page import="java.sql.*,java.util.*" %>

      

        <%
             String email = session.getAttribute("StudentEmail").toString();
             
             int Sp = Integer.parseInt(session.getAttribute("StudentPassword").toString());
             
             Class.forName("com.mysql.cj.jdbc.Driver");
             
             Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");
    
             Statement st=con.createStatement();
    
             ResultSet rs = st.executeQuery("select * from STUDENT_REGISTRATION_TABLE");
    int i=0;
    while(rs.next())
    {
        if(email.equals(rs.getString("STUDENT_EMAIL")) && Sp ==(rs.getInt("PASSWORD")))
        {
            i=1;
            out.println("<table border = "+1+" bordercolor = "+"green"+" width="+400+">"+                 
        "<thead>"+
         "<tr>"+
            "<th>Student</th>"+
            "<th>Information</th>"+      
         "</tr>"+
         "</thead>"+
          "<tbody>"+
         "<tr>"+
            "<td>STUDENT NAME</td>"+
            "<td>"+rs.getString("FIRST_NAME")+" "+rs.getString("LAST_NAME")+"</td>"+
         "</tr>"+
         
         "<tr>"+
            "<td>FATHER NAME</td>"+
            "<td>"+rs.getString("FATHER_NAME")+"</td>"+
         "</tr>"+
          
         "<tr>"+
            "<td>MOTHER NAME</td>"+
            "<td>"+rs.getString("MOTHER_NAME")+"</td>"+
         "</tr>"+
         
         "<tr>"+
            "<td>ADDRESS   :</td>"+
            "<td>"+rs.getString("ADDRESS")+"</td>"+
         "</tr>"+
                    
         "<tr>"+
            "<td>AADHAR NUMBER:</td>"+
            "<td>"+rs.getString("AADHAR_NO")+"</td>"+
         "</tr>"+

         "<tr>"+
            "<td>MOBILE NUMBER   :</td>"+
            "<td>"+rs.getString("MOBILE_NO")+"</td>"+
         "</tr>"+
         
         "<tr>"+
            "<td>STUDENT EMAIL   :</td>"+
            "<td>"+rs.getString("STUDENT_EMAIL")+"</td>"+
         "</tr>"+
         
         "<tr>"+
            "<td>ENROLLROLMENT NUMBER   :</td>"+
            "<td>"+rs.getString("ENROLL_NO")+"</td>"+
         "</tr>"+
         
         "<tr>"+
            "<td>DEPARTMENT NAME   :</td>"+
            "<td>"+rs.getString("DEPT_NAME")+"</td>"+
         "</tr>"+    //error
                    
         "<tr>"+
            "<td>PASSWORD   :</td>"+
            "<td>"+rs.getInt("PASSWORD")+"</td>"+   
         "</tr>"+
           
          "<tr>"+
            "<td>image :</td>"+
            "<td>"+rs.getBlob("Student_Image")+"</td>"+
         "</tr>"+
         "</tbody>"+  
      "</table>"
            );
            
          String FIRST_NAME=rs.getString("FIRST_NAME").toString();
          String LAST_NAME=rs.getString("LAST_NAME").toString();
            
          session.setAttribute("fn",FIRST_NAME.toString());
          
          session.setAttribute("ln",LAST_NAME.toString());
          
          session.setAttribute("Enroll", rs.getInt("Enroll_no"));
          
            out.println("Login Successfully");
        }
    }
    if(i==0)
    {
            out.println("Email or pasword are incorrect or not Registered.....!!!");
    }
%>
  </center>

  </div>
    
</body> 
</html> 
