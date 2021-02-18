<%-- 
    Document   : TeacherMainPage
    Created on : Feb 11, 2021, 5:07:47 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!DOCTYPE html> 
<html> 

        <link rel="stylesheet" href="StudentFront.css">
        <link rel="stylesheet" href="table.css">
       <nav>
        <img src="logoblue.jpg" height="120" width="140" align="right">
          
                <input type="checkbox" id="click">
                <label for="click" class="menu-btn">
                    <i class="fas fa-bars"></i>
                </label>
              <ul>
                  <li><a href="../index.html">HOME</a></li>
                  <li><a href="FeatchStudent.jsp">FEATCH STUDENT</a></li>
                  <li><a href="AddQustionPaper.jsp">ADD QUSTION PAPER</a></li>
                  <li><a href="&*">SEND RESULT</a></li>
                  <li><a href="#">PLACEMENTS</a></li>
                  <li><a href="#">QUREY</a></li>
              </ul>
              <img src="Phule.jpg" height="120" width="130" align="left">
        </nav>
<body>
    
   <% 
       try
       {
       Class.forName("com.mysql.cj.jdbc.Driver");
                        
                        
                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "tiger");
                        
                        String email = session.getAttribute("TeacherEmail").toString();
                        
                        String CreateProfileTable = "SELECT * FROM TEACHER_REGISTRATION_TABLE";
                        
                        
                        PreparedStatement ps = conn.prepareStatement(CreateProfileTable);
                        
                        
                        ResultSet rs=ps.executeQuery();
                        
                        
                        String otp= session.getAttribute("OTP").toString();
                        out.print(email);
                          while(rs.next())
                          {
                                out.println("<table border = "+1+" bordercolor = "+"green"+" width="+400+">"+                 
                                                "<thead>"+
                                                "<tr>"+
                                                  "<th>Teacher</th>"+
                                                  "<th>Information</th>"+      
                                                "</tr>"+
                                               "</thead>"+
                             
                                               "<tr>"+
                                                 "<td>FATHER NAME</td>"+
                                                 "<td>"+rs.getInt("TID")+"</td>"+
                                               "</tr>"+
                             
                                                 "<tbody>"+
                                                 "<tr>"+
                                                 "<td>STUDENT NAME</td>"+
                                                 "<td>"+rs.getString("FIRST_NAME")+" "+rs.getString("LAST_NAME")+"</td>"+
                                                 "</tr>"+
         
                                                 "<tr>"+
                                                 "<td>FATHER NAME</td>"+
                                                 "<td>"+rs.getString("TEACHER_EMAIL")+"</td>"+
                                                 "</tr>"+
          
                                                 "<tr>"+
                                                 "<td>MOTHER NAME</td>"+
                                                 "<td>"+rs.getString("MOBILE_NO")+"</td>"+
                                                 "</tr>"+
         
                                                 "<tr>"+
                                                 "<td>ADDRESS   :</td>"+
                                                 "<td>"+rs.getString("QUALIFICATION")+"</td>"+
                                                 "</tr>"+
                    
                                                 "<tr>"+
                                                 "<td>AADHAR NUMBER:</td>"+
                                                 "<td>"+rs.getString("DEPT_NAME")+"</td>"+
                                                 "</tr>"+
           
                                                "<tr>"+
                                                "<td>image :</td>"+
                                                "<td>"+rs.getBlob("TEACHER_Image")+"</td>"+
                                                "</tr>"+
                                          "</tbody>"+  
                                      "</table>"
                                );
                            }
                       
      }
       catch(Exception e)
       {
           out.print("Error : "+e.getMessage());
       }
                     %>
</body> 
</html> 