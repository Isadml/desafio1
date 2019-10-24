<%-- 
    Document   : Controlador_Gestion_Aulas
    Created on : 23-oct-2019, 17:50:14
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

        <% //Para modificar las aulas que hay en la BBDD
            if (request.getParameter("modificar") != null) {
                int cod = Integer.parseInt(request.getParameter("cod_aula"));
                String desc = request.getParameter("descrip");
                ConexionEstatica.nueva();
                ConexionEstatica.modificarAula(cod, desc);
                LinkedList<Aula> ListaAula = ConexionEstatica.obtenerAulas();
                session.setAttribute("aulas", ListaAula);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Gestion_Aulas.jsp");
            }

            //Para borrar aulas de la BBDD
            if (request.getParameter("borrar") != null) {
                int cod = Integer.parseInt(request.getParameter("cod_aula"));
                ConexionEstatica.nueva();
                ConexionEstatica.borrarAulas(cod);
                LinkedList<Aula> ListaAula = ConexionEstatica.obtenerAulas();
                session.setAttribute("aulas", ListaAula);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Gestion_Aulas.jsp");
            }

            //Para añadir aulas a la BBDD
            if (request.getParameter("add") != null) {
                int cod = Integer.parseInt(request.getParameter("cod_aula"));
                String desc = request.getParameter("descrip");
                ConexionEstatica.nueva();
                ConexionEstatica.insertarAula(cod, desc);
                LinkedList<Aula> ListaAula = ConexionEstatica.obtenerAulas();
                session.setAttribute("aulas", ListaAula);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Gestion_Aulas.jsp");
            }

            //Cerrar sesión
            if (request.getParameter("cerrar") != null) {
                session.invalidate();
                response.sendRedirect("../index.jsp");
            }

        %>

    </body>
</html>
