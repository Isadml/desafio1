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
        <title>Página de reserva de aulas</title>
    </head>
    <body>
        <h3>Página de reserva de aulas</h3>
        
        <form name="login_prof" action="../Controladores/Controlador_Login_Profesores.jsp" method="POST">
            <label for="fecha"><input id="fecha" type="date" min=""/></label><br><br>
            <label for="aula"><input id="aula" type="text"/></label><br><br>
            <label for="ver"><input id="ver" type="submit" name="ver" value="Ver cuadrante"/></label><br><br>
            
            <label for="volver"><input id="volver" name="volver" type="submit" value="Volver"/></label><br><br>
            <label for="cerrar"><input id="cerrar" name="cerrar" type="submit" value="Cerrar sesión"/></label>
            
        </form>
        
    </body>
</html>
