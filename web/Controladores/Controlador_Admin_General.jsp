<%-- 
    Document   : Controlador_Gestion_Usuarios
    Created on : 23-oct-2019, 9:31:22
    Author     : daw203
--%>

<%@page import="Auxiliares.Bitacora"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page import="Password.Codificar"%>
<%@page import="Centro.Profesor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            //El administrador general puede modificar usuarios con este método con el código del profesor
            if (request.getParameter("modificar") != null) {
                String email = request.getParameter("email");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                int codigo = Integer.parseInt(request.getParameter("codigo"));

                ConexionEstatica.nueva();
                ConexionEstatica.gestionarProfesor(email, nombre, apellido, codigo);
                LinkedList<Profesor> ListaProfes = ConexionEstatica.obtenerProfesores();
                session.setAttribute("profesores", ListaProfes);
                ConexionEstatica.cerrarBD();

                Profesor p = (Profesor) session.getAttribute("profe");
                //Obtiene la fecha y hora del momento en que se creó la session y la escribe en bitácora
                Date fecha = new Date(session.getCreationTime());
                Bitacora.escribirBitacora(p.getNombre() + " ha modificado la lista de usuarios.  " + fecha);

                response.sendRedirect("../Vistas/Admin_General/Gestion_Usuarios.jsp");

            }

            //El administrador general puede eliminar usuarios y sus permisos con el código del profesor
            if (request.getParameter("borrar") != null) {
                ConexionEstatica.nueva();
                int codigo = Integer.parseInt(request.getParameter("codigo"));
                ConexionEstatica.borrarProfesor(codigo);
                ConexionEstatica.borrarPrivilegios(codigo);
                LinkedList<Profesor> ListaProfes = ConexionEstatica.obtenerProfesores();
                session.setAttribute("profesores", ListaProfes);
                ConexionEstatica.cerrarBD();
                
                Profesor p = (Profesor) session.getAttribute("profe");
                //Obtiene la fecha y hora del momento en que se creó la session y la escribe en bitácora
                Date fecha = new Date(session.getCreationTime());
                Bitacora.escribirBitacora(p.getNombre() + " ha modificado la lista de usuarios.  " + fecha);
                
                response.sendRedirect("../Vistas/Admin_General/Gestion_Usuarios.jsp");
            }

            //El administrador general puede añadir usuarios con este método 
            if (request.getParameter("add") != null) {
                response.sendRedirect("../Vistas/Otras/Nuevo_Usuario.jsp");
            }

            //El administrador general puede modificar permisos con este método y con el código del profesor
            if (request.getParameter("mod_perm") != null) {
                ConexionEstatica.nueva();
                int codigo = Integer.parseInt(request.getParameter("codigo"));
                int permisos = Integer.parseInt(request.getParameter("permisos"));
                ConexionEstatica.modificarPermisos(codigo, permisos);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Admin_General/Gestion_Usuarios.jsp");
            }

            //El administrador general puede añadir permisos a un profesor con su código
            if (request.getParameter("add_perm") != null) {
                ConexionEstatica.nueva();
                int permisos = Integer.parseInt(request.getParameter("codigo"));
                int codigo = Integer.parseInt(request.getParameter("permisos"));
                ConexionEstatica.darPermisos(codigo, permisos);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Admin_General/Gestion_Usuarios.jsp");
            }

            //Cerrar sesión
            if (request.getParameter("cerrar") != null) {
                session.invalidate();
                response.sendRedirect("../index.jsp");
            }
        %>

    </body>
</html>
