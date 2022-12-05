package Mail;

import com.java.milon.DbConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by Asus on 2/21/2020.
 */
public class Email_Confirmation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        String emailcode=request.getSession().getAttribute("Confirmation_code").toString();
        String code= request.getParameter("confirm_code");
        if (code.equalsIgnoreCase(emailcode)){

            String username=request.getSession().getAttribute("username").toString();
            String email=request.getSession().getAttribute("email").toString();
            String gender=request.getSession().getAttribute("gender").toString();
            String password=request.getSession().getAttribute("password").toString();
            String country=request.getSession().getAttribute("country").toString();
            int status;
            try {
                Connection con= DbConnection.getConnection();
                PreparedStatement ps=con.prepareStatement("INSERT INTO registration VALUES (?,?,?,?,?)");
                ps.setString(1,username);
                ps.setString(2,email);
                ps.setString(3,gender);
                ps.setString(4,password);
                ps.setString(5,country);
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
            request.setAttribute("msg",message);

            //System.out.println("wrong");
            request.getRequestDispatcher("ConfirmationEmail.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
