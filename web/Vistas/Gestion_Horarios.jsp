<%-- 
    Document   : Gestion_Horarios
    Created on : 21-oct-2019, 14:06:16
    Author     : isa
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Centro.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css"/>
        <link rel="stylesheet" type="text/css" href="../css/estiloFormularios.css"/>

        <title>Gestión de horarios</title>
    </head>
    <body>

        <header>
            <h3>Bienvenido a la página de gestión de horarios</h3>
        </header>

        <%
            LinkedList<Horario> ListaHorario = (LinkedList<Horario>) session.getAttribute("horario");
            for (int i = 0; i < ListaHorario.size(); i++) {
                Horario h = (Horario) ListaHorario.get(i);
        %>
        <form name="gestion_horarios" action="../Controladores/Controlador_Gestion_Horarios.jsp" method="POST">
            <label for="cod_hora">Código de la hora </label><input type="number" id="cod_hora" name="cod_hora" value="<%=h.getCod_Hora()%>" style="width: 50px">
            <label for="hora_inicio">Hora de inicio </label><input type="text" id="hora_inicio" name="hora_inicio" value="<%=h.getHora_Inicio()%>">
            <label for="hora_final">Hora de finalización </label><input type="text" id="hora_final" name="hora_final" value="<%=h.getHora_Finalizar()%>">

            <label for="modificar"></label><input type="submit" id="modificar" name="modificar" value="Modificar">
            <label for="borrar"></label><input type="submit" id="borrar" name="borrar" value="Borrar"><br><br>

        </form>
        <% }
        %>

        <form name="add_hora" action="../Controladores/Controlador_Gestion_Horarios.jsp" method="POST">
            <label for="cod_hora">Código de la hora </label><input type="number" id="cod_hora" name="cod_hora" value="" style="width: 50px">
            <label for="hora_inicio">Hora de inicio </label><input type="text" id="hora_inicio" name="hora_inicio" value="">
            <label for="hora_final">Hora de finalización </label><input type="text" id="hora_final" name="hora_final" value="">

            <label for="add"></label><input type="submit" id="add" name="add" value="+"><br><br>
            <label for="cerrar"></label><input type="submit" id="cerrar" name="cerrar" value="Cerrar sesión"><br><br>
        </form>

    </body>

    <footer>
        <adress>Realizado por:<br>
            Isabel de Marcos López<br>
            2º DAW
        </adress>
    </footer>

</html>
