<%-- 
    Document   : Controlador_Reservar_Aula
    Created on : 23-oct-2019, 22:59:13
    Author     : isa
--%>
<%@page import="java.util.LinkedList"%>
<%@page import="Centro.Profesor"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <% if (request.getParameter("reservar") != null) {
                Profesor p = (Profesor) session.getAttribute("profe");
                int cod = p.getCod_Prof();
                int cod_Aula = (Integer) session.getAttribute("cod_aula");
                String fecha = (String) session.getAttribute("fecha");
                int cod_Hora = Integer.parseInt(request.getParameter("cod_hora"));

                ConexionEstatica.nueva();
                ConexionEstatica.insertarReserva(cod_Hora, cod_Aula, fecha, cod, 0);
                LinkedList Lista_Horario = ConexionEstatica.obtenerHorario();
                session.setAttribute("horario", Lista_Horario);
                LinkedList Lista_Horas_Reservadas = ConexionEstatica.obetenerHorasReservadas(cod, fecha);
                session.setAttribute("horas_Reservadas", Lista_Horas_Reservadas);
                ConexionEstatica.cerrarBD();

                response.sendRedirect("../Vistas/Reservar_Aula.jsp");
            }
        %>

    </body>
</html>
