<%-- 
    Document   : Controlador_Admin_Aulas
    Created on : 23-oct-2019, 17:49:25
    Author     : isa
--%>

<%@page import="Centro.Horario"%>
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

        <% //Si el administrador de aulas elige la opción de gestión de aulas
            if (request.getParameter("aulas") != null) {
                ConexionEstatica.nueva();
                LinkedList<Aula> ListaAula = ConexionEstatica.obtenerAulas();
                session.setAttribute("aulas", ListaAula);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Gestion_Aulas.jsp");
            }
            //Si el administrador de aulas elige la opción de gestión de horarios
            if (request.getParameter("horario") != null) {
                ConexionEstatica.nueva();
                LinkedList<Horario> ListaHorario = ConexionEstatica.obtenerHorario();
                session.setAttribute("horario", ListaHorario);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Gestion_Horarios.jsp");
            }
%>

    </body>
</html>
