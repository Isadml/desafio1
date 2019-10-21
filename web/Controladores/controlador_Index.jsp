<%-- 
    Document   : controlador_Index
    Created on : 16-oct-2019, 17:46:35
    Author     : isa
--%>

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
        <% if (request.getParameter("aceptar") != null) {

                //HttpSession sesion = request.getSession();
                //sesion.setMaxInactiveInterval(60);

                String email = (request.getParameter("email"));
                String passw = (request.getParameter("pass"));
                
                /**
                 * Codificar la contraseña antes de compararla con otra contraseña
                 * de la base de datos ya que deben ir codificadas.
                 */
                
                ConexionEstatica.nueva();
                Profesor p = ConexionEstatica.existeProfesor(email);

                if (p != null) {
                    session.setAttribute("profe", p);
                    LinkedList ListaProfes = ConexionEstatica.obtenerProfesores();

                    session.setAttribute("profesores", ListaProfes);

                    if (p.getEmail().contentEquals(email) && p.getPassw().contentEquals(passw)) {
                        Bitacora.escribirBitacora( p.getNombre() + " ha entrado en el sistema.");
                        ConexionEstatica.cerrarBD();

                        /**
                         * Añadir un limitador según los permisos del profesor. 
                         * Si Sólo tiene permiso nivel 1, redirigir al Login_Profesor.
                         * Si no, redirigir a Tipo_Login.
                         */
                        
                        
                        response.sendRedirect("../Vistas/Login_Profesores.jsp");
                    } else {
                        response.sendRedirect("../index.jsp");
                    }
                }
            }
        %>
    </body>
</html>
