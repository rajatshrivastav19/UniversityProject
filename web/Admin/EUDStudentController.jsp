Q<%-- 
    Document   : EUDStudentController
    Created on : Feb 2, 2021, 2:10:13 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.*"%>
<%@page import="adminPackage.EDUParents"%>
<%@page import="adminPackage.EDUTeacher"%>
<%@page import="adminPackage.EDUStudent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        // UDATE QUARY
        if(request.getParameter("page").equals("studentQuary") && request.getParameter("EnterUdatedvalue")!=null)
        {
            EDUStudent student= new EDUStudent();
            
            String enrollID= session.getAttribute("enrollID").toString(); //enroll
            String slecteattribute = request.getParameter("slecteattribute").toLowerCase().toString(); //atributes NAme/address..etc
            String EnterUdatedvalue = request.getParameter("EnterUdatedvalue").toLowerCase().toString();  //EnterUdatedvalue

            out.print("\n enrollno "+ enrollID);
            out.print("\n slecte attribute "+ slecteattribute);
            out.print("\n Enter Udated value "+ EnterUdatedvalue);
            
            
            
           
            
            if(student.updateStudent(enrollID,slecteattribute,EnterUdatedvalue))
            {
                        boolean a=student.updateStudent(enrollID,slecteattribute,EnterUdatedvalue);
                        out.print("return = "+ a);
                    //  out.print("\ninner "+ Quary);
                        session.setAttribute("status","1");
                        session.setAttribute("EUDStudentController", "<center><h1>UPDATE SUCCESSFULLY.........!!!!</center></h1>");
                        response.sendRedirect("UpdateStudent.jsp");
            }
            else
            {
                        
                        request.getSession().setAttribute("status","-1");
                        response.sendRedirect("UpdateStudent.jsp?value=2");
                        session.setAttribute("EUDStudentController2", "<center><h1>UPDATE NOT SUCCESSFULLY.........!!!!</center></h1>");
            }
        }
        
        // INSERT QUERY
        if(request.getParameter("page").equals("insertstudent"))
        {
        try
        {
          int STUDENT_SEMESTER=0,YEAR=0,STUDENT_FEE=0,UPTU_ROLL=0,UPTU_RANK=0,UPTU_MARKS=0,MARKS=0,ENROLL_NO=0,PASSWORD=0,a=0;
          String FIRST_NAME=null,LAST_NAME=null,FATHER_NAME=null,MOTHER_NAME=null,ADDRESS=null,STUDENT_EMAIL=null,GUARDIAN_EMAIL=null;
          String QUALIFICATION=null,CATEGORY=null,UNIVERSITY_NAME=null,DEPT_NAME=null,MOBILE_NO=null,AADHAR_NO=null;
          
            if( (request.getParameter("First_name"))!= "" && (request.getParameter("STUDENT_EMAIL"))!= "" && (request.getParameter("GUARDIAN_EMAIL"))!= "" && (request.getParameter("LAST_NAME"))!= ""
                    && (request.getParameter("MOBILE_NO"))!= "" && (request.getParameter("AADHAR_NO"))!= "" && (request.getParameter("STUDENT_SEMESTER"))!= "" && (request.getParameter("ENROLL_NO"))!= "")            
            
            {
                EDUStudent a1=new EDUStudent();
                
                if(a1.isNumber(request.getParameter("STUDENT_SEMESTER")) && a1.isNumber(request.getParameter("MARKS")) && a1.isNumber(request.getParameter("UPTU_ROLL")) && a1.isNumber(request.getParameter("UPTU_RANK"))
                                        && a1.isNumber(request.getParameter("UPTU_MARKS")) && a1.isNumber(request.getParameter("YEAR")) && a1.isNumber(request.getParameter("STUDENT_FEE")) 
                                            && a1.isNumber(request.getParameter("PASSWORD")) && a1.isNumber(request.getParameter("ENROLL_NO")) )
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
                    response.sendRedirect("InsetStudent.jsp?value=2");
                    session.setAttribute("correctDetail","<center><h1>Please Enter Correct Details.....!!!!</center></h1>");
                }
                if((a1.isString(request.getParameter("FIRST_NAME")) && a1.isString(request.getParameter("LAST_NAME")) && a1.isString(request.getParameter("FATHER_NAME")) && a1.isString(request.getParameter("MOTHER_NAME"))
                                        && a1.isString(request.getParameter("ADDRESS")) && a1.isString(request.getParameter("STUDENT_EMAIL")) && a1.isString(request.getParameter("GUARDIAN_EMAIL")) 
                                            && a1.isString(request.getParameter("QUALIFICATION")) && a1.isString(request.getParameter("CATEGORY")) && a1.isString(request.getParameter("UNIVERSITY_NAME")) 
                                                 && a1.isNumber(request.getParameter("AADHAR_NO")) && a1.isNumber(request.getParameter("MOBILE_NO")) && a1.isString(request.getParameter("DEPT_NAME"))))
                {
                   FIRST_NAME  = request.getParameter("FIRST_NAME");
                   LAST_NAME   = request.getParameter("LAST_NAME");
                   FATHER_NAME = request.getParameter("FATHER_NAME");  
                   MOTHER_NAME = request.getParameter("MOTHER_NAME");     
                   ADDRESS = request.getParameter("ADDRESS");
                   STUDENT_EMAIL = request.getParameter("STUDENT_EMAIL");
                   GUARDIAN_EMAIL = request.getParameter("GUARDIAN_EMAIL");
                   QUALIFICATION = request.getParameter("QUALIFICATION");
                   CATEGORY = request.getParameter("CATEGORY");
                   UNIVERSITY_NAME = request.getParameter("UNIVERSITY_NAME");
                   DEPT_NAME       = request.getParameter("DEPT_NAME");
                   MOBILE_NO = request.getParameter("MOBILE_NO");
                   AADHAR_NO    = request.getParameter("AADHAR_NO");
                   a=a+1;
                }
                else
                {
                    request.getSession().setAttribute("status","Entercorrectdetails");
                    response.sendRedirect("InsetStudent.jsp?value=2");
                    session.setAttribute("correctDetail","<center><h1>Please Enter Correct Details.....!!!!</center></h1>");
                }
                   String Student_Image = request.getParameter("Student_Image");
                   String Parents_image = request.getParameter("Parents_image");
                
               if(a==2)
               {
                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");

                 Statement st1=con.createStatement();
    
    
                 ResultSet rs=st1.executeQuery("select * from STUDENT_REGISTRATION_TABLE");
                 int i=0;
                 String FN=null;
                 String LN=null;
                
                        while(rs.next()) //Account exist or not
                        {       
                                 if(STUDENT_EMAIL.equals(rs.getString("STUDENT_EMAIL")) || GUARDIAN_EMAIL.equals(rs.getString("GUARDIAN_EMAIL")) || ENROLL_NO == (rs.getInt("ENROLL_NO")))
                                 {                                   
                                    i=1; // I value change mean account exist
                                    FN=rs.getString("FIRST_NAME");
                                    LN=rs.getString("LAST_NAME");
                                 }
                        }
        
                        if(i==0) // i value not change mean account not exist (ready fo registration)
                        {
                                st1.executeUpdate("INSERT INTO STUDENT_REGISTRATION_TABLE (FIRST_NAME, LAST_NAME, FATHER_NAME, MOTHER_NAME, ADDRESS, MOBILE_NO, STUDENT_EMAIL, GUARDIAN_EMAIL, AADHAR_NO, QUALIFICATION, MARKS, ENROLL_NO, CATEGORY, UPTU_ROLL, UPTU_RANK, UPTU_MARKS, UNIVERSITY_NAME, DEPT_NAME, STUDENT_SEMESTER, YEAR, STUDENT_FEE,Student_Image,Parents_image, PASSWORD)"    
                                  + "VALUES ( '"+FIRST_NAME+"', '"+LAST_NAME+"' , '"+FATHER_NAME+"'  , '"+MOTHER_NAME+"','"+ADDRESS+"',"+MOBILE_NO+",'"+STUDENT_EMAIL+"', '"+GUARDIAN_EMAIL+"', "+AADHAR_NO+" ,'"+QUALIFICATION+"', "+MARKS+" ,"+ENROLL_NO+",'"+CATEGORY+"',"+UPTU_ROLL+", "+UPTU_RANK+" ,"+UPTU_MARKS+",'"+UNIVERSITY_NAME+"', '"+DEPT_NAME+"' ,"+STUDENT_SEMESTER+","+YEAR+","+STUDENT_FEE+",'"+Student_Image+"','"+Parents_image+"',"+PASSWORD+")");
                                 con.close();
                                out.println("<center><h1>"+FIRST_NAME+" "+" "+" "+LAST_NAME+"</center></h1>");
                                
                                request.getSession().setAttribute("status","inserted");
                                response.sendRedirect("InsetStudent.jsp");
                                session.setAttribute("Successfull","<center><h1>Registration successfull....!!!!!</center></h1>");
                         }
                         if(i==1) 
                          {
                            request.getSession().setAttribute("status","notinserted");
                            response.sendRedirect("InsetStudent.jsp?value=2");
                            session.setAttribute("AlreadyExist","<center><h1>Account Already Exist.....!!!!</center></h1>");
                          }
                      
                    }
                    else
                    {
                            request.getSession().setAttribute("status","Entercorrectdetails");
                            response.sendRedirect("InsetStudent.jsp?value=2");
                            session.setAttribute("correctDetail","<center><h1>Please Enter Correct Details.....!!!!</center></h1>");
                    }
            
          } //if NULL
          else{
                            request.getSession().setAttribute("status","NullValue");
                            response.sendRedirect("InsetStudent.jsp?value=2");
                            session.setAttribute("nullvalue","<center><h1>Dont INSERT Null Value.....!!!!</center></h1>");
          }
        }
        catch( Exception e)
        {
                     out.print("NOT INSERTED"+e);
                     //response.sendRedirect("InsetStudent.jsp?value=2")
        }
     }   
%>