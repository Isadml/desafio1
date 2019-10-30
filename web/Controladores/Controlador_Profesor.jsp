<%-- 
    Document   : Controlador_Profesor
    Created on : 29-oct-2019, 13:31:48
    Author     : daw203
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="Password.Codificar"%>
<%@page import="Centro.Profesor"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
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
//***********************CONTROLADOR DEL LOGIN DE PROFESOR**********************
//******************************************************************************

            //Muesta la disponibilidad del aula
            if (request.getParameter("ver_disp") != null) {
                ConexionEstatica.nueva();
                int cod = Integer.parseInt(request.getParameter("aula"));
                session.setAttribute("cod_aula", cod);
                String fecha = request.getParameter("fecha");
                session.setAttribute("fecha", fecha);
                LinkedList Lista_Horario = ConexionEstatica.obtenerHorario();
                session.setAttribute("horario", Lista_Horario);
                LinkedList Lista_Horas_Reservadas = ConexionEstatica.obetenerHorasReservadas(cod, fecha);
                session.setAttribute("horas_Reservadas", Lista_Horas_Reservadas);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Profesor/Reservar_Aula.jsp");
            }


//******************************************************************************
//***********************CONTROLADOR DEL LISTADO DE RESERVAS********************
//******************************************************************************
            //Modificar una reserva de aula con el código de la reserva
            if (request.getParameter("modificar_R") != null) {
                ConexionEstatica.nueva();
                Profesor p = (Profesor) session.getAttribute("profe");
                LinkedList Lista = ConexionEstatica.obtenerReservas(p.getCod_Prof());
                session.setAttribute("reservas", Lista);
                int cod = Integer.parseInt(request.getParameter("cod_reser"));
                int cod_Hora = Integer.parseInt(request.getParameter("cod_hora"));
                int cod_Aula = Integer.parseInt(request.getParameter("cod_aula"));
                String fecha = request.getParameter("fecha");

                ConexionEstatica.modificarReserva(cod, cod_Hora, cod_Aula, fecha, p.getCod_Prof());
                Lista = ConexionEstatica.obtenerReservas(p.getCod_Prof());
                session.setAttribute("reservas", Lista);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Profesor/Listado_Reservas.jsp");
            }

            //Borrar o eliminar una reserva
            if (request.getParameter("borrar_R") != null) {
                ConexionEstatica.nueva();
                Profesor p = (Profesor) session.getAttribute("profe");
                int cod = Integer.parseInt(request.getParameter("cod_reser"));
                ConexionEstatica.borrarReserva(cod);
                LinkedList Lista = ConexionEstatica.obtenerReservas(p.getCod_Prof());
                session.setAttribute("reservas", Lista);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("../Vistas/Profesor/Listado_Reservas.jsp");
            }

            //Añadir una reserva nueva a la lista
            if (request.getParameter("add") != null) {
                response.sendRedirect("../Vistas/Profesor/Login_Profesores.jsp");
            }


//******************************************************************************
//***********************CONTROLADOR DE RESERVAS DE AULAS***********************
//******************************************************************************
            //Para añadir reservas a la BBDD
            if (request.getParameter("reservar") != null) {
                Profesor p = (Profesor) session.getAttribute("profe");
                int cod = p.getCod_Prof();
                int cod_Aula = (Integer) session.getAttribute("cod_aula");
                String fecha = (String) session.getAttribute("fecha");
                int cod_Hora = Integer.parseInt(request.getParameter("cod_hora"));

                ConexionEstatica.nueva();
                ConexionEstatica.insertarReserva(cod_Hora, cod_Aula, fecha, cod, 0);
                LinkedList Lista_Horario = ConexionEstatica.obtenerHorario();
                session.setAttribute("horario", Lista_Horario);
                LinkedList Lista_Horas_Reservadas = ConexionEstatica.obetenerHorasReservadas(cod, fecha);

                session.setAttribute("horas_Reservadas", Lista_Horas_Reservadas);
                ConexionEstatica.cerrarBD();

                response.sendRedirect("../Vistas/Profesor/Reservar_Aula.jsp");
            }

//******************************************************************************
//***********************CONTROLADOR DE EDITAR PERFIL***************************
//******************************************************************************
            //El usuario puede modificar su propio perfil
            if (request.getParameter("modificar") != null) {
                Profesor p = (Profesor) session.getAttribute("profe");
                String email = request.getParameter("email");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String pass1 = request.getParameter("pass1");
                String pass2 = request.getParameter("pass2");

                /**
                 * FileItemFactory factory = new DiskFileItemFactory();
                 * ServletFileUpload upload = new ServletFileUpload(factory);
                 *
                 * List items = upload.parseRequest(request); p = new
                 * Profesor();
                 *
                 * // Se recorren todos los items, que son de tipo FileItem for
                 * (Object item : items) { FileItem uploaded = (FileItem) item;
                 *
                 * if (!uploaded.isFormField()) {
                 *
                 * String rutaDestino = "perfiles/"; File fichero = new
                 * File(rutaDestino, uploaded.getName());
                 * uploaded.write(fichero);
                 *
                 * byte[] icono = new byte[(int) fichero.length()]; InputStream
                 * input = new FileInputStream(fichero); input.read(icono);
                 * p.setFoto(icono);
                 *
                 * out.println("Archivo '" + uploaded.getName() + "' subido
                 * correctamente."); } else { String key =
                 * uploaded.getFieldName(); String valor = uploaded.getString();
                 * out.println("Valor recuperado con uploaded: " + key + " = " +
                 * valor + "</br>"); if (key.equals("nombre")) {
                 * p.setNombre(valor); }
                 *
                 * }
                 * }*
                 */
                if (pass1.equals(pass2)) {
                    String c = Codificar.codifica(pass1);
                    ConexionEstatica.nueva();
                    ConexionEstatica.modificarPerfil(email, nombre, apellido, c, p.getCod_Prof());
                    ConexionEstatica.cerrarBD();
                    response.sendRedirect("../Vistas/Profesor/Editar_Perfil.jsp");
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
