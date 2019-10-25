<%-- 
    Document   : Controlador_Recuperar_Pass
    Created on : 25-oct-2019, 11:07:25
    Author     : daw203
--%>

<%@page import="Centro.Profesor"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page import="Email.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <% if (request.getParameter("mandar") != null) {

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
                    //response.sendRedirect("index.jsp");
                } else {
                    out.println("Email no registrado en nuestra base de datos.");
                }
            }
        %>
    </body>
</html>
