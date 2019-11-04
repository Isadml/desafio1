<%-- 
    Document   : index
    Created on : 16-oct-2019, 17:37:03
    Author     : isa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/miestilo.css"/>
        <link rel="stylesheet" type="text/css" href="css/estiloFormularios.css"/>

        <title>Inicio de sesión</title>
    </head>
    <body>

        <header>
            <h1>Inicio de sesión</h1>
        </header>


        <form name="inicio_sesion" action="Controladores/controlador_Index.jsp" method="POST">
            <label for="email">Email: </label><input type="text" id="email" name="email" value="">
            <label for="password">Password: </label><input type="password" id="password" name="pass" value="">
            <img src="jcaptcha.jpg" /> <input type="text" name="jcaptcha" value="" />
            <input type="submit" name="aceptar" value="Aceptar">

            <a href="Vistas/Otras/Nuevo_Usuario.jsp">Registrarse</a>
            <a href="Vistas/Otras/Recuperar_Pass.jsp">He olvidado mi contraseña</a></br></br>
        </form>

        <% //Añadir captcha %>

        <footer>
            <adress>Realizado por:<br>
                Isabel de Marcos López<br>
                2º DAW
            </adress>
        </footer>

    </body>

</html>
