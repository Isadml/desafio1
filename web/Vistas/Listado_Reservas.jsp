<%-- 
    Document   : Listado_Reservas
    Created on : 22-oct-2019, 8:48:06
    Author     : daw203
--%>

<%@page import="Centro.Profesor"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Centro.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <link rel="stylesheet" type="text/css" href="../css/estiloFormularios.css"/>
        <link rel="stylesheet" type="text/css" href="../css/.css"/>

        <title>Listado de aulas reservadas</title>
    </head>
    <body>

        <header>
            <h3>Listado de aulas reservadas</h3>
        </header>
        
        <% Profesor p = (Profesor) session.getAttribute("profe");
            if (p.getRol() == 1) {
        %>
        <nav class="vertical">
            <ul>
                <li><a href="Login_Profesores.jsp">Profesor</a>
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
        %>
        <nav class="vertical">
            <ul>
                <li><a href="Login_Profesores.jsp">Profesor</a>
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
        %>
        <nav class="vertical">
            <ul>
                <li><a href="Login_Profesores.jsp">Profesor</a>
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
        <%
            }%>

        <% LinkedList<Reserva> Lista = (LinkedList<Reserva>) session.getAttribute("reservas");

            for (int i = 0; i < Lista.size(); i++) {
                Reserva r = Lista.get(i);
        %>

        <form name="listado_aulas" action="../Controladores/Controlador_Listado_Reservas.jsp" method="POST">
            <label for="cod_reser">Código reserva </label><input type="number" id="cod_reser" name="cod_reser" value="<%=r.getCod_Reserva()%>">
            <label for="cod_aula">Código aula </label><input type="text" id="cod_aula" name="cod_aula" value="<%=r.getCod_Aula()%>">
            <label for="cod_hora">Código hora </label><input type="number" id="cod_hora" name="cod_hora" value="<%=r.getCod_Hora()%>">
            <label for="fecha">Fecha </label><input type="date" id="fecha" name="fecha" value="<%=r.getFecha()%>">
            <label for="hora_Inicio">Hora de inicio </label><input type="text" id="hora_Inicio" name="hora_Inicio" value="<%=r.getHora_Inicio()%>">
            <label for="hora_Finalizar">Hora de final </label><input type="text" id="hora_Finalizar" name="hora_Finalizar" value="<%=r.getHora_Finalizar()%>">

            <label for="modificar"></label><input type="submit" id="modificar" name="modificar" value="Modificar">
            <label for="borrar"></label><input type="submit" id="borrar" name="borrar" value="Borrar"><br><br>
        </form>

        <%}%>

        <form name="botones" action="../Controladores/Controlador_Listado_Reservas.jsp" method="POST">
            <label for="add"></label><input type="submit" id="add" name="add" value="+">
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
