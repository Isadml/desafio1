<%-- 
    Document   : Controlador_Reservar_Aula
    Created on : 23-oct-2019, 22:59:13
    Author     : isa
--%>
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
        
        <% if (request.getParameter("reservar") != null){
            Profesor p = (Profesor) session.getAttribute("profe");
            int cod_Prof = p.getCod_Prof();
            Integer cod_Aula = (int) session.getAttribute("aula");
            String fecha = (String) session.getAttribute("fecha");
            int cod_Hora = Integer.parseInt(request.getParameter("cod_hora"));
            
             ConexionEstatica.nueva();
             ConexionEstatica.insertarReserva(cod_Hora, cod_Aula, fecha, cod_Prof);
             ConexionEstatica.cerrarBD();
             
             response.sendRedirect("../Vistas/Listado_Reservas.jsp");
        }
        %>
        
    </body>
</html>
