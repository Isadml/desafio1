<%-- 
    Document   : Gestion_Aulas
    Created on : 21-oct-2019, 14:03:47
    Author     : daw203
--%>

<%@page import="Centro.Aula"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de aulas</title>
    </head>
    <body>
        <h3>Bienvenido a la página de gestión de aulas</h3>
        
        
        
        <% LinkedList<Aula> ListaAula = (LinkedList<Aula>) session.getAttribute("aulas");
            for (int i = 0; i < ListaAula.size(); i++) {
                Aula a = (Aula) ListaAula.get(i);
        %>
        <form name="gestion_aulas" action="../Controladores/Controlador_Gestion_Aulas.jsp" method="POST">
            <label for="cod_aula">Código del aula </label><input type="number" id="cod_aula" name="cod_aula" value="<%=a.getCodAula()%>" style="width: 50px">
            <label for="descrip">Descripción </label><input type="text" id="descrip" name="descrip" value="<%=a.getDescripcion()%>">

            <label for="modificar"></label><input type="submit" id="modificar" name="modificar" value="Modificar">
            <label for="borrar"></label><input type="submit" id="borrar" name="borrar" value="Borrar"><br><br>

        </form>
        <% }%>

        <form name="add_aula" action="../Controladores/Controlador_Gestion_Aulas.jsp" method="POST">
            <label for="cod_aula">Código del aula </label><input type="number" id="cod_aula" name="cod_aula" value="" style="width: 50px">
            <label for="descrip">Descripción </label><input type="text" id="descrip" name="descrip" value="">

            <label for="add"></label><input type="submit" id="add" name="add" value="+"><br><br>
            <label for="cerrar"></label><input type="submit" id="cerrar" name="cerrar" value="Cerrar sesión"><br><br>
        </form>
        
        
    </body>
</html>
