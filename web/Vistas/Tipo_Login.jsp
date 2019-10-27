<%-- 
    Document   : Tipo_Login
    Created on : 18-oct-2019, 12:43:30
    Author     : daw203
--%>

<%@page import="Centro.Profesor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css"/>
        <link rel="stylesheet" type="text/css" href="../css/estiloFormularios.css"/>

        <title>Tipo login</title>
    </head>
    <body>
        <header>
            <h3>¿Cómo te quieres logear?</h3>
        </header>

        <% Profesor p = (Profesor) session.getAttribute("profe");

            if (p.getRol() == 2) {
//Si el profesor tiene permisos de nivel 2 (administrador de aula)
        %> 
        <form name="tipo_login" action="../Controladores/Controlador_Tipo_Login.jsp" method="POST">
            <input type="submit" name="normal" id="normal" value="Login normal"/><br><br>
            <input type="submit" name="admin_aula" id="admin_aula" value="Login como administrador de aulas"/><br><br>
        </form>
        <% }
            if (p.getRol() == 3) {
//Si el profesor tiene permisos de nivel (administrador general)
        %> 
        <form name="tipo_login" action="../Controladores/Controlador_Tipo_Login.jsp" method="POST">
            <input type="submit" name="normal" id="normal" value="Login normal"/><br><br>
            <input type="submit" name="admin_aula" id="admin_aula" value="Login como administrador de aulas"/><br><br>
            <input type="submit" name="admin_general" id="admin_general" value="Login como administrador general"/><br><br>
        </form>
        <% }
        %>

    </body>

    <footer>
        <adress>Realizado por:<br>
            Isabel de Marcos López<br>
            2º DAW
        </adress>
    </footer>

</html>
