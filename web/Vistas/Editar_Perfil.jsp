<%-- 
    Document   : Editar_Perfil
    Created on : 23-oct-2019, 8:58:08
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

        <title>Editar perfil</title>
    </head>
    <body>

        <header>
            <h3>Editar perfil</h3>
        </header>

        <% Profesor p = (Profesor) session.getAttribute("profe");
        %>      

        <form name="editar" action="../Controladores/Controlador_Editar_Perfil.jsp" method="POST">
            <label for="email">Email: </label><input type="email" id="email" name="email" value="<%=p.getEmail()%>"></br></br>
            <label for="nombre">Nombre: </label><input type="text" id="nombre" name="nombre" value="<%=p.getNombre()%>"></br></br>
            <label for="apellido">Apellido: </label><input type="text" id="apellido" name="apellido" value="<%=p.getApellidos()%>" ></br></br>
            <label for="password1">Contraseña: </label><input type="password" id="password1" name="pass1" value=""></br></br>
            <label for="password2">Confirmar contraseña: </label><input type="password" id="password2" name="pass2" value=""></br></br>
            <label for="modificar"></label><input type="submit" id="modificar" name="modificar" value="Modificar"><br><br>
            <label for="cerrar"></label><input type="submit" id="cerrar" name="cerrar" value="Cerrar sesión">
        </form>

    </body>

    <footer>
        <adress>Realizado por:<br>
            Isabel de Marcos López<br>
            2º DAW
        </adress>
    </footer>

</html>
