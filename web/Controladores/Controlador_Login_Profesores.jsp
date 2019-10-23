<%-- 
    Document   : Controlador_Login_Profesores
    Created on : 21-oct-2019, 10:59:35
    Author     : daw203
--%>

<%@page import="Centro.Aula"%>
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

        <% //Muesta la lista de todas las reservas del profesor que se ha logeado
            if (request.getParameter("ver") != null) {
                ConexionEstatica.nueva();
                Profesor p = (Profesor) session.getAttribute("profe");
                LinkedList Lista_Reservas = ConexionEstatica.obtenerReservas(p.getCod_Prof());
                session.setAttribute("reservas", Lista_Reservas);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Listado_Reservas.jsp");
            }

            //Muesta la disponibilidad del aula
            if (request.getParameter("ver_disp") != null) {
                ConexionEstatica.nueva();
                int cod = Integer.parseInt(request.getParameter("aula"));
                //Aula a = ConexionEstatica.obtenerAula(cod);
                //session.setAttribute("reservas", Lista_Reservas);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Controladores/Controlador_Login_Profesores.jsp");
            }

            //Para que el usuario logeado pueda editar su perfil
            if (request.getParameter("editar") != null) {
                response.sendRedirect("../Vistas/Editar_Perfil.jsp");

            }

            //Cerrar sesión
            if (request.getParameter("cerrar") != null) {
                session.invalidate();
                response.sendRedirect("../index.jsp");
            }
        %>

    </body>
</html>
