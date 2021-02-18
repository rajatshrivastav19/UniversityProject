<%-- 
    Document   : ApachePOIStudentExelFile
    Created on : Feb 12, 2021, 11:50:56 AM
    Author     : Lenovo
--%>


<%@page import="MailPackage.JavaMailAPI"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <body>
        <h1>hello world!!</h1>
    </body>
</html>

<%  
      if(request.getParameter("page").equals("MakeExelFile"))
      {
          
       try
       {
        
        if(request.getParameter("ENROLL_NO")!="")
        {
                int enroll_no = Integer.parseInt(request.getParameter("ENROLL_NO"));
                String email = request.getParameter("EMAILID");
                boolean send= false;
                int make=0;
                     int STUDENT_SEMESTER=0,YEAR=0,STUDENT_FEE=0,UPTU_ROLL=0,UPTU_RANK=0,UPTU_MARKS=0,MARKS=0,ENROLL_NO=0,PASSWORD=0,a=0;
                     String FIRST_NAME=null,LAST_NAME=null,FATHER_NAME=null,MOTHER_NAME=null,ADDRESS=null,STUDENT_EMAIL=null,GUARDIAN_EMAIL=null;
                     String QUALIFICATION=null,CATEGORY=null,UNIVERSITY_NAME=null,DEPT_NAME=null,MOBILE_NO=null,AADHAR_NO=null;
                     String Student_Image=null, Parents_image=null;
             
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");
                String sql= "SELECT * FROM student_registration_table WHERE ENROLL_NO="+enroll_no;
                PreparedStatement ps1= conn.prepareStatement(sql);
                ResultSet rs1=ps1.executeQuery();
                
                //ResultSet rs=ps1.executeQuery();
                
                int resultset=0;
                
                out.print("   ResultSet "+resultset);
                while(rs1.next())
                {
                    if(enroll_no== rs1.getInt("ENROLL_NO"))
                    {
                            resultset++;
                    }
                }
        if(resultset==0)        
        {
                request.getSession().setAttribute("status","Worng&Enrollment&Number");
                response.sendRedirect("TeacherMainPage.jsp?value=Incorrect&Enroll&Number");
                session.setAttribute("EnterCorrectEnrollment","<center><h1>You Enter Incorrect Number....!!!!</center></h1>");
        }
        else
        {
                out.print("Result Set"+resultset);
                
                String sql1="SELECT * FROM student_registration_table WHERE ENROLL_NO="+enroll_no;
                PreparedStatement ps2= conn.prepareStatement(sql1);
                ResultSet rs=ps2.executeQuery();
                
                XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("Student_Details");  // create a sheet in this workbook
                
                int rows,col;
                
                    for(int i=0; rs.next() ; i++)
                    {
                             rows=i;
                             out.print("i : "+rows);
                             Row row = sheet.createRow(i);  // create a row in this sheet
                            
                            for (int j = 0; j < 23 ; j++)
                            {

                                    Cell cell = row.createCell(j); // create a cell in this row
                                    
                                     if(i==rows && j==0)
                                     cell.setCellValue(rs.getString("FIRST_NAME"));
                                     if(i==rows && j==1)
                                     cell.setCellValue(rs.getString("LAST_NAME"));
                                     if(i==rows && j==2)
                                     cell.setCellValue(rs.getString("FATHER_NAME"));
                                     if(i==rows && j==3)
                                     cell.setCellValue(rs.getString("MOTHER_NAME"));
                                     if(i==rows && j==4)
                                     cell.setCellValue(rs.getString("ADDRESS"));
                                     if(i==rows && j==5)
                                     cell.setCellValue(rs.getString("STUDENT_EMAIL"));
                                     if(i==rows && j==6)
                                     cell.setCellValue(rs.getString("GUARDIAN_EMAIL"));
                                     if(i==rows && j==7)
                                     cell.setCellValue(rs.getString("QUALIFICATION"));
                                     if(i==rows && j==8)
                                     cell.setCellValue(rs.getInt("MARKS"));
                                     if(i==rows && j==9)
                                     cell.setCellValue(rs.getInt("ENROLL_NO"));
                                     if(i==rows && j==10)
                                     cell.setCellValue(rs.getString("CATEGORY"));
                                     if(i==rows && j==12)
                                     cell.setCellValue(rs.getInt("UPTU_ROLL"));
                                     if(i==rows && j==13)
                                     cell.setCellValue(rs.getInt("UPTU_RANK"));     
                                     if(i==rows && j==14)
                                     cell.setCellValue(rs.getInt("UPTU_MARKS"));
                                     if(i==rows && j==15)
                                     cell.setCellValue(rs.getString("UNIVERSITY_NAME"));
                                     if(i==rows && j==16)
                                     cell.setCellValue(rs.getString("DEPT_NAME"));
                                     if(i==rows && j==17)
                                     cell.setCellValue(rs.getInt("STUDENT_SEMESTER"));
                                     if(i==rows && j==18)
                                     cell.setCellValue(rs.getInt("YEAR"));
                                     if(i==rows && j==19)
                                     cell.setCellValue(rs.getInt("STUDENT_FEE"));
                                     if(i==rows && j==20)
                                     cell.setCellValue(rs.getInt("PASSWORD"));
                                     if(i==rows && j==21)
                                     cell.setCellValue(rs.getString("MOBILE_NO"));
                                     if(i==rows && j==22)
                                     cell.setCellValue(rs.getString("AADHAR_NO"));
                                 
                                     FileOutputStream fo = new FileOutputStream ("f:\\Students.xlsx", false);  // create a file in write mode
			             workbook.write(fo); //print
                                     
                            }
                             sheet.autoSizeColumn(i); //Size of Sheet
                    }             
                   workbook.close();
                out.print("OK");
                make=1;
                
            }
            if(make==1)
            {
                    JavaMailAPI sendemail= new JavaMailAPI();
                    sendemail.sendEmailWithAttachment("F:\\Students.xlsx",email); 
            }
        }
        else
        {
            out.print("Null value dont exits!!!");
        }    
      }
       catch(Exception e)
       {
           out.print("Error " + e.getMessage());
       }
        
      }
%>