package Forgot_Servlet;

import Mail.SendEmail;
import com.java.milon.DbConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by Asus on 2/19/2020.
 */
public class Forgot_Password extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {
            String email=request.getParameter("email");
            String password=request.getParameter("password");
//            PreparedStatement ps=con.prepareStatement("UPDATE registration SET password=? WHERE email=?");
//            ps.setString(2,email);
//            ps.setString(1,password);
//            int i=ps.executeUpdate();


            int code= (int) ((Math.random()*99999)+11111);
            SendEmail.send(email,"Confirmation code","Welcome to Database Client . Your code here:"+code,SendEmail.TEXT_MAIL);


                request.getSession().setAttribute("email",email);
                request.getSession().setAttribute("password",password);
                request.getSession().setAttribute("Confirmation_code",code);
                request.getRequestDispatcher("ConfirmationForgot.jsp").forward(request,response);
                //response.sendRedirect("ConfirmationEmail.jsp");



        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
