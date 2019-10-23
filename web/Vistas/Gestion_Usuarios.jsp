<%-- 
    Document   : Gestion_Usuarios
    Created on : 21-oct-2019, 14:08:00
    Author     : isa
--%>

<%@page import="Centro.Profesor"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de usuarios</title>
    </head>
    <body>
        <h3>Bienvenido a la página de gestión de usuarios</h3>

        <% LinkedList<Profesor> ListaProfes = (LinkedList<Profesor>) session.getAttribute("profesores");
            for (int i = 0; i < ListaProfes.size(); i++) {
                Profesor p = (Profesor) ListaProfes.get(i);
        %>
        <form name="gestion_usuarios" action="../Controladores/Controlador_Gestion_Usuarios.jsp" method="POST">
            <label for="email">Email: </label><input type="email" id="email" name="email" value="<%=p.getEmail()%>"></br></br>
            <label for="nombre">Nombre: </label><input type="text" id="nombre" name="nombre" value="<%=p.getNombre()%>"></br></br>
            <label for="apellido">Apellido: </label><input type="text" id="nombre" name="apellido" value="<%=p.getApellidos()%>"></br></br>
            <label for="codigo">Código del profesor: </label><input type="number" id="codigo" name="codigo" value="<%=p.getCod_Prof()%>" disabled></br></br>

            <label for="modificar"></label><input type="submit" id="modificar" name="modificar" value="Modificar">
            <label for="borrar"></label><input type="submit" id="borrar" name="borrar" value="Borrar"><br><br>

        </form>
        <%}%>
        
        <form name="permisos" action="../Controladores/Controlador_Gestion_Usuarios.jsp" method="POST">
            <label for="permisos"></label><input type="number" id="permisos" name="permisos" value="" min="1" max="3">
            <label for="mod_perm"></label><input type="submit" id="mod_perm" name="mod_perm" value="Modificar permisos">
            <label for="add_perm"></label><input type="submit" id="add_perm" name="add_perm" value="Añadir permisos"><br><br>
        </form>

        <form name="botones" action="../Controladores/Controlador_Gestion_Usuarios.jsp" method="POST">
            <label for="add"></label><input type="submit" id="add" name="add" value="+"><br><br>
            
            <label for="cerrar"></label><input type="submit" id="cerrar" name="cerrar" value="Cerrar sesión"><br><br>
        </form>

    </body>
</html>
