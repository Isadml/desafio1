<%--
    Document   : Reservar_Aula
    Created on : 23-oct-2019, 18:47:43
    Author     : isa
--%>

<%@page import="Centro.Profesor"%>
<%@page import="Centro.Reserva"%>
<%@page import="Centro.Horario"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <link rel="stylesheet" type="text/css" href="../css/.css"/>
        <link rel="stylesheet" type="text/css" href="../css/.css"/>

        <title>Página de reserva de aulas</title>
    </head>
    <body>

        <header>
            <h3>Página de reserva de aulas</h3>
        </header>
        
         <% Profesor p = (Profesor) session.getAttribute("profe");

            if (p.getRol() == 1) {
        %>
        <nav class="vertical">
            <ul>
                <li><a href="">Profesor</a>
                    <ul>
                        <li><a href="Editar_Perfil.jsp">Editar perfil</a></li>
                        <li><a href="Listado_Reservas.jsp">Ver reservas</a></li>
                        <li><a href="Reservar_Aula.jsp">Reservar aula</a></li>
                    </ul>
                </li>   
            </ul>
        </nav>
        <% }

            if (p.getRol() == 2) {
//Si el profesor tiene permisos de nivel 2 (administrador de aula)
        %> 
        <nav class="vertical">
            <ul>
                <li><a href="">Profesor</a>
                    <ul>
                        <li><a href="Editar_Perfil.jsp">Editar perfil</a></li>
                        <li><a href="Listado_Reservas.jsp">Ver reservas</a></li>
                        <li><a href="Reservar_Aula.jsp">Reservar aula</a></li>
                    </ul>
                </li>

                <li><a href="">Administrador de aula</a>
                    <ul>
                        <li><a href="Gestion_Aulas.jsp">Gestionar aulas</a></li>
                        <li><a href="Gestion_Horarios.jsp">Gestionar horarios</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <% }
            if (p.getRol() == 3) {
//Si el profesor tiene permisos de nivel (administrador general)
        %> 
        <nav class="vertical">
            <ul>
                <li><a href="">Profesor</a>
                    <ul>
                        <li><a href="Editar_Perfil.jsp">Editar perfil</a></li>
                        <li><a href="Listado_Reservas.jsp">Ver reservas</a></li>
                        <li><a href="Reservar_Aula.jsp">Reservar aula</a></li>
                    </ul>
                </li>

                <li><a href="">Administrador de aula</a>
                    <ul>
                        <li><a href="Gestion_Aulas.jsp">Gestionar aulas</a></li>
                        <li><a href="Gestion_Horarios.jsp">Gestionar horarios</a></li>
                    </ul>
                </li>

                <li><a href="">Administrador general</a>
                    <ul>
                        <li><a href="Gestion_Usuarios.jsp">Gestionar usuarios</a></li>
                        <li><a href="Ver_Bitacora.jsp">Ver bitácora</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <% }
        %>

        <% LinkedList Lista_Horario = (LinkedList<Horario>) session.getAttribute("horario");
            LinkedList Lista_Horas_Reservadas = (LinkedList<Reserva>) session.getAttribute("horas_Reservadas");
            String fecha = (String) session.getAttribute("fecha");
            int cod_Aula = (Integer) session.getAttribute("cod_aula");
        %>
        <h4>Fecha <% out.println(fecha);%></h4>
        <h4>Aula <% out.println(cod_Aula);%></h4>
        <%
            for (int i = 0; i < Lista_Horario.size(); i++) {
                Horario h = (Horario) Lista_Horario.get(i);
        %>

        <form name="reservas" action="../Controladores/Controlador_Reservar_Aula.jsp" method="POST">
            <label for="cod_hora">Código de hora </label><input type="text" id="cod_hora" name="cod_hora" value="<%=h.getCod_Hora()%>" style="width: 50px">
            <label for="hora_inicio">Hora de inicio </label><input type="text" id="hora_inicio" name="hora_inicio" value="<%=h.getHora_Inicio()%>" style="width: 50px">
            <label for="hora_finalizar">Hora de final </label><input type="text" id="hora_finalizar" name="hora_finalizar" value="<%=h.getHora_Finalizar()%>" style="width: 50px">

            <%    if (!Lista_Horas_Reservadas.isEmpty()) {
                    for (int j = 0; j < Lista_Horas_Reservadas.size(); j++) {
                        //Horario h = (Horario) Lista_Horario.get(i);
                        Reserva r = (Reserva) Lista_Horas_Reservadas.get(j); %>

            <% if (r.getFecha().equals(fecha) && h.getCod_Hora() == r.getCod_Hora()) {
            %>
            <label for="reservar"></label><input type="submit" id="reservar" name="reservar" value="Reservada" disabled>
            <% } else { %> <label for="reservar"></label><input type="submit" id="reservar" name="reservar" value="Reservar"> <%

                    }
                }
            } else { %> <label for="reservar"></label><input type="submit" id="reservar" name="reservar" value="Reservar"> <%

                    }
            %>
            <br>
        </form>
        <%
            }
        %>

    </body>

    <footer>
        <adress>Realizado por:<br>
            Isabel de Marcos López<br>
            2º DAW
        </adress>
    </footer>

</html>