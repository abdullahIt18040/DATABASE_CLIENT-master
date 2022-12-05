package com.java.milon;

import Database_Service.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Asus on 2/21/2020.
 */
public class Query_Execute extends HttpServlet {
    Service s;
    public Query_Execute(){
        s=new Service();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sql = request.getParameter("sql");

        if (sql.startsWith("select")) {

            String r = s.executeQuery(sql);

            if (r.startsWith("Error")) {
                response.getWriter().write(r);
            } else {
                response.setContentType("application/json");
                response.getWriter().write(r);
            }

            //System.out.println(r);
            //request.setAttribute("datalist",r);
            //request.getRequestDispatcher("datatable.jsp").forward(request,response);

        } else {
           // System.out.println(sql);
            String val = s.execute(sql);

            response.getWriter().write(val);

            // System.out.println("EXE QUERY : " + val);
        }


    }

}



