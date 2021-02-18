
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page import="java.io.PrintWriter"%>
        <%@page import="java.sql.*,java.util.*" %>

<html>
    <head>
    <title>Student Registration</title>
    <link rel="stylesheet" href="STUDENT.css">
    
       <nav>
        <img src="logoblue.jpg" height="120" width="140" align="right">
          
                <input type="checkbox" id="click">
                <label for="click" class="menu-btn">
                <i class="fas fa-bars"></i>
                </label>
          <ul>
              <li><a href="index.html">HOME</a></li>
              <li><a href="#">ADMIN</a></li>
              <li><a href="StudentPage.html">STUDENT</a></li>
              <li><a href="#">TEACHER</a></li>
              <li><a href="#">PERENTS</a></li>
              <li><a href="#">ALUMINI</a></li>

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
          background-image: url('https://www.geu.ac.in/content/dam/geu/Image-Galleries/HeaderFiles/aerial-view-geu.jpg');
          background-image: url('https://lh3.googleusercontent.com/proxy/SjFU7E8kVTM0TME5BY5zkebEILm3yi9vDOWwuqVOFtamsFsVIxEDqSa5Rgcs-_vVwfif6EqSOG_w7hNvTBJgTVVz');
          background-size: 100% 100%;
          animation: slider 3s infinite linear;
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
   
     
        
<%
    Class.forName("com.mysql.cj.jdbc.Driver");

    int i=0;
    String Email;
    if(request.getParameter("STUDENT_EMAIL")!=null && request.getParameter("PASSWORD")!=null)
    {
                                               /* FIRST_NAME, LAST_NAME, FATHER_NAME, MOTHER_NAME, D_O_B, 
                                                ADDRESS, MOBILE_NO, STUDENT_EMAIL, FATHER_EMAIL, AADHAR_NO, QUALIFICATION, MARKS, ENROLL_NO, CETEGORY,
                                                UPTU_ROLL, UPTU_RANK, UPTU_MARKS, UNIVERSITY_NAME, COURSE_NAME, STUDENT_SEMESTER, YEAR, STUDENT_FEE, SROLL_NO*/
             
            String firstname  = request.getParameter("FIRST_NAME");         
            String lastname = request.getParameter("LAST_NAME");            
            String fathername = request.getParameter("FATHER_NAME");            
            String mothername =  request.getParameter("MOTHER_NAME");                     
            String address = request.getParameter("ADDRESS");           
            int mobile = Integer.parseInt(request.getParameter("MOBILE_NO"));          
            String studentmail = request.getParameter("STUDENT_EMAIL");           
            String guardianmail = request.getParameter("GUARDIAN_EMAIL");           
            int  aadhar = Integer.parseInt(request.getParameter("AADHAR_NO"));          
            String qualification = request.getParameter("QUALIFICATION");           
            int marks = Integer.parseInt(request.getParameter("MARKS"));            
            int enroll = Integer.parseInt(request.getParameter("ENROLL_NO"));        
            String cetegory = request.getParameter("CATEGORY");           
            int upturoll  =  Integer.parseInt(request.getParameter("UPTU_ROLL"));            
            int upturank =  Integer.parseInt(request.getParameter("UPTU_RANK"));         
            int uptumarks  = Integer.parseInt(request.getParameter("UPTU_MARKS"));           
            String universityname  = request.getParameter("UNIVERSITY_NAME");           
            String deptname = request.getParameter("DEPT_NAME");            
            int semester = Integer.parseInt(request.getParameter("STUDENT_SEMESTER"));           
            int year= Integer.parseInt(request.getParameter("YEAR"));          
            int studentfee = Integer.parseInt(request.getParameter("STUDENT_FEE"));            
                                                
            
            String student_image= request.getParameter("Student_Image");      //    
            String perents_image = request.getParameter("Parents_image");   //
            
        /*    File simg= new File(student_image);
            File pimg= new File(perents_image);
            FileInputStream fi1=new FileInputStream(simg);
            FileInputStream fi2=new FileInputStream(pimg);*/
            
            //pstmt.setBinaryStream(3, fi1, (int) (simg.length()));
            
            int password =  Integer.parseInt(request.getParameter("PASSWORD"));
                                                
                                     /*           Fisrt_Name Last_Name Father_Name Mother_Name D.O.B Student_Email Perents_Email Address Mobile_Number
                                Aadhar_Number Qualification Marks Enroll_Number  Cetegory UPTU_Roll UPTU_Marks UPTU_Rank University_Name Course_Name Student_Semester
                                Year Student_Fee Student_Roll_Number*/
    
          
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");

    Statement st1=con.createStatement();
    
    
    ResultSet rs=st1.executeQuery("select * from STUDENT_REGISTRATION_TABLE");
    i=0;
        while(rs.next()) //Account exist or not
        {       
            if(studentmail.equals(rs.getString("STUDENT_EMAIL")) || guardianmail.equals(rs.getString("GUARDIAN_EMAIL")) || enroll == (rs.getInt("ENROLL_NO")))
            {
                
                i=1; // I value change mean account exist
                Email=rs.getString("STUDENT_EMAIL");
                out.println("<center><h1>"+Email+"</center></h1>");
             
               // out.println("<center><h1>First Name="+ +" Last Name= "+ +"Student Email= "+ +"</center></h1>"):
            }
        }
        //rs.getString("FIRST_NAME")rs.getString("LAST_NAME")rs.getString("STUDENT_EMAIL")
        
        if(i==0) // i value not change mean account not exist (ready fo registration)
        {
              st1.executeUpdate("INSERT INTO STUDENT_REGISTRATION_TABLE (FIRST_NAME, LAST_NAME, FATHER_NAME, MOTHER_NAME, ADDRESS, MOBILE_NO, STUDENT_EMAIL, GUARDIAN_EMAIL, AADHAR_NO, QUALIFICATION, MARKS, ENROLL_NO, CATEGORY, UPTU_ROLL, UPTU_RANK, UPTU_MARKS, UNIVERSITY_NAME, DEPT_NAME, STUDENT_SEMESTER, YEAR, STUDENT_FEE,Student_Image,Parents_image, PASSWORD)"    
                    + "VALUES ( '"+firstname+"', '"+lastname+"' , '"+fathername+"'  , '"+mothername+"','"+address+"',"+mobile+",'"+studentmail+"', '"+guardianmail+"', "+aadhar+" ,'"+qualification+"', "+marks+" ,"+enroll+",'"+cetegory+"',"+upturoll+", "+upturank+" ,"+uptumarks+"  , '"+universityname+"', '"+deptname+"' ,"+semester+","+year+","+studentfee+",'"+student_image+"','"+perents_image+"',"+password+")");
                    
                out.println("<center><h1>"+studentmail+"</center></h1>");
                out.println(" <center><h1>Registration successfull....!!!!! </center></h1>");
        }
        if(i==1)
            out.println("<center><h1>"+studentmail+"</center></h1>"+"<center><h1>Account Already Exist.....!!!!</center></h1>");
            con.close();
    }
    if(i==0)
            out.println("<center><h1> Don't Insert Null Value </h1></center>");
%>
  </body>
</html>