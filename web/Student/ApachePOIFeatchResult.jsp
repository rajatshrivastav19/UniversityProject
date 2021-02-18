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
      if(request.getParameter("page").equals("MakeResultExelFile"))
      {
          
       try
       {
                //int enroll_no = Integer.parseInt(request.getParameter("ENROLL_NO"));
                String email = request.getParameter("emailid").toString();
                out.print("Email.com="+email);
                //boolean send= false;
                int make=0;
                
                     /*int QUSTION_NO=0;
                     String Student_Answer=null,STATUS=null;*/
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");
                               
                String sql = "SELECT * FROM StudentGiveExam";
                PreparedStatement ps= conn.prepareStatement(sql);
                ResultSet rs=ps.executeQuery();
                
                XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("Student_Details");  // create a sheet in this workbook
                FileOutputStream fo;
                
                int rows=0;
                int col=0;
                
                for (int i = 0; i < 1; i++) 
                {              rows=i;
                                Row row = sheet.createRow(i);  // create a row in this sheet
                      for (int j = 0; j < 4; j++) 
                      {
                                    Cell cell = row.createCell(j); // create a cell in this row
                                    
                                    if(i==rows && j==0)
                                      cell.setCellValue("QUSTION_NO");
                                     if(i==rows && j==1)
                                      cell.setCellValue("Your_Answered");
                                     if(i==rows && j==2)
                                      cell.setCellValue("STATUS");       
                                   fo   = new FileOutputStream ("f:\\StudentsResult.xlsx", false);
                      }
                }
                    for(int i=1; rs.next() ; i++)
                    {
                            rows=i;
                             //out.print("i : "+rows);
                             Row row = sheet.createRow(i);  // create a row in this sheet
                            
                            for (int j = 0; j < 4 ; j++)
                            {
                                    Cell cell = row.createCell(j); // create a cell in this row

                                     if(i==rows && j==0)
                                      cell.setCellValue(rs.getString("QUSTION_NO"));
                                     if(i==rows && j==1)
                                      cell.setCellValue(rs.getString("Student_Answer"));
                                     if(i==rows && j==2)
                                      cell.setCellValue(rs.getString("STATUS"));
                                     
                                     fo = new FileOutputStream ("f:\\StudentsResult.xlsx", false);  // create a file in write mode
			             workbook.write(fo); //print 
                            }
                            col=1;
                         sheet.autoSizeColumn(i); //Size of Sheet
                       make=1;
                    }
           
                   workbook.close();
                           out.print("OK");
                
            if(make==1)
            {
                    JavaMailAPI sendemail= new JavaMailAPI();
                    sendemail.sendEmailWithAttachment("F:\\StudentsResult.xlsx",email);
                    response.sendRedirect("StudentSendResultExcelFile.jsp?Value=Result&Send&successfully&to"+email+"");
            }
       }
       catch(Exception e)
       {
           out.print("Error " + e.getMessage());
       }
        
      }
%>