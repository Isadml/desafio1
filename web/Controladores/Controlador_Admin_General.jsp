<%-- 
    Document   : Controlador_Admin_General
    Created on : 23-oct-2019, 18:17:49
    Author     : isa
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Centro.Aula"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <% //Si el administrador general elige la opción de gestión de aulas
            if (request.getParameter("aulas") != null) {
                ConexionEstatica.nueva();
                LinkedList<Aula> ListaAula = ConexionEstatica.obtenerAulas();
                session.setAttribute("aulas", ListaAula);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Gestion_Aulas.jsp");
            }
            //Si el administrador general elige la opción de gestión de horarios
            if (request.getParameter("horario") != null) {
                response.sendRedirect("../Vistas/Gestion_Horarios.jsp");
            }

            //Si el administrador general elige la opción de gestión de usuarios
            if (request.getParameter("usuarios") != null) {
                response.sendRedirect("../Vistas/Gestion_Usuarios.jsp");
            }
        %>

    </body>
</html>
