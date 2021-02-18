

<html>
    <head>
    <title><% out.println(request.getParameter("Email")); %></title> 
    <link rel="stylesheet" href="STUDENT.css">
    <link rel="stylesheet" href="table.css">
   
    <nav>
        <img src="logoblue.jpg" height="120" width="140" align="right">
          
                <input type="checkbox" id="click">
                <label for="click" class="menu-btn">
                    <i class="fas fa-bars"></i>
                </label>
          <ul>
              <li><form action="#"><a class="active"><% out.println(request.getParameter("Email")); %></a></form></li>
              <li><a href="#">Semester Examination Registration</a></li>
              <li><a href="#">Examination Module</a></li>
              <li><a href="#">Miscellaneous</a></li>
              <li><a href="index.html">LogOut</a></li>

          </ul>
          <img src="Phule.jpg" height="120" width="130" align="left">
    </nav>
  <style>
  body {
         background-color: #FFB330;
     }
     .maindiv
     {
          width: 1300px; 
          height: 650px;
          position: absolute;
          left:50%;
          top: 50%;
          transform: translate( -50% , -45%);
          box-shadow: 1px 2px 10px 5px white;
          
          background-image: url('unnamed.jpg');
          background-image: url('https://img.jagranjosh.com/imported/images/E/Articles/Graphic-Era-University-in-the-Top-100-Universities-of-the-Nation-Body-Images.jpg');
          background-image: url('https://lh3.googleusercontent.com/proxy/SjFU7E8kVTM0TME5BY5zkebEILm3yi9vDOWwuqVOFtamsFsVIxEDqSa5Rgcs-_vVwfif6EqSOG_w7hNvTBJgTVVz');
          background-size: 100% 100%;
          animation: slider 8s infinite linear;
     }

     @keyframes slider{

      0%{ background-image: url('unnamed.jpg');  }
      35%{ background-image: url('https://img.jagranjosh.com/imported/images/E/Articles/Graphic-Era-University-in-the-Top-100-Universities-of-the-Nation-Body-Images.jpg');  }
      70%{ background-image: url('https://www.geu.ac.in/content/dam/geu/Image-Galleries/HeaderFiles/aerial-view-geu.jpg'); }
      90%{ background-image: url('https://lh3.googleusercontent.com/proxy/SjFU7E8kVTM0TME5BY5zkebEILm3yi9vDOWwuqVOFtamsFsVIxEDqSa5Rgcs-_vVwfif6EqSOG_w7hNvTBJgTVVz'); }
     }
  </style>
</head>
<body>
  <div class="maindiv"> 
    <center>
    <h1> Student Profile </h1>
    <%@page import="java.io.PrintWriter"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%@page import="java.sql.*,java.util.*" %>

        <% Class.forName("com.mysql.cj.jdbc.Driver");%>

        <%
             String email = request.getParameter("Email");
             int Sp = Integer.parseInt(request.getParameter("Student_pasword"));
    
             Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");
    
             Statement st=con.createStatement();
    
             ResultSet rs = st.executeQuery("select * from STUDENT_REGISTRATION_TABLE");
    int i=0;
    while(rs.next())
    {
        if(email.equals(rs.getString("STUDENT_EMAIL")) && Sp ==(rs.getInt("PASSWORD")))
        {
            i=1;
            out.println("<table border = "+1+" bordercolor = "+"green"+" width="+400+">"+                 
        "<thead>"+
         "<tr>"+
            "<th>Student</th>"+
            "<th>Information</th>"+      
         "</tr>"+
         "</thead>"+
          "<tbody>"+
         "<tr>"+
            "<td>STUDENT NAME</td>"+
            "<td>"+rs.getString("FIRST_NAME")+" "+rs.getString("LAST_NAME")+"</td>"+
         "</tr>"+
         
         "<tr>"+
            "<td>FATHER NAME</td>"+
            "<td>"+rs.getString("FATHER_NAME")+"</td>"+
         "</tr>"+
          
         "<tr>"+
            "<td>MOTHER NAME</td>"+
            "<td>"+rs.getString("MOTHER_NAME")+"</td>"+
         "</tr>"+
         
         "<tr>"+
            "<td>ADDRESS   :</td>"+
            "<td>"+rs.getString("ADDRESS")+"</td>"+
         "</tr>"+

         "<tr>"+
            "<td>MOBILE NUMBER   :</td>"+
            "<td>"+rs.getString("MOBILE_NO")+"</td>"+
         "</tr>"+
         
         "<tr>"+
            "<td>STUDENT EMAIL   :</td>"+
            "<td>"+rs.getString("STUDENT_EMAIL")+"</td>"+
         "</tr>"+
         
         "<tr>"+
            "<td>ENROLLROLMENT NUMBER   :</td>"+
            "<td>"+rs.getString("ENROLL_NO")+"</td>"+
         "</tr>"+
         
         "<tr>"+
            "<td>DEPARTMENT NAME   :</td>"+
            "<td>"+rs.getString("DEPT_NAME")+"</td>"+
         "</tr>"+
                    
         "<tr>"+
            "<td>DEPT_NAME   :</td>"+
            "<td>"+rs.getString("DEPT_NAME")+"</td>"+
         "</tr>"+
           
          "<tr>"+
            "<td>image :</td>"+
            "<td>"+rs.getBlob("Student_Image")+"</td>"+
         "</tr>"+
         "</tbody>"+  
      "</table>"
            );
            
            
            out.println("login successfully");
        }
    }
    if(i==0)
    {
            out.println("Email or pasword are incorrect or not Registered.....!!!");
    }
%>
  </center>

  </div>
</body>
</html>
