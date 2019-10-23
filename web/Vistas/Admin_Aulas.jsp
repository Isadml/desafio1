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
        <title>Administrador de aulas</title>
    </head>
    <body>
        <h3>¿Qué deseas hacer?</h3>
        
        <form name="admin_aulas" action="../Controladores/Controlador_Admin_Aulas.jsp" method="POST">
            <input type="submit" name="aulas" id="aulas" value="Administrar aulas"/><br><br>
            <input type="submit" name="horario" id="horario" value="Administrar horarios"/><br><br>
        </form>
        
    </body>
</html>
