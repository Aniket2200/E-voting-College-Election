

<!-- this page is called when log out buttonis clicked -->
<!-- user session becomes null and he is redirected to login page -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    
    </head>
    <body>

        <h1>your session is expired...</h1>
        <%
            session.setAttribute("who",null);
            response.sendRedirect("../login/voter.jsp");
        %>
   
    </body>
</html>
