<%-- 
    Document   : Controlador_Gestion_Horarios
    Created on : 23-oct-2019, 17:50:39
    Author     : isa
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Centro.Horario"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% //Para modificar las horas que hay en la BBDD
            if (request.getParameter("modificar") != null) {
                int cod = Integer.parseInt(request.getParameter("cod_hora"));
                String hora_i = request.getParameter("hora_inicio");
                String hora_f = request.getParameter("hora_final");
                ConexionEstatica.nueva();
                ConexionEstatica.modificarHorario(cod, hora_i, hora_f);
                LinkedList<Horario> ListaHorario = ConexionEstatica.obtenerHorario();
                session.setAttribute("horario", ListaHorario);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Gestion_Horarios.jsp");
            }

            //Para borrar las horas de la BBDD
            if (request.getParameter("borrar") != null) {
                int cod = Integer.parseInt(request.getParameter("cod_hora"));
                ConexionEstatica.nueva();
                ConexionEstatica.borrarHorario(cod);
                LinkedList<Horario> ListaHorario = ConexionEstatica.obtenerHorario();
                session.setAttribute("horario", ListaHorario);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Gestion_Horarios.jsp");
            }

            //Para añadir horas a la BBDD
            if (request.getParameter("add") != null) {
                int cod = Integer.parseInt(request.getParameter("cod_hora"));
                String hora_i = request.getParameter("hora_inicio");
                String hora_f = request.getParameter("hora_final");
                ConexionEstatica.nueva();
                ConexionEstatica.insertarHora(cod, hora_i, hora_f);
                LinkedList<Horario> ListaHorario = ConexionEstatica.obtenerHorario();
                session.setAttribute("horario", ListaHorario);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Gestion_Horarios.jsp");
            }

            //Cerrar sesión
            if (request.getParameter("cerrar") != null) {
                session.invalidate();
                response.sendRedirect("../index.jsp");
            }

        %>

        
    </body>
</html>
