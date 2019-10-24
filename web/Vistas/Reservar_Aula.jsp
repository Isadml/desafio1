<%-- 
    Document   : Reservar_Aula
    Created on : 23-oct-2019, 18:47:43
    Author     : isa
--%>

<%@page import="Centro.Reserva"%>
<%@page import="Centro.Horario"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de reserva de aulas</title>
    </head>
    <body>

        <% LinkedList Lista_Horario = (LinkedList<Horario>) session.getAttribute("horario");
            LinkedList Lista_Horas_Reservadas = (LinkedList<Reserva>) session.getAttribute("horas_Reservadas");
            String fecha = (String) session.getAttribute("fecha");
        %> 
        <h4>Fecha <% out.println(fecha);%></h4>
        <%
            for (int i = 0; i < Lista_Horario.size(); i++) {
                for (int j = 0; j < Lista_Horas_Reservadas.size(); j++) {
                    Horario h = (Horario) Lista_Horario.get(i);
                    Reserva r = (Reserva) Lista_Horas_Reservadas.get(j);
        %>

        <form name="reservas" action="../Controladores/Controlador_Reservar_Aula.jsp" method="POST">
            <label for="cod_hora">Código de hora </label><input type="text" id="cod_hora" name="cod_hora" value="<%=h.getCod_Hora()%>" style="width: 50px">
            <label for="hora_inicio">Hora de inicio </label><input type="text" id="hora_inicio" name="hora_inicio" value="<%=h.getHora_Inicio()%>" style="width: 50px">
            <label for="hora_finalizar">Hora de final </label><input type="text" id="hora_finalizar" name="hora_finalizar" value="<%=h.getHora_Finalizar()%>" style="width: 50px">

            <% if (r.getFecha().equals(fecha) && h.getCod_Hora() == r.getCod_Hora()) {
            %>
            <label for="reservada"></label><input type="submit" id="reservada" name="reservada" value="Reservada" disabled>
            <% } else { %>
            <label for="reservar"></label><input type="submit" id="reservar" name="reservar" value="Reservar">
            <%
                }
            %>

        </form>
        <% }
            }
        %>

    </body>
</html>
