<%@page import="com.java.milon.RegisterDao" %>
<jsp:useBean id="obj" class="com.java.milon.User" />
<jsp:setProperty name="obj" property="*"/>
<%
    int status=RegisterDao.register(obj);
    if (status>0){
        System.out.println("Successfully....");
        response.sendRedirect("Signin.jsp");
    }

%>