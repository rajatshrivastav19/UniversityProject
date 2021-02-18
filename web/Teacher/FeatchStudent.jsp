<%-- 
    Document   : FeatchStudent
    Created on : Feb 13, 2021, 12:02:14 AM
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
                  <li><a href="FeatchStudent.jsp">FEATCH STUDENTS</a></li>
                  <li><a href="&*">SEND RESULT</a></li>
                  <li><a href="#">PLACEMENTS</a></li>
                  <li><a href="#">QUREY</a></li>
              </ul>
              <img src="Phule.jpg" height="120" width="130" align="left">
        </nav> 
<body>

    <form  style="margin: 25px 50px 0PX" action="ApachePOIFeatchStudent.jsp" method="POST">
        <input type="hidden" name="page" value="MakeExelFile">
        <h2 align="center">FEATCH STUDENT</h2>
        <div class="imgcontainer">
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar">
        </div>
        <div class="container">
            <label><b>STUDENT_ENROLL ID*</label>
            <input type="text" placeholder="ENTER ENROLL NUMBER ID**" name="ENROLL_NO" required> </b>
                
             <label><b>ENTER_EMAIL_ID**</label>
             <input style="margin: -10px 580px 0" type="text" placeholder="ENTER ANY EMAIL ID**" name="EMAILID" required> </b>
            <button type="submit">Send Excel File</button> 
        </div> 
        <div class="container" style="background-color:#f1f1f1"> 
            <center><p> Make Excel File Of Any Student </p></center>
            <button type="button" class="cancelbtn">Cancel</button> 
        </div>
    </form>
</body> 
</html> 