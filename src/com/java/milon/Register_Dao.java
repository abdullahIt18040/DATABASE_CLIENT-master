package com.java.milon;

import Mail.SendEmail;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class Register_Dao extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username=request.getParameter("username");
        String email=request.getParameter("email");
        String gender=request.getParameter("gender");
        String password=request.getParameter("password");
        String country=request.getParameter("country");
        //int status;

        int code= (int) ((Math.random()*99999)+11111);
        SendEmail.send(email,"Confirmation code","Welcome to Database Client . Your code here:"+code,SendEmail.TEXT_MAIL);
//        try {
//            Connection con= DbConnection.getConnection();
//            PreparedStatement ps=con.prepareStatement("INSERT INTO registration VALUES (?,?,?,?,?)");
//            ps.setString(1,username);
//            ps.setString(2,email);
//            ps.setString(3,gender);
//            ps.setString(4,password);
//            ps.setString(5,country);
//            status=ps.executeUpdate();
//
////            int code= (int) ((Math.random()*99999)+11111);
////            SendEmail.send(email,"Confirmation code","Welcome to Database Client . Your code here:"+code,SendEmail.TEXT_MAIL);
//
//            if (status>0){
                request.getSession().setAttribute("username",username);
                request.getSession().setAttribute("email",email);
                request.getSession().setAttribute("gender",gender);
                request.getSession().setAttribute("password",password);
                request.getSession().setAttribute("country",country);

                request.getSession().setAttribute("Confirmation_code",code);
                request.getRequestDispatcher("ConfirmationEmail.jsp").forward(request,response);
//            }else {
//                String msg="Something is wrong please try again";
//                request.setAttribute("msg",msg);
//                request.getRequestDispatcher("Signup.jsp").forward(request,response);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
