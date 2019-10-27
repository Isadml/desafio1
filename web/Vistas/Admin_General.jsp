<%-- 
    Document   : Admin_General
    Created on : 23-oct-2019, 12:24:22
    Author     : daw203
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>¿Qué deseas hacer?</h3>
        
        <form name="admin_aulas" action="../Controladores/Controlador_Admin_General.jsp" method="POST">
            <input type="submit" name="aulas" id="aulas" value="Administrar aulas"/><br><br>
            <input type="submit" name="horario" id="horario" value="Administrar horarios"/><br><br>
            <input type="submit" name="usuarios" id="usuarios" value="Administrar usuarios"/><br><br>
            <input type="submit" name="bitacora" id="bitacora" value="Ver archivo bitácora"/><br><br>
        </form>
        
    </body>
</html>
