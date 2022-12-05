/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_CONNECTION;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBConnection {

    private static Statement stm;

    public DBConnection() throws Exception
    {
        String url = "jdbc:mysql://localhost:3306/my_database_client?autoReconnect=true&useSSL=false";
        String username = "root";
        String password = "";
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, username, password);
        //System.out.println("Build successfully...");
        stm = connection.createStatement();
        
    }
    
    public Statement getStatement(){
        return stm;
    }

}
