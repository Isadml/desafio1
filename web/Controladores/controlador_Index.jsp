<%-- 
    Document   : controlador_Index
    Created on : 16-oct-2019, 17:46:35
    Author     : isa
--%>

<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>
<%@page import="Centro.Horario"%>
<%@page import="Centro.Aula"%>
<%@page import="java.sql.Date"%>
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

                    //HttpSession sesion = request.getSession();
                    //sesion.setMaxInactiveInterval(5);
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
                            LinkedList<Aula> ListaAula = ConexionEstatica.obtenerAulas();
                            session.setAttribute("aulas", ListaAula);

                            LinkedList<Horario> ListaHorario = ConexionEstatica.obtenerHorario();
                            session.setAttribute("horario", ListaHorario);

                            LinkedList Lista_Reservas = ConexionEstatica.obtenerReservas(p.getCod_Prof());
                            session.setAttribute("reservas", Lista_Reservas);

                            File f = new File("/home/isa/glassfish-4.1.1/glassfish/domains/domain1/config/bitacora.txt");
                            LinkedList<String> ListaBitacora = new LinkedList();
                            try {
                                //Scanner sc = new Scanner("/home/daw203/Documentos/glassfish5/glassfish/domains/domain1/config/bitacora.txt");
                                Scanner sc = new Scanner(f);

                                while (sc.hasNextLine()) {
                                    String cad = sc.nextLine();

                                    ListaBitacora.add(cad);
                                }
                            } catch (FileNotFoundException ex) {
                                out.println("Fichero no existe");
                            }
                            session.setAttribute("bitacora", ListaBitacora);

                            Date fecha = new Date(session.getCreationTime());
                            Bitacora.escribirBitacora(p.getNombre() + " ha entrado en el sistema." + fecha);
                            ConexionEstatica.cerrarBD();

                            response.sendRedirect("../Vistas/Login_Profesores.jsp");
                        }
                    } else {
                        response.sendRedirect("../index.jsp");
                    }
                }
        %>
    </body>
</html>
