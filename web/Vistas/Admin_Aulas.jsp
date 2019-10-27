<%-- 
    Document   : Admin_Aulas
    Created on : 23-oct-2019, 12:23:37
    Author     : daw203
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css"/>
        <link rel="stylesheet" type="text/css" href="../css/estiloFormularios.css"/>
        
        <title>Administrador de aulas</title>
    </head>
    <body>

        <header>
            <h3>¿Qué deseas hacer?</h3>
        </header>

        <form name="admin_aulas" action="../Controladores/Controlador_Admin_Aulas.jsp" method="POST">
            <input type="submit" name="aulas" id="aulas" value="Administrar aulas"/><br><br>
            <input type="submit" name="horario" id="horario" value="Administrar horarios"/><br><br>
        </form>

    </body>

    <footer>
        <adress>Realizado por:<br>
            Isabel de Marcos López<br>
            2º DAW
        </adress>
    </footer>

</html>
