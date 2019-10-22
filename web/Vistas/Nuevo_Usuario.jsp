<%-- 
    Document   : Nuevo_Usuario
    Created on : 16-oct-2019, 18:19:04
    Author     : isa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario de registro para nuevos usuarios</title>
    </head>
    <body>
        <h1>Formulario de registro para nuevos usuarios</h1>
        
        <form name="registro" action="../Controladores/controlador_Nuevo_Usuario.jsp" method="POST">
            <label for="email">Email: </label><input type="email" id="email" name="email" value="" required=""></br></br>
            <label for="nombre">Nombre: </label><input type="text" id="nombre" name="nombre" value="" required=""></br></br>
            <label for="apellido">Apellido: </label><input type="text" id="nombre" name="apellido" value="" required=""></br></br>
            <label for="password1">Password: </label><input type="password" id="password1" name="pass1" value="" required=""></br></br>
            <label for="password2">Repetir password: </label><input type="password" id="password2" name="pass2" value="" required=""></br></br>

            
            <label for="aceptar"></label><input type="submit" id="aceptar" name="boton_acep_new" value="Aceptar"></br></br>
            <label for="volver"></label><input type="submit" id="volver" name="boton_volver" value="Volver"></br></br>

        </form>
    </body>
</html>
