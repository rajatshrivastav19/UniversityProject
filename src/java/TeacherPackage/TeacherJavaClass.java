/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TeacherPackage;


public class TeacherJavaClass 
{
    
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
    
}