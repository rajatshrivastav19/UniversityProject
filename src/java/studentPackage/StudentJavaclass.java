/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package studentPackage;

import static java.lang.System.out;
import java.sql.*;

public class StudentJavaclass 
{
    int i=0;
    public boolean isNumber(String s)    //cheak no is integer or string
    {
        for (int i = 0; i < s.length(); i++)
            if (Character.isDigit(s.charAt(i)) == false)
                return false;
 
        return true;
    }
    public boolean isString(String s)    //cheak no is integer or string
    {
    for (int i = 0; i < s.length(); i++)
        if (Character.isDigit(s.charAt(i)) == false)
            return true;

         return false;
    }
    
    public boolean  EmailValidation(String STUDENT_EMAIL ) throws SQLException
    {
        String email= STUDENT_EMAIL.toString();
        int check=0;
        
        try
        {
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");
         String sql= "SELECT * FROM STUDENT_REGISTRATION_TABLE";
         
            if(email.endsWith("@GMAIL.COM") || email.endsWith("@YAHOO.COM") || email.endsWith("@gmail.com") || email.endsWith("@yahoo.com") )
            {
                PreparedStatement ps=conn.prepareStatement(sql);
            
                ResultSet rs=ps.executeQuery();
            
                while(rs.next())
                {
                    if(email.equals(rs.getString("STUDENT_EMAIL")))
                    {
                        check++;
                    }
                }
            }
            else
                return false;
        }
        catch(Exception e)
        {
             System.out.println(e.getMessage()+" Your Email Is In Uper Or Lower  Please Insert Correct Value.");
        }
        if(check==1)
            return true;
        else
            return false;
     }
    
    
     public boolean loginValidationStudent(String STUDENT_EMAIL, String PASSWORD) throws SQLException
     {
        int check=0;
        try
        {
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");
         String sql= "SELECT * FROM STUDENT_REGISTRATION_TABLE";
        
        int password;
          if(isNumber(PASSWORD))
            password = Integer.parseInt(PASSWORD);
         else
            return false;
            
        
          if(STUDENT_EMAIL.endsWith("@GMAIL.COM") || STUDENT_EMAIL.endsWith("@YAHOO.COM"))
          {
            PreparedStatement ps=conn.prepareStatement(sql);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next())
            {
                    if(STUDENT_EMAIL.equals(rs.getString("STUDENT_EMAIL")) && password == rs.getInt("PASSWORD"))
                    {
                        check++;
                    }
            }
          }
          else
            return false;
        }
        catch(Exception e)
        {
             System.out.println(e.getMessage()+"Not Inserted: ");
        }
        if(check==1)
            return true;
         else
            return false;
    }
     
    public int InsertQustions (int Qustion_no, String Student_Ans)
    {
        
        try
             {
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","tiger");
              
              
              String update= "INSERT INTO StudentGiveExam(Qustion_no,Student_Answer)"+
                                   "Values(? ,?)";
              PreparedStatement smt = con.prepareStatement(update);
              smt.setInt(1, Qustion_no);
              smt.setString(2, Student_Ans);
              
              smt.executeUpdate();
             // response.sendRedirect("StudentMainPage.jsp?value=Update&successfully");
             Qustion_no++;
             }
             catch(Exception e)
             {
                 out.print(e.getMessage());
             }
        return Qustion_no;
    }
