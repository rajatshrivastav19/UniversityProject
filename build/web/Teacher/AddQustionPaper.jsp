<%-- 
    Document   : AddQustionPaper
    Created on : Feb 14, 2021, 11:52:15 AM
    Author     : Lenovo
--%>

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
                  <li><a href="AddQustionPaper.jsp">ADD QUSTION PAPER</a></li>
                  <li><a href="#">UPDATE QUSTION PAPER</a></li>
                  <li><a href="#">GET EXCEL FILE</a></li>
                  <li><a href="#">UPLOAD RESULT</a></li>
                  <li><a href="#">LOGOUT</a></li>
              </ul>
              <img src="Phule.jpg" height="120" width="130" align="left">
        </nav> 
<body> 
    <form style="margin: 8px 90px 0" action="TeacherController.jsp"> 
        <input type="hidden" name="page" value="addqustion">
        <h2 align="center">ADD QUSTION PAPER</h2>
        <div class="imgcontainer"> 
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar"> 
        </div> 
        <div class="container">
            <label ><b>Add Qustion</label> 
            <input  style="margin: 8px -180px 0" align="center" type="text" placeholder="Add Qustion*" name="QUSTION" required> </b>

            <label><b>OPTION1*</label>
            <input  style="margin: 8px -160px 0" type="text" placeholder="OPTION1*" name="OPTION1" required> </p>

            <label><b>OPTION2*</label>
            <input  style="margin: 8px -160px 0" type="text" placeholder="OPTION2*" name="OPTION2" required> </p>

            <label><b>OPTION3*</label>
            <input  style="margin: 8px -160px 0" type="text" placeholder="OPTION3*" name="OPTION3" required> </p>

            <label><b>OPTION4*</label>
            <input  style="margin: 8px -160px 0" type="text" placeholder="OPTION4*" name="OPTION4" required> </p>

            <label><b>CORRECT_ANSWER*</label>
            <input  style="margin: 8px -250px 0" type="text" placeholder="CORRECT_ANSWER*" name="CORRECT_ANSWER" required> </p>

            <button type="submit">Add Qustion</button>
        </div> 
        <div class="container" style="background-color:#f1f1f1"> 
            <button type="button" class="cancelbtn">Cancel</button> 
            <span class="psw">Back to<a href="TeacherMainPage.jsp">Profle?</a></span> 
        </div> 
    </form> 
</body> 
</html> 