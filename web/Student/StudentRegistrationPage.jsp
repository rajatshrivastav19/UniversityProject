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
                  <li><a href="ForgetPassword.jsp">FORGET PASSWORD</a></li>
              </ul>
              <img src="Phule.jpg" height="120" width="130" align="left">
        </nav> 
<body> 
   
                        
                    <%  /*  if(session.getAttribute("status").equals("inserted"))
                          out.print(session.getAttribute("Successfull"));
                        if(session.getAttribute("status").equals("notinserted"))
                            out.print(session.getAttribute("AlreadyExist"));
                        if(session.getAttribute("status").equals("Entercorrectdetails"))
                            out.print(session.getAttribute("correctDetail"));
                        if(session.getAttribute("status").equals("NullValue"))
                            out.print(session.getAttribute("nullvalue")); */ %>
                            
                        
    <form action="StudentControllerPage.jsp">
        <input  type="hidden" name="page" value="studentregistration">
        <h2 align="center">Student Registration</h2>
        <div class="imgcontainer"> 
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar">
        </div>
        <div class="container">

    <label><b>FIRST_NAME*</label> 
    <input style="margin: 8px -230px 0" type="text" placeholder="FIRST_NAME" name="FIRST_NAME" required> </b>

    <label><b>LAST_NAME*</label> 
    <input style="margin: 8px -225px 0" type="text" placeholder="LAST_NAME" name="LAST_NAME"  required> </b>

    <label><b>FATHER_NAME*</label> 
    <input style="margin: 8px -243px 0" type="text"  placeholder="FATHER_NAME" name="FATHER_NAME" required> </b>

    <label><b>MOTHER_NAME*</label> 
    <input style="margin: 8px -238px 0" type="text" name="MOTHER_NAME" placeholder="MOTHER_NAME" required> </b>

    <label><b>ADDRESS*</label> 
    <input style="margin: 8px -190px 0" type="text" name="ADDRESS" placeholder="ADDRESS" required> </b>

    <label><b>MOBILE_NO*</label> 
    <input type="text" name="MOBILE_NO" placeholder="MOBILE_NO" required> </b>

    <label><b>STUDENT_EMAIL*</label> 
    <input style="margin: 8px -243px 0" type="text" name="STUDENT_EMAIL" placeholder="STUDENT_EMAIL*" required> </b>

    <label><b>GUARDIAN_EMAIL*</label> 
    <input style="margin: 8px -246px 0" type="text" name="GUARDIAN_EMAIL" placeholder="GUARDIAN_EMAIL*" required> </b>

    <label><b>AADHAR_NO*</label>
    <input  type="text" name="AADHAR_NO" placeholder="AADHAR_NO" required> </b>

    <label><b>QUALIFICATION*</label>
    <input style="margin: 8px -220px 0"  type="text" name="QUALIFICATION" placeholder="QUALIFICATION" required></b>

    <label><b>MARKS*</label>
    <input  type="text" name="MARKS" placeholder="MARKS" required></b>

    <label><b>ENROLL_NO*</label>
    <input  type="text" name="ENROLL_NO" placeholder="ENROLL_NO*" required></b>

    <label><b>CATEGORY*</label>
    <input  type="text" name="CATEGORY" placeholder="CATEGORY" required></b>

    <label><b>UPTU_ROLL*</label>
    <input  type="text" name="UPTU_ROLL" placeholder="UPTU_ROLL" required></b>

    <label><b>UPTU_RANK*</label>
    <input  type="text" name="UPTU_RANK" placeholder="UPTU_RANK" required></b>

    <label><b>UPTU_MARKS*</label>
    <input  type="text" name="UPTU_MARKS" placeholder="UPTU_MARKS" required></b>
     
    <label><b>UNIVERSITY_NAME*</label>
    <input  type="text" name="UNIVERSITY_NAME" placeholder="UNIVERSITY_NAME*" required></b>
     
    <label><b>DEPT_NAME*</label>
    <input  type="text" name="DEPT_NAME" placeholder="DEPT_NAME" required></b>

    <label><b>STUDENT_SEMESTER*</label>
    <input  type="text" name="STUDENT_SEMESTER" placeholder="STUDENT_SEMESTER*" required></b>

    <label><b>YEAR*</label>
    <input type="text" name="YEAR" placeholder="YEAR" required></b>

    <label><b>STUDENT_FEE*</label>
    <input  type="text" name="STUDENT_FEE" placeholder="STUDENT_FEE" required></b>

    <label><b>Student_Image*</label>
    <input style="margin: 2px 500px 0" type="file" name="Student_Image" placeholder="Student_Image"></b>

    <label><b>Parents_image*</label>
    <input style="margin: 2px 500px 0" type="file" name="Parents_image" placeholder="Parents_image"></b>

    <label><b>PASSWORD*</label>
    <input  type="PASSWORD" name="PASSWORD" placeholder="PASSWORD" required></b>

    <button type="submit">Submit</button>    
        </div> 
    </form>  
</body> 
</html> 