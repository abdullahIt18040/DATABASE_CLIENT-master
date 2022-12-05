package com.java.milon;

import Sms.SMS_Send;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username=request.getParameter("username");
        String password=request.getParameter("password");

        try {
           Connection con= DbConnection.getConnection();
            PreparedStatement ps=con.prepareStatement("SELECT * FROM registration WHERE username=? AND password=?");
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet rs=ps.executeQuery();

            if (rs.next()){

                request.setAttribute("dataList", DbConnection.getDataList());
                HttpSession session=request.getSession();
                session.setAttribute("username",username);
                request.getRequestDispatcher("welcome.jsp").forward(request,response);
            }
            else {
                request.getRequestDispatcher("Signin.jsp").forward(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
