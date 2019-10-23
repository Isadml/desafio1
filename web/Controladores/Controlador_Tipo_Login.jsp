<%-- 
    Document   : Controlador_Tipo_Login
    Created on : 23-oct-2019, 10:56:24
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

        <% //Si un usuario con permisos de nivel 1, 2 o 3 elige logearse como profesor normal
            if (request.getParameter("normal") != null) {
                response.sendRedirect("../Vistas/Login_Profesores.jsp");
            }

            //Si un usuario con permisos de nivel 2 o 3 elige logearse como administrador de aulas
            if (request.getParameter("admin_aula") != null) {
                response.sendRedirect("../Vistas/Admin_Aulas.jsp");
            }

            //Si un usuario con permisos de nivel 3 elige logearse como administrador general
            if (request.getParameter("admin_general")!= null) {
                response.sendRedirect("../Vistas/Admin_General.jsp");
            }

        %>

    </body>
</html>
