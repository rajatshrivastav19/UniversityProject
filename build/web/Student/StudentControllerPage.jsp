<%@page import="MailPackage.JavaMailAPI"%>
<%@page import="studentPackage.StudentJavaclass"%>

<%-- 
    Document   : StudentControllerPage
    Created on : Feb 8, 2021, 2:05:28 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<%
    if(request.getParameter("page").equals("Studentlogin"))
    {
            String STUDENT_EMAIL= (request.getParameter("STUDENT_EMAIL")).toUpperCase().toString();
            String PASSWORD= (request.getParameter("PASSWORD")).toUpperCase().toString();
            
       // if(STUDENT_EMAIL!=""|| PASSWORD!="")
       // {
            StudentJavaclass a1= new StudentJavaclass();   //make object of java class
    
            if(a1.loginValidationStudent(STUDENT_EMAIL,PASSWORD)) // call function
            {
                session.setAttribute( "StudentEmail", (request.getParameter("STUDENT_EMAIL")).toString());
                session.setAttribute( "StudentPassword", (request.getParameter("PASSWORD")).toString());
                session.setAttribute("status","successfull");
                session.setAttribute("StudentEnmail","<center><h1>LOGIN SUCCESSFULLY.........!!!!</center></h1>");
                response.sendRedirect("StudentMainPage.jsp");
            }
            else
            {
                request.getSession().setAttribute("status","notsuccessfull");
                session.setAttribute("notlogin","<center><h1>Oops NOT LOGIN.........!!!!</center></h1>");
                response.sendRedirect("LoginStudentForm.jsp?value=2");
            }
     }
    
        if(request.getParameter("page").equals("studentregistration"))
        {
          try
          {
          int STUDENT_SEMESTER=0,YEAR=0,STUDENT_FEE=0,UPTU_ROLL=0,UPTU_RANK=0,UPTU_MARKS=0,MARKS=0,ENROLL_NO=0,PASSWORD=0,a=0;
          String FIRST_NAME=null,LAST_NAME=null,FATHER_NAME=null,MOTHER_NAME=null,ADDRESS=null,STUDENT_EMAIL=null,GUARDIAN_EMAIL=null;
          String QUALIFICATION=null,CATEGORY=null,UNIVERSITY_NAME=null,DEPT_NAME=null,MOBILE_NO=null,AADHAR_NO=null;
          String Student_Image=null, Parents_image=null;
          
            if( (request.getParameter("First_name"))!= "" && (request.getParameter("STUDENT_EMAIL"))!= "" && (request.getParameter("GUARDIAN_EMAIL"))!= "" && (request.getParameter("LAST_NAME"))!= ""
                    && (request.getParameter("MOBILE_NO"))!= "" && (request.getParameter("AADHAR_NO"))!= "" && (request.getParameter("STUDENT_SEMESTER"))!= "" && (request.getParameter("ENROLL_NO"))!= "")            
            
            {
                StudentJavaclass a1=new StudentJavaclass();
                
                if(a1.isNumber(request.getParameter("STUDENT_SEMESTER")) && a1.isNumber(request.getParameter("MARKS")) && a1.isNumber(request.getParameter("UPTU_ROLL")) && a1.isNumber(request.getParameter("UPTU_RANK"))
                                        && a1.isNumber(request.getParameter("UPTU_MARKS")) && a1.isNumber(request.getParameter("YEAR")) && a1.isNumber(request.getParameter("STUDENT_FEE")) 
                                            && a1.isNumber(request.getParameter("PASSWORD")) && a1.isNumber(request.getParameter("ENROLL_NO")))
                {
                    STUDENT_SEMESTER = Integer.parseInt(request.getParameter("STUDENT_SEMESTER"));
                    YEAR          = Integer.parseInt(request.getParameter("YEAR"));
                    STUDENT_FEE   = Integer.parseInt(request.getParameter("STUDENT_FEE"));
                    UPTU_ROLL = Integer.parseInt(request.getParameter("UPTU_ROLL"));
                    UPTU_RANK = Integer.parseInt(request.getParameter("UPTU_RANK"));
                    UPTU_MARKS  = Integer.parseInt(request.getParameter("UPTU_MARKS"));
                    MARKS  = Integer.parseInt(request.getParameter("MARKS"));
                    ENROLL_NO = Integer.parseInt(request.getParameter("ENROLL_NO"));
                    PASSWORD = Integer.parseInt(request.getParameter("PASSWORD"));
                    a=1;
                }
                else
                {
                    request.getSession().setAttribute("status","Entercorrectdetails");
                    response.sendRedirect("StudentRegistrationPage.jsp?value=Worng&Entry&String&orNumarical&value");
                    session.setAttribute("correctDetail","<center><h1>Please Enter Correct Details.....!!!!</center></h1>");
                }
                if(a1.isString(request.getParameter("FIRST_NAME")) && a1.isString(request.getParameter("LAST_NAME")) && a1.isString(request.getParameter("FATHER_NAME")) && a1.isString(request.getParameter("MOTHER_NAME"))
                    && a1.isString(request.getParameter("ADDRESS")) && a1.isString(request.getParameter("QUALIFICATION")) && a1.isString(request.getParameter("CATEGORY")) && a1.isString(request.getParameter("UNIVERSITY_NAME"))
                    && a1.isNumber(request.getParameter("AADHAR_NO")) && a1.isNumber(request.getParameter("MOBILE_NO")) && a1.isString(request.getParameter("DEPT_NAME")))
                {
               /* if(a==1)
                {*/
                   FIRST_NAME  = request.getParameter("FIRST_NAME");
                   LAST_NAME   = request.getParameter("LAST_NAME");
                   FATHER_NAME = request.getParameter("FATHER_NAME");  
                   MOTHER_NAME = request.getParameter("MOTHER_NAME");     
                   ADDRESS = request.getParameter("ADDRESS");
                   STUDENT_EMAIL = request.getParameter("STUDENT_EMAIL");  //&& a1.isString(request.getParameter("STUDENT_EMAIL")) && a1.isString(request.getParameter("GUARDIAN_EMAIL"))
                   GUARDIAN_EMAIL = request.getParameter("GUARDIAN_EMAIL");
                   QUALIFICATION = request.getParameter("QUALIFICATION");
                   CATEGORY = request.getParameter("CATEGORY");
                   UNIVERSITY_NAME = request.getParameter("UNIVERSITY_NAME");
                   DEPT_NAME       = request.getParameter("DEPT_NAME");
                   MOBILE_NO = request.getParameter("MOBILE_NO").toString();
                   AADHAR_NO    = request.getParameter("AADHAR_NO").toString();
                   a=a+1;
                }
                else
                {
                    request.getSession().setAttribute("status","Entercorrectdetails");
                    response.sendRedirect("StudentRegistrationPage.jsp?value=Worng&Entry&String&orNumarical&value");
                    session.setAttribute("correctDetail","<center><h1>Please Enter Correct Details.....!!!!</center></h1>");
                }
                   
                   out.print("a+1="+a);
                
               if(a==2)
               {
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 
                 String sql="Select * from student_registration_table";
                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");

                 PreparedStatement ps=con.prepareStatement(sql);
    
    
                 ResultSet rs=ps.executeQuery(sql);
                 int i=0;
                 String FN = null;
                 String LN = null;
                
                        while(rs.next()) //Account exist or not
                        {       
                                 if(STUDENT_EMAIL.equals(rs.getString("STUDENT_EMAIL")) || GUARDIAN_EMAIL.equals(rs.getString("GUARDIAN_EMAIL")) || ENROLL_NO == (rs.getInt("ENROLL_NO")))
                                 {                                   
                                     request.getSession().setAttribute("status","notinserted");
                                     response.sendRedirect("StudentRegistrationPage.jsp?value=This&account&are&Already&Exist");
                                     session.setAttribute("AlreadyExist","<center><h1>Account Already Exist.....!!!!</center></h1>");
                                 }
                        }
                        
                        String insert= "INSERT INTO student_registration_table (FIRST_NAME, LAST_NAME, FATHER_NAME, MOTHER_NAME, ADDRESS, MOBILE_NO, STUDENT_EMAIL, GUARDIAN_EMAIL, AADHAR_NO, QUALIFICATION, MARKS, ENROLL_NO, CATEGORY, UPTU_ROLL, UPTU_RANK, UPTU_MARKS, UNIVERSITY_NAME, DEPT_NAME, STUDENT_SEMESTER, YEAR, STUDENT_FEE,Student_Image,Parents_image, PASSWORD)"    
                                  + "VALUES ( '"+FIRST_NAME+"', '"+LAST_NAME+"' , '"+FATHER_NAME+"'  , '"+MOTHER_NAME+"','"+ADDRESS+"','"+MOBILE_NO+"','"+STUDENT_EMAIL+"', '"+GUARDIAN_EMAIL+"', '"+AADHAR_NO+"' ,'"+QUALIFICATION+"', "+MARKS+" ,"+ENROLL_NO+",'"+CATEGORY+"',"+UPTU_ROLL+", "+UPTU_RANK+" ,"+UPTU_MARKS+",'"+UNIVERSITY_NAME+"', '"+DEPT_NAME+"' ,"+STUDENT_SEMESTER+","+YEAR+","+STUDENT_FEE+",'"+Student_Image+"','"+Parents_image+"',"+PASSWORD+")";
                        
                        
        
                        if(i==0) // i value not change mean account not exist (ready fo registration)
                        {
                               /* ps.executeUpdate("INSERT INTO student_registration_table (FIRST_NAME, LAST_NAME, FATHER_NAME, MOTHER_NAME, ADDRESS, MOBILE_NO, STUDENT_EMAIL, GUARDIAN_EMAIL, AADHAR_NO, QUALIFICATION, MARKS, ENROLL_NO, CATEGORY, UPTU_ROLL, UPTU_RANK, UPTU_MARKS, UNIVERSITY_NAME, DEPT_NAME, STUDENT_SEMESTER, YEAR, STUDENT_FEE,Student_Image,Parents_image, PASSWORD)"    
                                  + "VALUES ( '"+FIRST_NAME+"', '"+LAST_NAME+"' , '"+FATHER_NAME+"'  , '"+MOTHER_NAME+"','"+ADDRESS+"','"+MOBILE_NO+"','"+STUDENT_EMAIL+"', '"+GUARDIAN_EMAIL+"', '"+AADHAR_NO+"' ,'"+QUALIFICATION+"', "+MARKS+" ,"+ENROLL_NO+",'"+CATEGORY+"',"+UPTU_ROLL+", "+UPTU_RANK+" ,"+UPTU_MARKS+",'"+UNIVERSITY_NAME+"', '"+DEPT_NAME+"' ,"+STUDENT_SEMESTER+","+YEAR+","+STUDENT_FEE+",'"+Student_Image+"','"+Parents_image+"',"+PASSWORD+")");*/
                                PreparedStatement ps1= con.prepareStatement(insert);
                                ps1.executeUpdate();
                                //con.close();
                                out.println("<center><h1>"+FIRST_NAME+" "+" "+" "+LAST_NAME+"</center></h1>");
                                
                                request.getSession().setAttribute("status","inserted");
                                response.sendRedirect("StudentRegistrationPage.jsp?value=Registration&are&successfully&compeleted");
                                session.setAttribute("Successfull","<center><h1>Registration successfull....!!!!!</center></h1>");
                        }
                }
                else
                {
                            request.getSession().setAttribute("status","Entercorrectdetail");
                            response.sendRedirect("StudentRegistrationPage.jsp?value=2");
                            session.setAttribute("correctDetailE","<center><h1>Please Enter Correct Details.....!!!!</center></h1>");
                }
            
          } //if NULL
          else{
                            request.getSession().setAttribute("status","NullValue");
                            response.sendRedirect("StudentRegistrationPage.jsp?value=dont&Enter&Null&Value");
                            session.setAttribute("nullvalue","<center><h1>Dont INSERT Null Value.....!!!!</center></h1>");
          }
        }
        catch( Exception e)
        {
                   out.print(e.getMessage());   
                   // response.sendRedirect("StudentRegistrationPage.jsp?value=2");
                    
        }
    }
     
    if(request.getParameter("page").equals("EmailValidation"))
    { 
        try
        {
        String Email= request.getParameter("STUDENT_EMAIL").toString();
        String Password=null;
        String FirstName=null,LastName=null;
        int i=0;
        
        StudentJavaclass a2= new StudentJavaclass();
        
         if(a2.EmailValidation(Email))
         {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");
                    String sql = "SELECT * FROM Student_registration_table";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ResultSet rs=ps.executeQuery();
                    while(rs.next())
                    {
                        if(rs.getString("STUDENT_EMAIL").equals(request.getParameter("STUDENT_EMAIL").toString()))
                        {
                            Password =  String.valueOf(rs.getInt("PASSWORD"));
                            FirstName= rs.getString("FIRST_NAME").toString();
                            LastName = rs.getString("LAST_NAME").toString();
                            i++;
                        }
                    }
                if(i==1)
                {
                    JavaMailAPI Sendmail= new JavaMailAPI();
                    Sendmail.SendEmailWithoutAttachment(Email, Password , FirstName, LastName , "StudentForgetPassword");
                    request.getSession().setAttribute("status","Entercorrectdetails");
                    response.sendRedirect("ForgetPassword.jsp?value=Email&Send&Successfully&to&Email&ID");
                    session.setAttribute("correctDetail","<center><h1>Password Send Successfully Send To Your Email ID</center></h1>");
                }
                else
                {
                    request.getSession().setAttribute("status","Entercorrectdetails");
                    response.sendRedirect("ForgetPassword.jsp?value=Email&Don't&Exits");
                    session.setAttribute("correctDetail","<center><h1>Email Don't Exits.....!!!!</center></h1>"); 
                }
          }
          else
          {
                    request.getSession().setAttribute("status","Entercorrectdetails");
                    response.sendRedirect("ForgetPassword.jsp?value=Enter&correct&Password&or&Email");
                    session.setAttribute("correctDetail","<center><h1>Please Enter Correct Details.....!!!!</center></h1>"); 
          }
           out.print("i = "+i);
           out.print( "   jknkjkjkjjkbbjbkjb");
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage()+" Your Email Is In Uper Or Lower  Please Insert Correct Value.");
        }
    }
    if(request.getParameter("page").equals("inseetQustion"))
    {
        //int a=Integer.parseInt(request.getParameter("Qno").toString());
        out.print("get="+Integer.parseInt(session.getAttribute("Qno").toString()));
    }
%>
