<%-- 
    Document   : TeacherLoginPage
    Created on : Feb 10, 2021, 8:50:33 PM
    Author     : Lenovo
--%>

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
                  <li><a href="TeacherLoginPage.jsp">TEACHER LOGIN</a></li>
                  <li><a href="TeacherRegistrationPage.jsp">REGISTRATION HERE</a></li>
              </ul>
              <img src="Phule.jpg" height="120" width="130" align="left">
        </nav> 
<body> 
 
    <form style="margin: 8px 90px 0" action="TeacherController.jsp" method="POST">
        <input type="hidden" name="page" value="GetOtp">
          
        <h2 align="center">TEACHER LOGIN</h2>
        <div class="imgcontainer"> 
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar"> 
        </div> 

        <div class="container">

            <label ><b>TEACHER_EMAIL*</label> 
            <input style="margin: 8px -190px 0" align="center" type="text" placeholder="TEACHER_EMAIL*" name="TEACHER_EMAIL" required> </b>

            <button type="submit">GET LOGIN OTP</button>
        </div> 
        <div class="container" style="background-color:#f1f1f1"> 
            <button type="button" class="cancelbtn">Cancel</button> 
        </div> 
    </form> 
</body> 
</html> 
