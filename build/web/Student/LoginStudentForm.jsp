<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                  <li><a href="LoginStudentForm.jsp">STUDENT LOGIN</a></li>
                  <li><a href="StudentRegistrationPage.jsp">REGISTRATION</a></li>
                  <li><a href="ForgetPassword.jsp">FORGET PASWORD</a></li>
              </ul>
              <img src="Phule.jpg" height="120" width="130" align="left">
        </nav> 
        <style>
             
        </style>
<body> 
 <% Date today = new Date();%>
    <form style="margin: 0 150px 50px" action="StudentControllerPage.jsp" method="POST">
        <input type="hidden" name="page" value="Studentlogin" >
        <h2 align="center">Login Form</h2>
        <div class="imgcontainer"> 
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar"> 
        </div> 
        <p <%= today %> >
        <div class="container">
            <label><b>Username*</label> 
            <input type="text" placeholder="Enter Email" name="STUDENT_EMAIL" required> </b>
            <label><b>Password*</label> 
            <input type="password" placeholder="Enter Password" name="PASSWORD" required> </b>
            <button type="submit">Login</button>    
        </div> 
        <div class="container" style="background-color:#f1f1f1"> 
            <button style="align-self: center" type="button" class="cancelbtn">Cancel</button> 
            <span class="psw">Forgot <a href="#">password?</a></span> 
        </div> 
    </form
</body> 
</html> 