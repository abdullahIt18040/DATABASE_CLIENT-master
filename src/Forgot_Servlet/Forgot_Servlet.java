package Forgot_Servlet;

import com.java.milon.DbConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by Asus on 3/9/2020.
 */
public class Forgot_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String emailcode=request.getSession().getAttribute("Confirmation_code").toString();
        String code= request.getParameter("confirm_code");
        if (code.equalsIgnoreCase(emailcode)){


            String email=request.getSession().getAttribute("email").toString();

            String password=request.getSession().getAttribute("password").toString();

            int status;
            try {
                Connection con= DbConnection.getConnection();
                PreparedStatement ps=con.prepareStatement("UPDATE registration SET password=? WHERE email=?");

                ps.setString(2,email);

                ps.setString(1,password);

                status=ps.executeUpdate();

                if (status>0){
                    request.getRequestDispatcher("Success.jsp").forward(request,response);
                }
            }catch (Exception e){
                e.printStackTrace();
            }


            //String message="Welcome ! Registration Successfully";
            //request.setAttribute("message",message);
            request.getRequestDispatcher("Success.jsp").forward(request,response);
        }
        else {
            String message="!!..This Code is Wrong code..!!";
            request.setAttribute("message",message);

            //System.out.println("wrong");
            request.getRequestDispatcher("ConfirmationForgot.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
