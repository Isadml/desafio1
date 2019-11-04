<%-- 
    Document   : controlador_Index
    Created on : 16-oct-2019, 17:46:35
    Author     : isa
--%>

<%@page import="Email.Email"%>
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
        <%
//******************************************************************************
//***********************CONTROLADOR DEL INDEX**********************************
//******************************************************************************

            //Comprueba si existe el profesor que intenta acceder
            if (request.getParameter("aceptar") != null) {

                //HttpSession sesion = request.getSession();
                //sesion.setMaxInactiveInterval(5);
                String email = request.getParameter("email");
                String passw = Codificar.codifica(request.getParameter("pass"));

                ConexionEstatica.nueva();
                Profesor p = ConexionEstatica.existeProfesor(email);
                ConexionEstatica.cerrarBD();

                //Si existe, se le redirige a la página de login de profesores por defecto para que pueda reservar aula o navegar por la app
                if (p != null) {
                    session.setAttribute("profe", p);

                    if (p.getEmail().equals(email) && p.getPassw().equals(passw)) {

                        //Obtiene la fecha y hora del momento en que se creó la session y la escribe en bitácora
                        Date fecha = new Date(session.getCreationTime());
                        Bitacora.escribirBitacora(p.getNombre() + " ha entrado en el sistema. " + fecha);

                        String userCaptchaResponse = request.getParameter("jcaptcha");
                        boolean captchaPassed = SimpleImageCaptchaServlet.validateResponse(request, userCaptchaResponse);
                        if (captchaPassed) {
                            response.sendRedirect("../Vistas/Profesor/Login_Profesores.jsp");
                        } else {
                            response.sendRedirect("../index.jsp");
                        }

                    }

                }
            }

//******************************************************************************
//***********************CONTROLADOR NUEVO USUARIO******************************
//******************************************************************************
            //Registrar a un nuevo usuario
            if (request.getParameter("boton_acep_new") != null) {

                String email = request.getParameter("email");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String pass1 = request.getParameter("pass1");
                String pass2 = request.getParameter("pass2");

                if (pass1.equals(pass2)) {
                    String c = Codificar.codifica(pass1);
                    ConexionEstatica.nueva();
                    ConexionEstatica.insertarProfesor(email, nombre, apellido, c, 0);
                    ConexionEstatica.cerrarBD();
                    response.sendRedirect("../Vistas/Profesor/Login_Profesores.jsp");
                }
            }
            if (request.getParameter("boton_volver") != null) {
                response.sendRedirect("../index.jsp");
            }

//******************************************************************************
//***********************CONTROLADOR RECUPERAR CONTRASEÑA***********************
//******************************************************************************
            //Para recuperar la contraseña si se ha olvidado. Se coge el email 
            //del usuario y tras comprobar que existe en la BBDD, se le manda un 
            //email con una contraseña por defecto.
            if (request.getParameter("mandar") != null) {

                String e = request.getParameter("email");
                ConexionEstatica.nueva();
                Profesor p = ConexionEstatica.existeProfesor(e);
                ConexionEstatica.cerrarBD();
                if (p != null) {

                    Email email = new Email();

                    String de = "auxiliardaw2@gmail.com";
                    String clave = "Chubaca20";
                    String para = request.getParameter("email");
                    String mensaje = "Su contraseña de inicio de sesión es " + clave + "\nLe recomendamos que la cambie al volver a iniciar sesión.";
                    String asunto = "Contraseña olvidada";

                    email.enviarCorreo(de, clave, para, mensaje, asunto);
                    out.println("Correo enviado");

                } else {
                    out.println("Email no registrado en nuestra base de datos.");
                }
            }

        %>
    </body>
</html>
