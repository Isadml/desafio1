<%-- 
    Document   : Controlador_Admin_Aulas
    Created on : 29-oct-2019, 13:43:54
    Author     : isa
--%>

<%@page import="java.util.Date"%>
<%@page import="Centro.Profesor"%>
<%@page import="Auxiliares.Bitacora"%>
<%@page import="Centro.Horario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Centro.Aula"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% 
//******************************************************************************
//***********************CONTROLADOR GESTIÓN DE AULAS***************************
//******************************************************************************

            //Para modificar las aulas que hay en la BBDD
            if (request.getParameter("modificar") != null) {
                int cod = Integer.parseInt(request.getParameter("cod_aula"));
                String desc = request.getParameter("descrip");
                ConexionEstatica.nueva();
                ConexionEstatica.modificarAula(cod, desc);
                LinkedList<Aula> ListaAula = ConexionEstatica.obtenerAulas();
                session.setAttribute("aulas", ListaAula);
                ConexionEstatica.cerrarBD();
                
                Profesor p = (Profesor) session.getAttribute("profe");
                //Obtiene la fecha y hora del momento en que se creó la session y la escribe en bitácora
                Date fecha = new Date(session.getCreationTime());
                Bitacora.escribirBitacora(p.getNombre() + " ha modificado la lista de aulas.  " + fecha);
                
                response.sendRedirect("../Vistas/Admin_Aulas/Gestion_Aulas.jsp");
            }

            //Para borrar aulas de la BBDD
            if (request.getParameter("borrar") != null) {
                int cod = Integer.parseInt(request.getParameter("cod_aula"));
                ConexionEstatica.nueva();
                ConexionEstatica.borrarAulas(cod);
                LinkedList<Aula> ListaAula = ConexionEstatica.obtenerAulas();
                session.setAttribute("aulas", ListaAula);
                ConexionEstatica.cerrarBD();
                
                Profesor p = (Profesor) session.getAttribute("profe");
                //Obtiene la fecha y hora del momento en que se creó la session y la escribe en bitácora
                Date fecha = new Date(session.getCreationTime());
                Bitacora.escribirBitacora(p.getNombre() + " ha modificado la lista de aulas.  " + fecha);
                
                response.sendRedirect("../Vistas/Admin_Aulas/Gestion_Aulas.jsp");
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
                response.sendRedirect("../Vistas/Admin_Aulas/Gestion_Aulas.jsp");
            }

            //Cerrar sesión
            if (request.getParameter("cerrar") != null) {
                session.invalidate();
                response.sendRedirect("../index.jsp");
            }

//******************************************************************************
//***********************CONTROLADOR GESTIÓN DE HORARIOS************************
//******************************************************************************

            //Para modificar las horas que hay en la BBDD
            if (request.getParameter("modificar_H") != null) {
                int cod = Integer.parseInt(request.getParameter("cod_hora"));
                String hora_i = request.getParameter("hora_inicio");
                String hora_f = request.getParameter("hora_final");
                ConexionEstatica.nueva();
                ConexionEstatica.modificarHorario(cod, hora_i, hora_f);
                LinkedList<Horario> ListaHorario = ConexionEstatica.obtenerHorario();
                session.setAttribute("horario", ListaHorario);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Admin_Aulas/Gestion_Horarios.jsp");
            }

            //Para borrar las horas de la BBDD
            if (request.getParameter("borrar_H") != null) {
                int cod = Integer.parseInt(request.getParameter("cod_hora"));
                ConexionEstatica.nueva();
                ConexionEstatica.borrarHorario(cod);
                LinkedList<Horario> ListaHorario = ConexionEstatica.obtenerHorario();
                session.setAttribute("horario", ListaHorario);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Admin_Aulas/Gestion_Horarios.jsp");
            }

            //Para añadir horas a la BBDD
            if (request.getParameter("add_H") != null) {
                int cod = Integer.parseInt(request.getParameter("cod_hora"));
                String hora_i = request.getParameter("hora_inicio");
                String hora_f = request.getParameter("hora_final");
                ConexionEstatica.nueva();
                ConexionEstatica.insertarHora(cod, hora_i, hora_f);
                LinkedList<Horario> ListaHorario = ConexionEstatica.obtenerHorario();
                session.setAttribute("horario", ListaHorario);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Admin_Aulas/Gestion_Horarios.jsp");
            }

        %>
        
    </body>
</html>
