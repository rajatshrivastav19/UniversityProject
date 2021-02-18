
package adminPackage;

import com.mysql.cj.xdevapi.Statement;
import java.sql.*;
import org.apache.catalina.Session;
import org.apache.jasper.tagplugins.jstl.core.Out;

public class EDUStudent
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
    
    int a;
    private Connection conn;
    
    public boolean enrollVailedation( String ENROLL_NO) throws SQLException //passing
    {
      int enroll;
      //CONDITION FOR AVOID STRINGS AND NULL ARRGUMENTS   
      if(ENROLL_NO == "") //kuch bhi value agar null he to
      {
          return false; 
      }                     //AVOID IF NULL STRING
      else{
        if(isNumber(ENROLL_NO))  
        {
            enroll= Integer.parseInt(ENROLL_NO);
        }
        else
        {
             return false; 
        } //AVOID IF STRING GROUP OF CHAR.
      }
        try
        {
	    Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/University" ,"root", "tiger"); //CHANGEED

                i=0;
                String sql = "SELECT * FROM STUDENT_REGISTRATION_TABLE";  //CGANGED
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next())
                {
                    if((rs.getInt("ENROLL_NO")) == enroll) //CHANGED
                    {
                        i++;
                    }
                }
        }
        catch(Exception e1)
	{
	    System.out.println(e1.getMessage());
	}
        if(i==1)
              return true;
        else
             return false;          
    }

    public boolean updateStudent(String ENROLL_NO, String slecteattribute, String EnterUdatedvalue)
    {
        int enrollno = Integer.parseInt(ENROLL_NO);
        int Udatedvalue;
        int j=0;
        int i=0;
        
        try
        {
	    Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn1= DriverManager.getConnection("jdbc:mysql://localhost:3306/University" ,"root", "tiger"); //CHANGEED
                String s1 = "Select * from STUDENT_REGISTRATION_TABLE";
                PreparedStatement ps1 = conn1.prepareStatement(s1);

                            if(EnterUdatedvalue.equals(null)) //kuch bhi value agar null he to
                            {
                                return false; 
                            }                         //AVOID IF NULL STRING
                            else
                            {
                                if(( isNumber(EnterUdatedvalue) && slecteattribute=="MARKS" || slecteattribute=="UPTU_ROLL" || slecteattribute=="UPTU_RANK"
                                        || slecteattribute=="UPTU_MARKS" || slecteattribute=="STUDENT_SEMESTER" || slecteattribute=="YEAR" || slecteattribute=="STUDENT_FEE" || slecteattribute=="PASSWORD"
                                        || slecteattribute=="AADHAR_NO" || slecteattribute==("MOBILE_NO")))
                                {
                                        Udatedvalue = Integer.parseInt(EnterUdatedvalue);
                                        String sql = "UPDATE STUDENT_REGISTRATION_TABLE SET "+slecteattribute+" = ? WHERE ENROLL_NO ="+enrollno;  //CGANGED
                                        PreparedStatement ps = conn1.prepareStatement(sql);
                                        ps.setInt(1,Udatedvalue);
                                        int k = ps.executeUpdate();
                                }
                                else
                                {
                                        String sql = "UPDATE STUDENT_REGISTRATION_TABLE SET "+slecteattribute+" = ? WHERE ENROLL_NO ="+enrollno;  //CGANGED
                                        PreparedStatement ps = conn1.prepareStatement(sql);
                                        ps.setString(1,EnterUdatedvalue);
                                        int k = ps.executeUpdate();
                                }
                            }
                
                 //UPDATE Quarytable SET quary = 'Others' WHERE qid = 1;
                j++;
        }
        catch(Exception e1)
	{
	    System.out.println(e1.getMessage());
          
	}
      if(j==1)
          return true;
              else
        return false;
    }
    public boolean InsertStudent(String enrollID, String slecteattribute, String EnterUdatedvalue)
    {
        int enrollno = Integer.parseInt(enrollID);
        int j=0;
        try
        {
	    Class.forName("com.mysql.cj.jdbc.Driver");
            
                Connection conn1= DriverManager.getConnection("jdbc:mysql://localhost:3306/University" ,"root", "tiger"); //CHANGEED

                String sql = "INSERT INTO STUDENT_REGISTRATION_TABLE  ("+slecteattribute+") = ? WHERE ENROLL_NO ="+enrollno;  //CGANGED
                        
                 //UPDATE Quarytable SET quary = 'Others' WHERE qid = 1;
                PreparedStatement ps = conn1.prepareStatement(sql);
                //ps.setString(1,slecteattribute);
                ps.setString(1,EnterUdatedvalue);
                int k = ps.executeUpdate();
                j++;
        }
        catch(Exception e1)
	{
	    System.out.println(e1.getMessage()); 
	}
      if(j==1)
          return true;
              else
        return false;
    }
}
