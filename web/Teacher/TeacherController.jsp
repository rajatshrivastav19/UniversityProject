<%-- 
    Document   : TeacherController
    Created on : Feb 10, 2021, 9:24:47 PM
    Author     : Lenovo
--%>

<%@page import="java.util.Random"%>
<%@page import="MailPackage.JavaMailAPI"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="TeacherPackage.TeacherJavaClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
        if(request.getParameter("page").equals("TeacherRegistration"))
        {
            
               try {
                    String FIRST_NAME=null,LAST_NAME=null,TEACHER_EMAIL=null,MOBILE_NO=null,QUALIFICATION=null,DEPT_NAME=null,Student_Image=null;
                    int TID=0;
                    int cheak=0,i=0;
                    TeacherJavaClass a1=new TeacherJavaClass();
                    if( a1.isString(request.getParameter("FIRST_NAME").toString()) && a1.isString(request.getParameter("LAST_NAME").toString()) && a1.isNumber(request.getParameter("MOBILE_NO").toString())
                            && a1.isString(request.getParameter("QUALIFICATION").toString()) && a1.isString(request.getParameter("DEPT_NAME").toString()))
                    {
                        FIRST_NAME = request.getParameter("FIRST_NAME");
                        LAST_NAME = request.getParameter("LAST_NAME");
                        TEACHER_EMAIL = request.getParameter("TEACHER_EMAIL");
                        MOBILE_NO = request.getParameter("MOBILE_NO");
                        QUALIFICATION  = request.getParameter("QUALIFICATION");
                        DEPT_NAME  = request.getParameter("DEPT_NAME");
                        Student_Image = request.getParameter("Student_Image");
                        
                        out.print("namr "+FIRST_NAME);
                        out.print("namr "+LAST_NAME);
                        out.print("T-email "+TEACHER_EMAIL);
                        out.print("T-Mobile "+MOBILE_NO);
                        
                        
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        
                        
                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "tiger");
                        
                        
                        String accountExitsorNot = "SELECT * FROM TEACHER_REGISTRATION_TABLE";
                        
                        
                        PreparedStatement ps = conn.prepareStatement(accountExitsorNot);
                        
                        
                        ResultSet rs=ps.executeQuery();
                        
                          while(rs.next())
                          {
                                if(TEACHER_EMAIL.equals(rs.getString("TEACHER_EMAIL")))
                                {
                                    cheak=1;
                                }
                          }
                          if(cheak==1)
                          {
                                request.getSession().setAttribute("status","AccountAlreadyExits");
                                response.sendRedirect("TeacherRegistrationPage.jsp?value=Account&AlreadyExist");
                                session.setAttribute("AlreadyExist","<center><h1>Account Already Exist.....!!!!</center></h1>");
                          }
                          if(cheak==0)
                          {
                               
                                String insertData = "Insert Into TEACHER_REGISTRATION_TABLE( FIRST_NAME, LAST_NAME ,TEACHER_EMAIL, MOBILE_NO, QUALIFICATION, DEPT_NAME, TEACHER_Image )"
                                        + "Values( ? ,? ,? , ? , ? , ? , ? )";
                                
                                PreparedStatement ps1 = conn.prepareStatement(insertData);
                                
                                ps1.setString(1, FIRST_NAME);
                                ps1.setString(2, LAST_NAME);
                                ps1.setString(3, TEACHER_EMAIL);
                                ps1.setString(4, MOBILE_NO );
                                ps1.setString(5, QUALIFICATION);
                                ps1.setString(6, DEPT_NAME );
                                ps1.setString(7, Student_Image);
                                int value = ps1.executeUpdate();
                                i=1;
                          }
                          if(i==1)
                          {
                                JavaMailAPI a2 = new JavaMailAPI();
                               
                                Random rendomnumber=new Random();
		
                                int r= rendomnumber.nextInt(5000)+1000;
                                if(r<0)
                                     r= r;
                                String rendomString= String.valueOf(r);
                                
                                request.getSession().setAttribute("status","Inserted");
                                response.sendRedirect("IDVerificationTeacherRegistrationPage.jsp?value=Registration&Successfully&or&Verify&Email");
                                session.setAttribute("InsertedStudent","<center><h1>Registration Successfully.....!!!!</center></h1>");
                                a2.SendEmailWithoutAttachment(TEACHER_EMAIL, rendomString , FIRST_NAME, LAST_NAME , "TeacherUniqueID" );
                                request.getSession().setAttribute("status","EmailSend");
                                session.setAttribute("EmailSendsuccessfully","<center><h3>Cheak Your Email For Unique ID.....!!!!</center></h3>");
                                
                                request.setAttribute("TeacherEmailIs",TEACHER_EMAIL);
                                request.getSession().setAttribute("RendomString",rendomString);
                          }
                          else
                          {
                                request.getSession().setAttribute("status","NotInserted");
                                response.sendRedirect("TeacherRegistrationPage.jsp?value=Worng&String&or&Server&Problem");
                                session.setAttribute("notinserted","<center><h1>Opps Not inserted.....!!!!</center></h1>");
                          }
                    }
                    else
                    {
                                request.getSession().setAttribute("status","IncorrectValue");
                                response.sendRedirect("TeacherRegistrationPage.jsp?value=Worng&String&or&Intiger&Value");
                                session.setAttribute("EnterCorrectValue","<center><h1>Enter Correct Value.....!!!!</center></h1>");
                        
                    }
                }
                catch (Exception e)
                {
                    out.print(e.getMessage()+" Not Insered Because Of Error");
                    
                }
        }
               
        if(request.getParameter("page").equals("VerifyUniqueID"))
        {
                   
            try
            {
                String  ID = request.getParameter("UniqueID");
                   
                String TeacherEmail = session.getAttribute("sendemail").toString();
                int TID= Integer.parseInt(session.getAttribute("RendomString").toString());
                
                int  cheak=0;
                out.print(" Code "+  TID );
                out.print(" Email "+  TeacherEmail );
                
                if(Integer.parseInt(ID) == TID)
                {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "tiger");
                        //UPDATE ID
                        String InsertID =  "update teacher_registration_table"+
                                                "set TID = ? where teacher_email= '"+TeacherEmail+"'";
                                    
                        PreparedStatement prstmt = conn.prepareStatement(InsertID);
                        prstmt.setInt(1,Integer.parseInt(session.getAttribute("RendomString").toString()));
                        //prstmt.executeUpdate();
                        cheak=1;    
                }
                        if(cheak==1)
                        {
                                request.getSession().setAttribute("status","Correct");
                                response.sendRedirect("TeacherLoginPage.jsp?value=Successfully&Verified&UniqueID");
                                session.setAttribute("InsertedStudent","<center><h1>UNIQUE ID VERIFIED Successfully.....!!!!</center></h1>");         
                        }
                        else
                        {
                                request.getSession().setAttribute("status","Enterworng");
                                response.sendRedirect("IDVerificationTeacherRegistrationPage.jsp?value=Worng&String&or&Server&Problem");
                                session.setAttribute("worngentry","<center><h1>Opps Not inserted.....!!!!</center></h1>");
                        }
            }
            catch (Exception e)
            {
                       out.print(e.getMessage()+"Not INSETED DATA BECAUSE OF ERROR");
            }
        }
               
       if(request.getParameter("page").equals("GetOtp") )
       {
           int i=0;
                   String email = request.getParameter("TEACHER_EMAIL");
                                     
                    Class.forName("com.mysql.cj.jdbc.Driver");
                        
                        
                        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "tiger");
                        
                        
                        String accountExitsorNot = "SELECT * FROM TEACHER_REGISTRATION_TABLE";
                        
                        
                        PreparedStatement ps = conn.prepareStatement(accountExitsorNot);
                        
                        
                        ResultSet rs=ps.executeQuery();
                        
                          while(rs.next())
                          {
                                if(email.equals(rs.getString("TEACHER_EMAIL")))
                                {
                                    i=1;
                                }
                          }
                          if(i==1)
                          {
                                JavaMailAPI a2 = new JavaMailAPI();
                               
                                Random rendomnumber=new Random();
		
                                int r= rendomnumber.nextInt(5000)+1000;
                                if(r<0)
                                     r= r;
                                String rendomString= String.valueOf(r);
                                
                                a2.SendEmailWithoutAttachment(email, rendomString, "", "", "TearcherLogin" );
                                
                                request.getSession().setAttribute("status","OTPsend");
                                response.sendRedirect("TeacherLoginwithOTP.jsp?value=Otp&Send&Successfully&For&Login");
                                session.setAttribute("OTPsendSuccessfully","<center><h1>OTP SEND Successfully To Your Email ID.....!!!!</center></h1>"); 
                                session.setAttribute("OTP",rendomString);
                                session.setAttribute("sendemail",email);
                                
                          }
                          else
                          {
                                request.getSession().setAttribute("status","NotExist");
                                response.sendRedirect("TeacherLoginPage.jsp?value=Account&Not&Exist");
                                session.setAttribute("accountNotExist","<center><h1>Account Not Exist Or Incorrect Password.....!!!!</center></h1>");
                          }
    
               }
       
        if(request.getParameter("page").equals("LoginWithOtp"))
        {
           String a= session.getAttribute("OTP").toString();
           String b= session.getAttribute("sendemail").toString();
            
            out.print(a);
            if(request.getParameter("OTP").equals(a))
            {
                request.getSession().setAttribute("status","Successfull");
                response.sendRedirect("TeacherMainPage.jsp?Successfully&Login");
                session.setAttribute("SuccessfullLogin","<center><h1>Successfull Login....!!!!</center></h1>");
            }
            else
            {
                 request.getSession().setAttribute("status","WorngOTP");
                response.sendRedirect("TeacherLoginwithOTP.jsp?value=Incorrect&OTP");
                session.setAttribute("EnterCorrectOTP","<center><h1>You Enter Incorrect Incorrect OTP....!!!!</center></h1>");
            }
        }
        
      if(request.getParameter("page").equals("addqustion"))
      {
          try{
            String Qus = request.getParameter("QUSTION");
            String Op1 = request.getParameter("OPTION1");
            String Op2 = request.getParameter("OPTION2");
            String Op3 = request.getParameter("OPTION3");
            String Op4 = request.getParameter("OPTION4");
            String Ans = request.getParameter("CORRECT_ANSWER");
            
            out.print("   "+Qus+"        ");
            out.print(Op1);
            out.print(Op2);
            out.print(Op3+"    ");
              
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "tiger");        
                String addQustionNo = "SELECT * FROM QustionPaperJavaProgramingLanguage";
                PreparedStatement ps = conn.prepareStatement(addQustionNo);
                ResultSet rs=ps.executeQuery();
                        
                    int Qustion_no=1;
                          
                    while(rs.next())
                    {
                        Qustion_no++;
                    }
                    out.print(" Count = "+ Qustion_no);
                    //int QNo = Integer.parseInt(request.getParameter("QUSTION_NO"));
                          
                    String insertQustion = "insert into QustionPaperJavaProgramingLanguage(QUSTION_NO,QUSTION,OPTION1,OPTION2,OPTION3,OPTION4,CORRECT_ANSWER)"
                                                                                                                                                           + "VALUES(?,?,?,?,?,?,?)";
                    PreparedStatement st = conn.prepareStatement(insertQustion);
                          
                    st.setInt(1, Qustion_no);
                    st.setString(2, Qus);
                    st.setString(3, Op1);
                    st.setString(4, Op2);
                    st.setString(5, Op3);
                    st.setString(6, Op4);
                    st.setString(7, Ans);
                    
                    st.executeUpdate();
                    conn.close();
                    response.sendRedirect("AddQustionPaper.jsp?value=Add&successfully");
              
          } 
          catch (Exception e) 
          {
              out.print(e.getMessage());
          }
      }
       
%>