<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2/20/2020
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
<%
session.getAttribute("username");
session.invalidate();
//request.getRequestDispatcher("Signin.jsp").forward(request,response);
    response.sendRedirect("Signin.jsp");
%>
</body>
</html>
