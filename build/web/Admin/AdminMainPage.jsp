<%@page import="java.sql.*"%>
<html>
    <head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="Admin.css">
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
      <%
          /* Access Data*/
          String a= session.getAttribute("status").toString();
            out.print(a);
            
           String adminid=session.getAttribute("adminname").toString();
           out.print(adminid);
      %>  
    <div class="login">
      <h1>Search</h1>
        <form method="post" action="QuaryController.jsp">
          <input type="hidden" name="page" value="adminmainpage">            
         <P>LOOKING FOR*:
             <select style="font-size: 20px" name="person">
            <option value="-1">Select</option>
            <% 
                try
                {
                Class.forName("com.mysql.cj.jdbc.Driver");
            
                Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/admin" ,"root", "tiger");
                
                String sql = "SELECT * FROM person_group";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                //Integer.parseInt(adminPass);
                    while(rs.next())
                    {
                        %> <option value="<%= rs.getString("person") %>"> <%=rs.getString("person")%> </option> <%
                    }
                  }
                  catch(Exception e1)
                  {
                     System.out.println(e1.getMessage());
                  }
            %>
          </select>
         </P>
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

    <p>STUDENT ID*/TEACHER ID*<input type="text" name="NumberID" value="" placeholder="Enrollment ID* / Teacher ID*"></p>

    <p class="submit"><input type="submit" name="commit" value="Next"></p>
  
  </form>
</div>
<div class="login-help">
  <p>Forgot your password? <a href="#">Click here to reset it</a>.</p>
</div>
  </body>
</html>