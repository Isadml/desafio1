<%-- 
    Document   : Controlador_Editar_Perfil
    Created on : 23-oct-2019, 9:17:27
    Author     : daw203
--%>

<%@page import="Password.Codificar"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page import="Centro.Profesor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <% //El usuario puede modificar su propio perfil
            if (request.getParameter("modificar") != null) {
                Profesor p = (Profesor) session.getAttribute("profe");
                String email = request.getParameter("email");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String pass1 = request.getParameter("pass1");
                String pass2 = request.getParameter("pass2");

                if (pass1.equals(pass2)) {
                    String c = Codificar.codifica(pass1);
                    ConexionEstatica.nueva();
                    ConexionEstatica.modificarPerfil(email, nombre, apellido, c, p.getCod_Prof());
                    ConexionEstatica.cerrarBD();
                    response.sendRedirect("../Vistas/Editar_Perfil.jsp");
                }
            }
            
            //Cerrar sesión
            if (request.getParameter("cerrar") != null) {
                session.invalidate();
                response.sendRedirect("../index.jsp");
            }
        %>

    </body>
</html>
