package com.java.milon;

import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;


public class GetTableData extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        String val[] = request.getParameter("dbtbl_name").split(",");
        String sql = request.getParameter("sql");
        try {

            Statement stm = DbConnection.getConnection().createStatement();
            stm.execute("use " + val[0]);

            ResultSet rs = stm.executeQuery(sql);
            ResultSetMetaData rsm = rs.getMetaData();


            int cmc = rsm.getColumnCount();

            int kid = 0;

            JSONObject job = new JSONObject();  ///Use JSON (javascript object notation)
            while (rs.next()) {

                kid++;
                JSONObject ob = new JSONObject();
                for (int i = 1; i <= cmc; i++) {

                    ob.put("" + rsm.getColumnName(i), rs.getString(rsm.getColumnName(i)));

                }

                    job.put("" + kid, ob);
                    System.out.println("milon:"+job);
                    //request.setAttribute("TableObject",job);
                }

                response.setContentType("application/json");
                response.getWriter().write(job.toString());



        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}

