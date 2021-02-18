<%@page import="java.sql.*"%>
<html>
    <head>
    <title></title>
    <link rel="stylesheet" href="Form.css">
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
  <center>
      <% String a=session.getAttribute("enrollID").toString();
      out.print(a);%>
    <div class="login" >
      <h1>Student Registration Update</h1>
        <form method="post" action="EUDStudentController.jsp">
            <input type="hidden" name="page" value="studentQuary">
             <P>SELECT QUERY*:
                 <select style="font-size: 20px" class="select-css" name="quaryName">
              <option value="-1">Select Query</option>
            <% 
                try
                {
                Class.forName("com.mysql.cj.jdbc.Driver");
            
                Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/admin" ,"root", "tiger");
                
                String sql = "SELECT * FROM QUARYTABLE";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                //Integer.parseInt(adminPass);
                    while(rs.next())
                    {
                        %> <option value="<%= rs.getString("quary") %>"><%=rs.getString("quary")%></option> <%
                    }
                  }
                  catch(Exception e1)
                  {
                     System.out.println(e1.getMessage());
                  }
            %>
        </select>
      </P>
      <P>SELECT ATTRIBUTE*:
          <select style="font-size: 20px" class="select-css" name="slecteattribute">
            <option value="-1" >Attribute Name</option>
            <% 
                try
                {
                Class.forName("com.mysql.cj.jdbc.Driver");
            
                Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/admin" ,"root", "tiger");
                
                String sql = "SELECT * FROM STUDENTQUARY;";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                //Integer.parseInt(adminPass);
                    while(rs.next())
                    {
                        %><option value="<%= rs.getString("attribute") %>"><%=rs.getString("attribute")%></option><%
                    }
                 }
                 catch(Exception e1)
                 {
                     System.out.println(e1.getMessage());
                 }
           %> 
        </select>
      </P>
    <p>Enter*<input type="text" name="EnterUdatedvalue" value="" placeholder="Enter*"></p>
    <p>Re-Enter*<input type="text" name="Re-EnterUdatedvalue" value="" placeholder="Re-Enter For Confirmation*"></p>
    <p class="submit"><input type="submit" name="commit" value="Update" align="center"></p>
  </form>
        </div>
          <div class="login-help">
          <p>Forgot your password? <a href="#">Click here to reset it</a>.</p>
        </div>
      </body>
      </html>
      <% if(session.getAttribute("status").equals("1"))
      {
        out.print(session.getAttribute("EUDStudentController"));
      }
      else
         out.print(session.getAttribute("EUDStudentController2"));
        %>
    </center>
    </body>
</html>