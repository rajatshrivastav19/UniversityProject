<%-- 
    Document   : StudentSendResultExcelFile
    Created on : Feb 15, 2021, 5:10:57 PM
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
                  <li><a href="StudentMainPage.jsp">STUDENT HOME</a></li>
                  <li><a href="StudentGiveExam.jsp">BACK EXAM PORTAL</a></li>
                  <li><a href="../index.html">LOGOUT</a></li>
              </ul>
              <img src="Phule.jpg" height="120" width="130" align="left">
        </nav> 
<body> 
 
    <form style="margin: 8px 90px 0" action="ApachePOIFeatchResult.jsp" method="POST">
        <input type="hidden" name="page" value="MakeResultExelFile">
          
        <h2 align="center">SEND EXCEL-FILE OF RESULT</h2>
        <div class="imgcontainer"> 
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar"> 
        </div> 

        <div class="container">

            <label ><b>ENTER EMAIL ID*</label> 
            <input style="margin: 8px -190px 0" align="center" type="text" placeholder="ENTER ANY EMAILID*" name="emailid" required> </b>

            <button type="submit">SEND EXCEL FILE</button>
        </div> 
        <div class="container" style="background-color:#f1f1f1"> 
            <button type="button" class="cancelbtn">Cancel</button> 
        </div> 
    </form> 
</body> 
</html> 
