<%-- 
    Document   : Listado_Reservas
    Created on : 22-oct-2019, 8:48:06
    Author     : daw203
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Centro.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <title>Listado de aulas reservadas</title>
    </head>
    <body>
        <h3>Listado de aulas reservadas</h3>
        
        <% LinkedList<Reserva> Lista = (LinkedList<Reserva>) session.getAttribute("reservas");
            
            for (int i = 0; i < Lista.size(); i++) {
                Reserva r = Lista.get(i);
        %>
        
        <form name="listado_aulas" action="../Controladores/Controlador_Listado_Reservas.jsp" method="POST">
            <label for="cod_reser">Código reserva </label><input type="number" id="cod_reser" name="cod_reser" value="<%=r.getCod_Reserva()%>" style="width: 50px">
            <label for="cod_aula">Código aula </label><input type="text" id="cod_aula" name="cod_aula" value="<%=r.getCod_Aula()%>" style="width: 50px">
            <label for="cod_hora">Código hora </label><input type="number" id="cod_hora" name="cod_hora" value="<%=r.getCod_Hora()%>" style="width: 50px">
            <label for="fecha">Fecha </label><input type="date" id="fecha" name="fecha" value="<%=r.getFecha()%>">
            <label for="hora_Inicio">Hora de inicio </label><input type="text" id="hora_Inicio" name="hora_Inicio" value="<%=r.getHora_Inicio()%>" style="width: 50px">
            <label for="hora_Finalizar">Hora de final </label><input type="text" id="hora_Finalizar" name="hora_Finalizar" value="<%=r.getHora_Finalizar()%>" style="width: 50px">
            
            <label for="modificar"></label><input type="submit" id="modificar" name="modificar" value="Modificar">
            <label for="borrar"></label><input type="submit" id="borrar" name="borrar" value="Borrar"><br><br>
        </form>
        
        <%}%>
        
        <form name="botones" action="../Controladores/Controlador_Listado_Reservas.jsp" method="POST">
            <label for="add"></label><input type="submit" id="add" name="add" value="+"><br><br>
            <label for="cerrar"></label><input type="submit" id="cerrar" name="cerrar" value="Cerrar sesión"><br><br>
        </form>
        
    </body>
</html>
