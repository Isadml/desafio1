<%-- 
    Document   : Tipo_Login
    Created on : 18-oct-2019, 12:43:30
    Author     : daw203
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipo login</title>
    </head>
    <body>
        <h3>¿Cómo te quieres logear?</h3>
        
        <form name="tipo_login" action="" method="POST">
            <label for="elegir">
                <select id="elegir">
                    <option id="normal" value="normal">Login normal</option>
                    <option id="admin_aula" value="admin_aula">Login como administrador de aulas</option>
                    <option id="admin_gen" value="admin_gen" disabled>Login como administrador general</option>
                </select>
            </label>
            <label for="acep"><input id="acep" type="submit" value="Aceptar"/></label>
        </form>
        
        <% 
        /**
         * Añadir la opción de que el usuario sólo pueda acceder a otras páginas
         * si posee los permisos necesarios de forma que un usuario nivel 2
         * no pueda acceder como admin general.
         */
        %>
        
        
    </body>
</html>
