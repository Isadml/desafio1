<%-- 
    Document   : Recuperar_Pass
    Created on : 16-oct-2019, 18:19:32
    Author     : isa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperación de contraseña</title>
    </head>
    <body>
        <h3>¿Has olvidado tu contraseña?</h3>
        
        <form name="recuperar_passw" action="../Controladores/Controlador_Recuperar_Pass.jsp" method="POST">
            <label for="email">Email: </label><input type="text" id="email" name="email" value="" placeholder="Introduzca su email"></br></br>
            <input type="submit" name="mandar" value="Mandar email">
        </form>
        
    </body>
</html>
