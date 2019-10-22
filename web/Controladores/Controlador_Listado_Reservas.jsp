<%-- 
    Document   : Controlador_Listado_Reservas
    Created on : 22-oct-2019, 10:06:00
    Author     : daw203
--%>

<%@page import="Centro.Profesor"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%  if (request.getParameter("modificar") != null) {
                ConexionEstatica.nueva();
                Profesor p = (Profesor) session.getAttribute("profe");
                LinkedList Lista = ConexionEstatica.obtenerReservas(p.getCod_Prof());
                session.setAttribute("reservas", Lista);
                int cod = Integer.parseInt(request.getParameter("cod_reser"));
                int cod_Hora = Integer.parseInt(request.getParameter("cod_hora"));
                int cod_Aula = Integer.parseInt(request.getParameter("cod_aula"));
                String fecha = request.getParameter("fecha");

                ConexionEstatica.modificarReserva(cod, cod_Hora, cod_Aula, fecha);
                Lista = ConexionEstatica.obtenerReservas(p.getCod_Prof());
                session.setAttribute("reservas", Lista);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Listado_Reservas.jsp");
            }

            if (request.getParameter("borrar")!= null) {
                ConexionEstatica.nueva();
                Profesor p = (Profesor) session.getAttribute("profe");
                int cod = Integer.parseInt(request.getParameter("cod_reser"));
                ConexionEstatica.borrarReserva(cod);
                LinkedList Lista = ConexionEstatica.obtenerReservas(p.getCod_Prof());
                session.setAttribute("reservas", Lista);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Listado_Reservas.jsp");
            }

            if (request.getParameter("add")!= null) {
                response.sendRedirect("../Vistas/Login_Profesores.jsp");
            }

            if (request.getParameter("cerrar")!= null) {
                session.invalidate();
                response.sendRedirect("../index.jsp");
            }
        %>

    </body>
</html>
