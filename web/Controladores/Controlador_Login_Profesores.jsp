<%-- 
    Document   : Controlador_Login_Profesores
    Created on : 21-oct-2019, 10:59:35
    Author     : daw203
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <% if (request.getParameter("ver") != null) {
                
            }

            if (request.getParameter("volver") != null) {

            }

            if (request.getParameter("cerrar") != null) {
                session.invalidate();
                response.sendRedirect("../index.jsp");
            }
        %>

    </body>
</html>
