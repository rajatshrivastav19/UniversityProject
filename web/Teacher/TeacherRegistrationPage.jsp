<%-- 
    Document   : TeacherRegistrationPage
    Created on : Feb 10, 2021, 8:37:49 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <input type="hidden" name="page" value="TeacherRegistration">
        <h2 align="center">REGISTRATION</h2>
        <div class="imgcontainer"> 
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar"> 
        </div> 
           <%-- if(session.getAttribute("status").equals("AccountAlreadyExits"))
                     out.print(session.getAttribute("AlreadyExist"));
           
                if(session.getAttribute("status").equals("Inserted"))
                     out.print(session.getAttribute("InsertedStudent"));
                
                     if(session.getAttribute("status").equals("EmailSend"))
                     out.print(session.getAttribute("EmailSendsuccessfully"));
                     
                    if(session.getAttribute("status").equals("NotInserted"))
                     out.print(session.getAttribute("notinserted"));
                    
                     if(session.getAttribute("status").equals("IncorrectValue"))
                     out.print(session.getAttribute("EnterCorrectValue"));
                     
                     if(session.getAttribute("status").equals("Correct"))
                     out.print(session.getAttribute("InsertedStudent"));
                     
                     if(session.getAttribute("status").equals("Enterworng"))
                     out.print(session.getAttribute("worngentry"));
               --%>
                
        <div class="container">
            <label><b>FIRST_NAME*</label>
            <input  style="margin: 0 -160px 0" type="text" placeholder="Fisrt Name*" name="FIRST_NAME" required> </b>
            
            <label><b>LAST_NAME*</label>
            <input  style="margin: 8px -160px 0" type="text" placeholder="Last Name*" name="LAST_NAME" required> </b>
            
            
             <label><b>ENTER_EMAIL*
            <input  style="margin: -8px 550px 0" type="email" placeholder="Teacher Email*" name="TEACHER_EMAIL" required> </b></label>
            

            <!--<label><b>EMAIL* 
            <input style="margin: -10px 550px 0"  type="email" placeholder="Teacher Email*" name="TEACHER_EMAIL" required> </b></label> -->

            <label><b>MOBILE_NO*</label> 
            <input style="margin: 8px -160px 0" type="text" placeholder="Mobile No*" name="MOBILE_NO" required> </b>
            

            <label><b>QUALIFICATION*</label> 
            <input  style="margin: 8px -190px 0" type="text" placeholder="Teacher Qualification*" name="QUALIFICATION" required> </b>
         

            <label><b>DEPT_NAME* 
            <input style="margin: 8px 240px 0" type="text" placeholder="Department Name*" name="DEPT_NAME" required> </b></label>
       

            <label><b>TEACHER_IMAGE*
            <input style="margin: 1px 550px 0" type="file" placeholder="Student image" name="Student_Image"> </b></label>
                       <button type="submit">Next</button>
        </div> 
        <div class="container" style="background-color:#f1f1f1"> 
            <button type="button" class="cancelbtn">Cancel</button>
        </div> 
    </form> 
</body> 
</html> 