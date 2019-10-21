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
        <title>Inicio de sesión</title>
    </head>
    <body>
        <h1>Inicio de sesión</h1>
        
        <form name="inicio_sesion" action="Controladores/controlador_Index.jsp" method="POST">
            <label for="email">Email: </label><input type="text" id="email" name="email" value=""></br></br>
            <label for="password">Password: </label><input type="password" id="password" name="pass" value=""></br></br>
            
            <a href="Vistas/Nuevo_Usuario.jsp">Registrarse</a>
            <a href="Vistas/Recuperar_Pass.jsp">He olvidado mi contraseña</a></br></br>
            <input type="submit" name="aceptar" value="Aceptar">
        </form>
        
        <% //Añadir captcha %>
        
    </body>
</html>
