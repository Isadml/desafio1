<%-- 
    Document   : Controlador_Admin_Aulas
    Created on : 23-oct-2019, 17:49:25
    Author     : isa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <% //Si el administrador de aulas elige la opción de gestión de aulas
            if (request.getParameter("aulas") != null) {
                response.sendRedirect("../Vistas/Gestion_Aulas.jsp");
            }
            //Si el administrador de aulas elige la opción de gestión de horarios
            if (request.getParameter("horario") != null) {
                response.sendRedirect("../Vistas/Gestion_Horarios.jsp");
            }
%>

    </body>
</html>
