<%-- 
    Document   : OTPPage
    Created on : Feb 8, 2021, 5:32:26 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<!DOCTYPE html> 
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
                  <li><a href="ForgetPassword.jsp">FORGET PASSWORD</a></li>
              </ul>
              <img src="Phule.jpg" height="120" width="130" align="left">
        </nav> 
<body> 

    <form action="StudentControllerPage.jsp" method="POST"> 
        <input type="hidden" name="page" value="EmailValidation">
        <h2 align="center">Forget Pasword*</h2>
        <div class="imgcontainer"> 
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar"> 
        </div> 
        <div class="container">
            <label><b>Username*</label> 
            <input type="text" placeholder="Enter Email" name="STUDENT_EMAIL" required> </b>
            <button type="submit">Get OTP</button>    
        </div> 
        <div class="container" style="background-color:#f1f1f1"> 
            <button type="button" class="cancelbtn">Cancel</button> 
        </div> 
    </form> 
</body> 
</html> 
