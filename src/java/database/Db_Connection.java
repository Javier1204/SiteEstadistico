package database;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Db_Connection 
{
    public Connection Connection()
    {
        try 
        {
                String bd = "ufps_76";
                String login = "ufps_76";
            String password = "ufps_29";
             String url = "jdbc:mysql://sandbox2.ufps.edu.co/"+bd;
            Class.forName("com.mysql.jdbc.Driver");
            String TechWorld3g_2 = "jdbc:mysql://sandbox2.ufps.edu.co/"+bd;
            Connection myConnection = DriverManager.getConnection(TechWorld3g_2,login,password);
            
            return myConnection;
        } catch (ClassNotFoundException | SQLException ex) {Logger.getLogger(Db_Connection.class.getName()).log(Level.SEVERE, null, ex);}
        return null;
    }
}
