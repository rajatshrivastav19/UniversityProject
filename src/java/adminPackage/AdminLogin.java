
package adminPackage;

import com.mysql.cj.xdevapi.Statement;
import java.sql.*;
import org.apache.jasper.tagplugins.jstl.core.Out;

public class AdminLogin
{
    public Connection conn;
    public boolean loginValidationAdmin(String adminID,String adminPass) throws SQLException
    {
      int i=0;
     
        try
        {
	    Class.forName("com.mysql.cj.jdbc.Driver");  //com.mysql.cj.jdbc.Driver
            
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/admin" ,"root", "tiger");
              
                i=0;
                
                String sql = "SELECT * FROM adminlogin";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                //Integer.parseInt(adminPass);
                
                while(rs.next())
                {
            
                    if(adminID.equals(rs.getString("aid")) && adminPass.equals(rs.getString("adminpass")))
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
}
    