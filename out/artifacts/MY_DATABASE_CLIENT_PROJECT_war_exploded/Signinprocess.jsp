<%@page import="com.java.milon.LoginDao" %>
<jsp:useBean id="obj" class="com.java.milon.LoginBean"/>
<jsp:setProperty name="obj" property="*"/>
<%
    boolean status=LoginDao.validate(obj);
    if (status){
        out.println("You are logged in successfully");
        session.setAttribute("session","TRUE");
    }
    else {
        out.print("sorry, username or password invalid");
    }
%>
<a href="Signin.jsp">Click here..</a>