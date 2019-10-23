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

        <%  //Modificar una reserva de aula con el código de la reserva
            if (request.getParameter("modificar") != null) {
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

            //Borrar o eliminar una reserva
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

            //Añadir una reserva nueva a la lista
            if (request.getParameter("add")!= null) {
                response.sendRedirect("../Vistas/Login_Profesores.jsp");
            }

            //Cerrar sesión
            if (request.getParameter("cerrar")!= null) {
                session.invalidate();
                response.sendRedirect("../index.jsp");
            }
        %>

    </body>
</html>
