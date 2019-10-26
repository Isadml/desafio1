<%-- 
    Document   : Controlador_Admin_General
    Created on : 23-oct-2019, 18:17:49
    Author     : isa
--%>

<%@page import="java.util.Scanner"%>
<%@page import="java.io.FileReader"%>
<%@page import="Centro.Horario"%>
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

        <% //Si el administrador general elige la opción de gestión de aulas
            if (request.getParameter("aulas") != null) {
                ConexionEstatica.nueva();
                LinkedList<Aula> ListaAula = ConexionEstatica.obtenerAulas();
                session.setAttribute("aulas", ListaAula);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Gestion_Aulas.jsp");
            }
            //Si el administrador general elige la opción de gestión de horarios
            if (request.getParameter("horario") != null) {
                ConexionEstatica.nueva();
                LinkedList<Horario> ListaHorario = ConexionEstatica.obtenerHorario();
                session.setAttribute("horario", ListaHorario);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Gestion_Horarios.jsp");
            }

            //Si el administrador general elige la opción de gestión de usuarios
            if (request.getParameter("usuarios") != null) {
                response.sendRedirect("../Vistas/Gestion_Usuarios.jsp");
            }

            //Para que el administrador general pueda ver los datos almacenados en el archivo bitácora
            if (request.getParameter("bitacora") != null) {
                Scanner sc = new Scanner("/home/daw203/Documentos/glassfish5/glassfish/domains/domain1/config");
                while (sc.hasNextLine()){
                    String cad = sc.nextLine();
                    LinkedList<String> ListaBitacora = new LinkedList();
                    ListaBitacora.add(cad);
                    session.setAttribute("bitacora", ListaBitacora);
                }
                response.sendRedirect("../Vistas/Ver_Bitacora.jsp");
            }

            //Cerrar sesión
            if (request.getParameter("cerrar") != null) {
                session.invalidate();
                response.sendRedirect("../index.jsp");
            }
        %>

    </body>
</html>
