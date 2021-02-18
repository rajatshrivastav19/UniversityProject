
package adminPackage;

import com.mysql.cj.xdevapi.Statement;
import java.sql.*;
import org.apache.jasper.tagplugins.jstl.core.Out;

public class EDUParents
{
    int a;
    public Connection conn;
    public void ParentsQuary() throws SQLException //passing
    {
      /*int i=0;
      int enroll= Integer.parseInt(ENROLL_NO);
      
        try
        {
	    Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/University" ,"root", "tiger"); //CHANGEED

                i=0;
                String sql = "SELECT * FROM STUDENT_REGISTRATION_TABLE";  //CGANGED
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                //Integer.parseInt(adminPass);
                
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
             return false;  */        
        }
}
    