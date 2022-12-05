package com.java.milon;

import View.DbWithTable;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DbConnection {

    private static List<String> dbList;
    private static Statement stm;

    private static String url = "jdbc:mysql://localhost:3306/my_database_client";
    private static String username = "root";
    private static String password = "";

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, username, password);
      //System.out.println("Build successfully...");
        stm = connection.createStatement();
        return connection;
    }

    public static List<DbWithTable> getDataList() {
        List<DbWithTable> dbWithTables = new ArrayList();

        dbList = new ArrayList<>();

        try {

            DbConnection db=new DbConnection();
            stm=getConnection().createStatement();
            ResultSet rs = stm.executeQuery("show databases");
            int i = 0;
            while (rs.next()) {

                String dbName = rs.getString(1);
                dbList.add(dbName);

            }

            //System.out.println("List : "+dbList.toString());
            for (String db_name : dbList) {
                DbWithTable obj = new DbWithTable();
                List<String> tables = new ArrayList<>();
                obj.setDbName(db_name);
                //System.out.println("Db_Name : "+db_name);
                stm.execute("use " + db_name);
                ResultSet rs2 = stm.executeQuery("show tables");
                while (rs2.next()) {

                    tables.add(rs2.getString(1));
                }

                obj.setTblList(tables);
                dbWithTables.add(obj);
                //System.out.println(tables);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return dbWithTables;

    }

    public static void main(String[] args) {

        try {
            getConnection();


           // System.out.println(stm.execute("create table tbl12 (id int)"));

        } catch (Exception ex) {
            Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}


