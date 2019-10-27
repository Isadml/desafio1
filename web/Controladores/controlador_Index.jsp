<%-- 
    Document   : controlador_Index
    Created on : 16-oct-2019, 17:46:35
    Author     : isa
--%>

<%@page import="Password.Codificar"%>
<%@page import="Centro.Profesor"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Auxiliares.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% //Comprueba si existe el profesor que intenta acceder
            if (request.getParameter("aceptar") != null) {

                HttpSession sesion = request.getSession();
                sesion.setMaxInactiveInterval(5);
                
                String email = (request.getParameter("email"));
                String passw = (Codificar.codifica(request.getParameter("pass")));

                ConexionEstatica.nueva();
                Profesor p = ConexionEstatica.existeProfesor(email);

                //Si esxiste, se le redirige a la página de login que le corresponde según los permisos que posee
                if (p != null) {
                    session.setAttribute("profe", p);
                    LinkedList ListaProfes = ConexionEstatica.obtenerProfesores();

                    session.setAttribute("profesores", ListaProfes);

                    if (p.getEmail().contentEquals(email) && p.getPassw().contentEquals(passw)) {
                        Bitacora.escribirBitacora(p.getNombre() + " ha entrado en el sistema.");
                        ConexionEstatica.cerrarBD();

                        if (p.getRol() == 1) {
                            //Si sólo tiene permiso de nivel 1, se le redirige al Login de profesores
                            response.sendRedirect("../Vistas/Login_Profesores.jsp");
                        } else {
                            //Si tiene permisos de mayor nivel (2 o 3), se le redirige a una página de tipo de login
                            response.sendRedirect("../Vistas/Tipo_Login.jsp");
                        }
                    } else { 
                        response.sendRedirect("../index.jsp");
                    }
                }
            }
        %>
    </body>
</html>
