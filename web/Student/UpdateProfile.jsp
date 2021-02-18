<%@page import="com.mysql.cj.xdevapi.SelectStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html> 
<html> 

        <link rel="stylesheet" href="StudentFront.css">
       <nav>
        <img src="logoblue.jpg" height="120" width="140" align="right">
          
                <input type="checkbox" id="click">
                <label for="click" class="menu-btn">
                    <i class="fas fa-bars"></i>
                </label>
              <ul>
                  <li><a href="../index.html">HOME</a></li>
                  <li><a href="#">TEACHER LOGIN</a></li>
                  <li><a href="#">REGISTRATION HERE</a></li>
                  <li><a href="#">FORGET PASWORD</a></li>
                  <li><a href="#">ALUMINI</a></li>
              </ul>
              <img src="Phule.jpg" height="120" width="130" align="left">
        </nav> 
<body> 
        <% 
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");
         %>
                    
        <% int enroll=  Integer.parseInt(session.getAttribute("Enroll").toString()); %>
        <% String en=session.getAttribute("Enroll").toString(); %>
                    
    <form style="margin: 8px 90px 0" action="#"> 
        
        <%
                String sql = "SELECT * FROM Student_registration_table WHERE ENROLL_NO= '"+enroll+"'";
                PreparedStatement st = con.prepareStatement(sql);
                ResultSet rs= st.executeQuery();
        while(rs.next())
        {       
        %>
        <h2 align="center">UPDATE PROFILE</h2>
        <div class="imgcontainer"> 
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar"> 
        </div>
        <input type="hidden" name="page" value="2">
           <div class="container">
          
            <label ><b>ENROLL_NO</label> 
            <input style="margin: 8px -160px 0" align="center" type="text" value='<%=rs.getString("ENROLL_NO")%>' name="ENROLL_NO" readonly> </b>  
               
            <label ><b>FIRST_NAME</label> 
            <input style="margin: 8px -160px 0" align="center" type="text" value='<%=rs.getString("FIRST_NAME")%>' name="FIRST_NAME" required=""> </b>

            <label><b>LAST_NAME</label>
            <input  style="margin: 8px -160px 0" type="text" value='<%=rs.getString("LAST_NAME")%>' name="LAST_NAME" required> </b>

            <label><b>FATHER_NAME*</label> 
            <input  style="margin: 8px -200px 0" type="text" value='<%=rs.getString("FATHER_NAME")%>' name="FATHER_NAME" required> </b>

            
            <label><b>MOBILE_NO</label> 
            <input style="margin: 8px -160px 0" type="text" value='<%=rs.getString("MOBILE_NO")%>' name="MOBILE_NO" required> </b>
            
            <label><b>AADHAR_NO</label> 
            <input style="margin: 8px -160px 0" type="text" value='<%=rs.getString("AADHAR_NO")%>' name="AADHAR_NO" required> </b>

            <label><b>STUDENT_EMAIL</label> 
            <input  style="margin: 8px -190px 0" type="text" value='<%=rs.getString("STUDENT_EMAIL")%>' name="STUDENT_EMAIL" required> </b>
         

            <label><b>GUAR_EMAIL</label> 
            <input style="margin: 8px -160px 0" type="text" value='<%=rs.getString("GUARDIAN_EMAIL")%>' name="GUARDIAN_EMAIL" required> </b>
       

            <label><b>HOME_ADDRESS</label> 
            <input type="text" value='<%=rs.getString("ADDRESS")%>' name="ADDRESS"> </b>
        <%
          }  
         %>   

            <button type="submit">Update</button>
        </div> 
       
          <div class="container" style="background-color:#f1f1f1"> 
            <button type="button" class="cancelbtn">Cancel</button> 
            <span class="psw">Back to<a href="StudentMainPage.jsp">Profle?</a></span> 
        </div>
    </form> 
         
         <%
             try
             {
             
              String First_n = request.getParameter("FIRST_NAME").toString();
              String Last_n = request.getParameter("LAST_NAME").toString();
              String Fatcher_name = request.getParameter("FATHER_NAME").toString();
              String Mobile = request.getParameter("MOBILE_NO").toString();
              String Semail = request.getParameter("STUDENT_EMAIL").toString();
              String Gemail = request.getParameter("GUARDIAN_EMAIL").toString();
              String aadhar = request.getParameter("ADDRESS").toString();
              
              String update= "UPDATE STUDENT_REGISTRATION_TABLE SET FIRST_NAME= ?, LAST_NAME= ?, FATHER_NAME=?, MOBILE_NO= ?, STUDENT_EMAIL= ?, GUARDIAN_EMAIL= ?, ADDRESS= ?"
                                   + "WHERE ENROLL_NO= '"+enroll+"'";
              PreparedStatement smt = con.prepareStatement(update);
              smt.setString(1, First_n);
              smt.setString(2, Last_n);
              smt.setString(3, Fatcher_name);
              smt.setString(4, Mobile);
              smt.setString(5, Semail);
              smt.setString(6, Gemail);
              smt.setString(7, aadhar);
              smt.executeUpdate();
              response.sendRedirect("StudentMainPage.jsp?value=Update&successfully");
             }
             catch(Exception e)
             {
                 out.print(e.getMessage());
             }
         %>
         
</body> 
</html> 