<%-- 
    Document   : controlador_Nuevo_Usuario
    Created on : 18-oct-2019, 12:58:30
    Author     : daw203
--%>

<%@page import="Auxiliares.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>controlador nuevo usuario</title>
    </head>
    <body>
        
        <% if (request.getParameter("boton_acep_new") != null) {

        String email = request.getParameter("email");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");

        if (pass1.equals(pass2)) {
            ConexionEstatica.nueva();
            ConexionEstatica.insertarProfesor(email, nombre, apellido, pass1, "0" );
            ConexionEstatica.cerrarBD();
            response.sendRedirect("../index.jsp");
        } else {
            out.println("Las contraseñas no coinciden.");
        }

    }

    if (request.getParameter("boton_volver") != null) {
        response.sendRedirect("../index.jsp");
    }
        %>
        
    </body>
</html>
