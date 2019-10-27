<%-- 
    Document   : Login_Profesores
    Created on : 16-oct-2019, 18:29:13
    Author     : isa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css"/>
        <link rel="stylesheet" type="text/css" href="../css/estiloFormularios.css"/>

        <title>Página de reserva de aulas</title>
    </head>
    <body>

        <header>
            <h3>Página de reserva de aulas</h3>
        </header>
        <form name="login_prof" action="../Controladores/Controlador_Login_Profesores.jsp" method="POST">
            <label for="fecha"><input id="fecha" name="fecha" type="date" min=""/></label><br><br>
            <label for="aula"><input id="aula" name="aula" type="number" style="width: 50px"/></label><br><br>
            <label for="ver"><input id="ver" type="submit" name="ver" value="Ver cuadrante"/></label><br><br>
            <label for="ver_disp"><input id="ver_disp" type="submit" name="ver_disp" value="Ver disponibilidad"/></label><br><br>

            <label for="volver"><input id="volver" name="volver" type="submit" value="Volver"/></label><br><br>
            <label for="editar"><input id="editar" name="editar" type="submit" value="Editar perfil"/></label><br><br>
            <label for="cerrar"><input id="cerrar" name="cerrar" type="submit" value="Cerrar sesión"/></label>

        </form>

    </body>

    <footer>
        <adress>Realizado por:<br>
            Isabel de Marcos López<br>
            2º DAW
        </adress>
    </footer>

</html>
