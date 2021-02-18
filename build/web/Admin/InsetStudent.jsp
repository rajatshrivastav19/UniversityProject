<%-- 
    Document   : InseteStudent
    Created on : Feb 2, 2021, 6:26:44 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="Registration.css">
    <link rel="stylesheet" href="STUDENT.css">
    <nav>
        <img src="https://th.bing.com/th/id/OIP.snwpVqOyzR33lof7yvu0_wHaHa?pid=Api&rs=1" height="120" width="140" align="right">
          
                <input type="checkbox" id="click">
                <label for="click" class="menu-btn">
                    <i class="fas fa-bars"></i>
                </label>
          <ul>
              <li><a href="../index.html">HOME</a></li>
              <li><a href="#">ADMIN</a></li>
          </ul>
          <img src="https://th.bing.com/th/id/OIP.zA0l738afu1lYbnXVVOh4wHaER?pid=Api&rs=1" height="120" width="130" align="left">
  </nav>
  </head>
  <body>
<div class="login">
                        <%
                        
                        if(session.getAttribute("status").equals("inserted"))
                          out.print(session.getAttribute("Successfull"));
                        if(session.getAttribute("status").equals("notinserted"))
                            out.print(session.getAttribute("AlreadyExist"));
                        if(session.getAttribute("status").equals("Entercorrectdetails"))
                            out.print(session.getAttribute("correctDetail"));
                        if(session.getAttribute("status").equals("NullValue"))
                            out.print(session.getAttribute("nullvalue"));
                            
                        %>
  <h1>Insert Student</h1>
    <form method="post" action="EUDStudentController.jsp">
        <input type="hidden" name="page" value="insertstudent">
    <input type="hidden" name="page" value="Insert">

    <p style="margin: 0px 40px 0">FIRST_NAME*<input type="text" name="FIRST_NAME" placeholder="FIRST_NAME"></p>

    <p style="margin: -60px 600px 10px">LAST_NAME*<input type="text" name="LAST_NAME" placeholder="LAST_NAME"></p>

    <p style="margin: 0 40px 0">FATHER_NAME*<input type="text" name="FATHER_NAME" placeholder="FATHER_NAME"></p>

    <p style=" margin: -60px 600px 10px">MOTHER_NAME*<input type="text" name="MOTHER_NAME" placeholder="MOTHER_NAME"></p>

    <p style="margin: 0 40px 0">ADDRESS*<input type="text" name="ADDRESS" placeholder="ADDRESS"></p>

    <p style=" margin: -60px 600px 10px">MOBILE_NO*<input type="text" name="MOBILE_NO" placeholder="MOBILE_NO"></p>

    <p style="margin: 0 40px 0">STUDENT_EMAIL*<input type="text" name="STUDENT_EMAIL" placeholder="STUDENT_EMAIL"></p>

    <p style=" margin: -60px 600px 10px">GUARDIAN_EMAIL*<input type="text" name="GUARDIAN_EMAIL" placeholder="GUARDIAN_EMAIL"></p>

    <p style="margin: 0 40px 0">AADHAR_NO*<input type="text" name="AADHAR_NO" placeholder="AADHAR_NO"></p>

    <p style=" margin: -60px 600px 10px">QUALIFICATION*<input type="text" name="QUALIFICATION" placeholder="QUALIFICATION"></p>

    <p style="margin: 0 40px 0">MARKS*<input type="text" name="MARKS" placeholder="MARKS"></p>

    <p style=" margin: -60px 600px 10px">ENROLL_NO*<input type="text" name="ENROLL_NO" placeholder="ENROLL_NO"></p>

    <p style="margin: 0 40px 0">CATEGORY*<input type="text" name="CATEGORY" placeholder="CATEGORY"></p>

    <p style=" margin: -60px 600px 10px">UPTU_ROLL*<input type="text" name="UPTU_ROLL" placeholder="UPTU_ROLL"></p>

    <p style="margin: 0 40px 0">UPTU_RANK*<input type="text" name="UPTU_RANK" placeholder="UPTU_RANK"></p>

    <p style=" margin: -60px 600px 10px">UPTU_MARKS*<input type="text" name="UPTU_MARKS" placeholder="UPTU_MARKS"></p>
    
    <p style="margin: 0 40px 0px">UNIVERSITY_NAME*<input type="text" name="UNIVERSITY_NAME" placeholder="UNIVERSITY_NAME"></p>

    <p style=" margin: -60px 600px 10px">DEPT_NAME*<input type="text" name="DEPT_NAME" placeholder="DEPT_NAME"></p>

    <p style="margin: 0 40px 0">STUDENT_SEMESTER*<input type="text" name="STUDENT_SEMESTER" placeholder="STUDENT_SEMESTER"></p>

    <p style=" margin: -60px 600px 10px">YEAR*<input type="text" name="YEAR" placeholder="YEAR"></p>

    <p style="margin: 0 40px 30px">STUDENT_FEE*<input type="text" name="STUDENT_FEE" placeholder="STUDENT_FEE"></p>

    <p style="margin: 0 40px 30px">Student_Image*<input type="file" name="STUDENT_IMAGE" placeholder="Student_Image"></p>

    <p style="margin: 0 40px 30px">Parents_image*<input type="file" name="PARENTS_IMAGE" placeholder="Parents_image"></p>

    <p style="margin: 0 40px 30px">PASSWORD*<input type="PASSWORD" name="PASSWORD" placeholder="PASSWORD"></p>


    <p class="remember_me">

    <label>
        <input type="checkbox" name="remember_me" id="remember_me">
        Remember me on this computer
      </label>
    </p>
    <p class="submit"><input type="submit" name="commit" value="submit" ></p>
  </form>
</div>
<div class="login-help">
        <p>Forgot your password? <a href="#">Click here to reset it</a>.</p>
    </div>
  </body>
</html>