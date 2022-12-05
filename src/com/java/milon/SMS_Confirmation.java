package Sms;

import Mail.SendEmail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Asus on 2/26/2020.
 */
@WebServlet(name = "SMS_Confirmation",urlPatterns = {"/sms_confirm"})
public class SMS_Confirmation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int code= (int) ((Math.random()*99999)+11111);
      SMS_Send.send_sms("The Code is:"+code);
        //String smscode=request.getSession().getAttribute("sms_confirmation_code").toString();
        String codes= request.getParameter("confirmsmscode");
        if (codes.equalsIgnoreCase(String.valueOf(code))){
            String message="Login Successfully..";
            request.setAttribute("msg",message);
          request.getRequestDispatcher("welcome.jsp").forward(request,response);
           // response.sendRedirect("welcome.jsp");
        }
        else {
            String message="Wrong code";
            request.setAttribute("msg",message);
            request.getRequestDispatcher("ConfirmationSms.jsp").forward(request,response);
           // response.sendRedirect("Confirmation.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
