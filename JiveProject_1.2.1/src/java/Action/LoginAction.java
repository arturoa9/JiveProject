/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport 
{

   private String OS;
   private String OSversion;
   private String notes;
   
   /*
   These are the the values that I used to connect to my database and get this 
   file running succesfully.
   If it cannot connect to your databse simple change the values of "URL", "Username",
   and "Password" to match the configuration of your database.
   */
   
   private final String URL = "jdbc:mysql://localhost:3307/DBase";
   private final String Username = "root";
   private final String Password = "";

   public String execute() 
   {
      String ret = ERROR;
      Connection conn = null;

      try 
      {
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(URL, Username, Password);
         String sql = "INSERT INTO information_table VALUES (?,?,?)";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, OS);
         ps.setString(2, OSversion);
         ps.setString(3, notes);
         int rs = ps.executeUpdate();
         if (rs>0) 
         {    
            ret = SUCCESS;
         }
      } 
      catch (Exception e) 
      {
         ret = ERROR;
      } 
      finally 
      {
         if (conn != null) 
         {
            try 
            {
               conn.close();
            } 
            catch (Exception e) 
            {
            }
         }
      }
      return ret;
   }

   public String getOS() 
   {
      return OS;
   }

   public void setOS(String OS) 
   {
      this.OS = OS;
   }

   public String getOSversion() 
   {
      return OSversion;
   }

   public void setOSversion(String OSversion) 
   {
      this.OSversion = OSversion;
   }

   public String getNotes() 
   {
      return notes;
   }

   public void setNotes(String notes) 
   {
      this.notes = notes;
   }
   
   public void validate()
   {
      if (OS == null || OS.trim().equals(""))
      {
         addFieldError("OS","The OS is required\n");
      }
      if (OSversion == null || OSversion.trim().equals(""))
      {
         addFieldError("OSversion","The version of the OS is required\n");
      }
   }
}