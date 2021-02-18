<%-- 
    Document   : IDVerificationTeacherRegistrationPage
    Created on : Feb 10, 2021, 8:40:07 PM
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
        <input type="hidden" name="page" value="VerifyUniqueID">
        <h2 align="center">E-Mail Verification</h2>
        <div class="imgcontainer"> 
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar"> 
        </div> 
            <%  if(session.getAttribute("status").equals("Inserted"))
                     out.print(session.getAttribute("InsertedStudent"));
                if(session.getAttribute("status").equals("EmailSend"))
                     out.print(session.getAttribute("EmailSendsuccessfully"));
                if(session.getAttribute("status").equals("AccountAlreadyExits"))
                     out.print(session.getAttribute("AlreadyExist"));
                if(session.getAttribute("status").equals("NotInserted"))
                     out.print(session.getAttribute("notinserted"));
                if(session.getAttribute("status").equals("IncorrectValue"))
                     out.print(session.getAttribute("EnterCorrectValue"));
                
                 
               String TID= session.getAttribute("RendomString").toString();
               String email = session.getAttribute("sendemail").toString();
               out.print(TID);
               out.print(email);
                session.setAttribute("RendomString", TID);
                session.setAttribute("sendemail", email);
                
                
                
            %>
        <div class="container">

            <label ><b>TEACHER ID*</label> 
            <input style="margin: 8px -160px 0" align="center" type="text" placeholder="Unique ID*" name="UniqueID" required> </b>

            <button type="submit">Next</button>
        </div> 
        <div class="container" style="background-color:#f1f1f1"> 
            <button type="button" class="cancelbtn">Cancel</button> 
        </div> 
    </form> 
</body> 
</html> 