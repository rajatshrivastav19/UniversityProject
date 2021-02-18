<%-- 
    Document   : StudentGiveExam
    Created on : Feb 14, 2021, 2:45:15 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html> 
<%int a=1;%>
<html> 
    <head>
        <%
            String first_name= session.getAttribute("fn").toString();
          String last_name= session.getAttribute("ln").toString();
          //out.print(" "+first_name+" "+last_name);
        %>
    </head>
        <link rel="stylesheet" href="StudentFront.css">
       <nav>
        <img src="logoblue.jpg" height="120" width="140" align="right">
          
                <input type="checkbox" id="click">
                <label for="click" class="menu-btn">
                    <i class="fas fa-bars"></i>
                </label>
              <ul>
                    <li><a href="#"><%out.print(" "+first_name+" "+last_name);%></a></li>
              </ul>
              <img src="Phule.jpg" height="120" width="130" align="left">
        </nav> 
<body> 
    
     <%  
         
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");
        out.print("a="+a); %>
        <form style="margin: 8px 90px 0" action="#" method="POST">
        <input type="hidden" name="page" valu="inseetQustion">
        <h2 align="center">ONLINE EXAM PORTAL</h2>
        <h3 aiign="left" ></h3>
        <div class="imgcontainer">
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar"> 
        </div>
        <% 
                String Enroll = session.getAttribute("Enroll").toString();
                out.print(Enroll);
                
                
                String SELECTAll= "SELECT * FROM QustionPaperJavaProgramingLanguage";
                PreparedStatement ps= con.prepareStatement(SELECTAll);
                //out.print(a);
                ResultSet rs=ps.executeQuery();
                int n=1;
                while(rs.next())
                {
                   // a=rs.getInt("QUSTION_NO");   
        %>    
        <div class="container">
          
            <label><b>QUSTION:<%=rs.getInt("QUSTION_NO")%></b></label>
            <input  style="margin: 8px -160px 10px" type="text" name="Qustion" value='<%=rs.getString("QUSTION")%>' readonly> </p>
           
            <label style="margin: 15px 0px 0"><b><%=rs.getString("OPTION1")%></p><input style="margin: 0 410px 0" type="radio" name="<%=rs.getString("QUSTION_NO")%>"   value="<%=rs.getString("OPTION1")%>" required></label>
            <label style="margin: 15px -200px 0"><b><%=rs.getString("OPTION2")%></p><input style="margin: 0 410px 0" type="radio" name="<%=rs.getString("QUSTION_NO")%>" value="<%=rs.getString("OPTION2")%>" required></label>
            <label style="margin: 15px -200px 0"><b><%=rs.getString("OPTION3")%></p><input style="margin: 0 410px 0" type="radio" name="<%=rs.getString("QUSTION_NO")%>" value="<%=rs.getString("OPTION3")%>" required></label>
            <label style="margin: 15px -200px 0"><b><%=rs.getString("OPTION4")%></p><input style="margin: 0 410px 0" type="radio" name="<%=rs.getString("QUSTION_NO")%>"  value="<%=rs.getString("OPTION4")%>" required></label>
              
        </div> 
                <%   
                  n++;
                }
             %>
             
                <button style=" margin-bottom: 10px" type="submit">Next</button>
                
        <div class="container" style="background-color:#f1f1f1"> 
       <button type="button" class="cancelbtn">Cancel</button> 
            <span class="psw">Back to<a href="StudentMainPage.jsp">Profle?</a></span> 
        </div> 
    </form>
             
    <%        
                
                //String  SAns10Status = null;
                
             try{
              
              String  SAns1Status = "";
              String SAns2Status = "";                
              String SAns3Status = "";
              String  SAns4Status = "";
              String SAns5Status = "";
              String  SAns6Status = "";
              String SAns7Status = "";
              String  SAns8Status = "";
              String SAns9Status = "";  
               int cheak=0;  
                 
              String Qustion=request.getParameter("Qustion");
              String SAns1 = request.getParameter("1");
              String SAns2 = request.getParameter("2");
              String SAns3 = request.getParameter("3");
              String SAns4 = request.getParameter("4");
              String SAns5 = request.getParameter("5");
              String SAns6 = request.getParameter("6");
              String SAns7 = request.getParameter("7");
              String SAns8 = request.getParameter("8");
              String SAns9 = request.getParameter("9");
             // String SAns10 = request.getParameter("10");
              
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");
              
              String cheak_answer= "SELECT * FROM qustionpaperjavaprograminglanguage";
              PreparedStatement stmt1=conn.prepareStatement(cheak_answer);
              ResultSet r=stmt1.executeQuery();
//              out.print(SAns1);
//              out.print(SAns2);
//              out.print(SAns3);
//              out.print(SAns4);
//              out.print(SAns5);
              
                while(r.next())
                {
                    if(r.getString("CORRECT_ANSWER").equals(SAns1))
                        SAns1Status = "Correct";
                    if(r.getString("CORRECT_ANSWER").equals(SAns2))
                        SAns2Status = "Correct";
                    if(r.getString("CORRECT_ANSWER").equals(SAns3))
                        SAns3Status = "Correct";
                    if(r.getString("CORRECT_ANSWER").equals(SAns4))
                        SAns4Status = "Correct";
                    if(r.getString("CORRECT_ANSWER").equals(SAns5))
                        SAns5Status = "Correct";
                    if(r.getString("CORRECT_ANSWER").equals(SAns6))
                        SAns6Status = "Correct";
                    if(r.getString("CORRECT_ANSWER").equals(SAns7))
                        SAns7Status = "Correct";
                    if(r.getString("CORRECT_ANSWER").equals(SAns8))
                        SAns8Status = "Correct";
                    if(r.getString("CORRECT_ANSWER").equals(SAns9))
                        SAns9Status = "Correct";
                    cheak=1;
                   /* */
                    
                    
                }
                if(cheak==1)
                {
                     if(SAns1Status.equals(""))
                        SAns1Status = "Incorrect";
                     if(SAns2Status.equals(""))
                        SAns2Status = "Incorrect";
                     if(SAns3Status.equals(""))
                        SAns3Status = "Incorrect";
                     if(SAns4Status.equals(""))
                        SAns4Status = "Incorrect";
                     if(SAns5Status.equals(""))
                        SAns5Status = "Incorrect";
                     if(SAns6Status.equals(""))
                        SAns6Status = "Incorrect";
                     if(SAns7Status.equals(""))
                        SAns7Status = "Incorrect";
                     if(SAns8Status.equals(""))
                        SAns8Status = "Incorrect";
                     if(SAns9Status.equals(""))
                        SAns9Status = "Incorrect";   
                }
                     
              
                      
              String Delete= "DELETE FROM StudentGiveExam";
              PreparedStatement ST= conn.prepareStatement(Delete);
              ST.executeUpdate();
              
              
              String insert1= "INSERT INTO StudentGiveExam (Qustion_no , Student_Answer , Status) VALUES(? , ? , ?);";
              PreparedStatement ps1= conn.prepareStatement(insert1);
                      
              String insert2="INSERT INTO StudentGiveExam (Qustion_no , Student_Answer , Status) VALUES(? , ? , ?);";
              PreparedStatement ps2= conn.prepareStatement(insert2);
                      
              String insert3= "INSERT INTO StudentGiveExam (Qustion_no , Student_Answer, Status) VALUES(? , ? , ?);";
              PreparedStatement ps3= conn.prepareStatement(insert3);
                       
              String insert4="INSERT INTO StudentGiveExam (Qustion_no , Student_Answer , Status) VALUES(? , ? , ?);";
              PreparedStatement ps4= conn.prepareStatement(insert4);
                      
              String insert5= "INSERT INTO StudentGiveExam (Qustion_no , Student_Answer , Status) VALUES(? , ? , ?);";
              PreparedStatement ps5= conn.prepareStatement(insert5);
                      
              String insert6="INSERT INTO StudentGiveExam (Qustion_no , Student_Answer , Status) VALUES(? , ? , ?);";
              PreparedStatement ps6= conn.prepareStatement(insert6);
                      
              String insert7= "INSERT INTO StudentGiveExam (Qustion_no , Student_Answer , Status) VALUES(? , ? , ?);";
              PreparedStatement ps7= conn.prepareStatement(insert7);
                      
              String insert8="INSERT INTO StudentGiveExam (Qustion_no , Student_Answer , Status) VALUES(? , ? , ?);";
              PreparedStatement ps8= conn.prepareStatement(insert8);
                      
              String insert9= "INSERT INTO StudentGiveExam (Qustion_no , Student_Answer , Status) VALUES(? , ? , ?);";
              PreparedStatement ps9= conn.prepareStatement(insert9);
                      
//            String insert10="INSERT INTO StudentGiveExam (Qustion_no , Student_Answer) VALUES(? , ?);";
//            PreparedStatement ps10= con.prepareStatement(insert10);

              
               ps1.setInt(1, 1);
               ps1.setString(2, SAns1);
               ps1.setString(3, SAns1Status);
               
               ps2.setInt(1, 2);
               ps2.setString(2, SAns2);
               ps2.setString(3, SAns2Status);
               
               ps3.setInt(1, 3);
               ps3.setString(2, SAns3);
               ps3.setString(3, SAns3Status);
               
               ps4.setInt(1, 4);
               ps4.setString(2, SAns4);
               ps4.setString(3, SAns4Status);
               
               ps5.setInt(1, 5);
               ps5.setString(2, SAns5);
               ps5.setString(3, SAns5Status);
               
               ps6.setInt(1, 6);
               ps6.setString(2, SAns6);
               ps6.setString(3, SAns6Status);
               
               ps7.setInt(1, 7);
               ps7.setString(2, SAns7);
               ps7.setString(3, SAns7Status);
               
               ps8.setInt(1, 8);
               ps8.setString(2, SAns8);
               ps8.setString(3, SAns8Status);
               
               ps9.setInt(1, 9);
               ps9.setString(2, SAns9);
               ps9.setString(3, SAns9Status);
               
//               ps2.setInt(1, 10);
//               ps2.setString(2, SAns10);

            
                ps1.executeUpdate();
                ps2.executeUpdate();
                ps3.executeUpdate();
                ps4.executeUpdate();
                ps5.executeUpdate();
                ps6.executeUpdate();
                ps7.executeUpdate();
                ps8.executeUpdate();
                ps9.executeUpdate();
//                ps10.executeUpdate();
                
              //out.print("\nAns:"+SAns2+" ");
               response.sendRedirect("StudentSendResultExcelFile.jsp?value=Exam&successfully&Done");
            }
             catch(Exception e)
             {
                 out.print("Not Inserted: "+e.getMessage()); 
             }
          %>
</body> 
</html> 