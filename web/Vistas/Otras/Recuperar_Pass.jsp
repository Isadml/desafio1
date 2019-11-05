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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/miestilo.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/estiloFormularios.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/estilo_movil.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/estilo_tablet.css"/>

        <title>Recuperación de contraseña</title>
    </head>
    <body>
        <header>
            <h3>¿Has olvidado tu contraseña?</h3>
        </header>

        <form name="recuperar_passw" action="../../Controladores/Controlador_Index.jsp" method="POST">
            <label for="email">Email: </label><input type="text" id="email" name="email" value="" placeholder="Introduzca su email"></br></br>
            <input type="submit" name="mandar" value="Mandar email">
        </form>

        <footer>
            <adress>Realizado por:<br>
                Isabel de Marcos López<br>
                2º DAW
            </adress>
        </footer>

    </body>

</html>
