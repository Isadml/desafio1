<%-- 
    Document   : Login_Profesores
    Created on : 16-oct-2019, 18:29:13
    Author     : isa
--%>

<%@page import="Centro.Profesor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../../index.jsp">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/miestilo.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/estiloFormularios.css"/>
        <script type="text/javascript" src="../../javaScript.js"></script>

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
                        <li><a href="Login_Profesores.jsp">Reservar aula</a></li>
                    </ul>
                </li>   
            </ul>
        </nav>
        <% }
            if (p.getRol() == 2) {
        %>
        <nav class="vertical">
            <ul>
                <li><a href="">Administrador de aula</a>
                    <ul>
                        <li><a href="Editar_Perfil.jsp">Editar perfil</a></li>
                        <li><a href="Listado_Reservas.jsp">Ver reservas</a></li>
                        <li><a href="Login_Profesores.jsp">Reservar aula</a></li>
                        <li><a href="../Admin_Aulas/Gestion_Aulas.jsp">Gestionar aulas</a></li>
                        <li><a href="../Admin_Aulas/Gestion_Horarios.jsp">Gestionar horarios</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <% }

            if (p.getRol() == 3) {
        %>
        <nav class="vertical">
            <ul>
                <li><a href="">Administrador general</a>
                    <ul>
                        <li><a href="Editar_Perfil.jsp">Editar perfil</a></li>
                        <li><a href="Listado_Reservas.jsp">Ver reservas</a></li>
                        <li><a href="Login_Profesores.jsp">Reservar aula</a></li>
                        <li><a href="../Admin_Aulas/Gestion_Aulas.jsp">Gestionar aulas</a></li>
                        <li><a href="../Admin_Aulas/Gestion_Horarios.jsp">Gestionar horarios</a></li>
                        <li><a href="../Admin_General/Gestion_Usuarios.jsp">Gestionar usuarios</a></li>
                        <li><a href="../Admin_General/Ver_Bitacora.jsp">Ver bitácora</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <%
            }%>

        <form name="login_prof" action="../../Controladores/Controlador_Profesor.jsp" method="POST">
            <label for="fecha">Fecha </label><input id="fecha" name="fecha" type="date" min=""/>
            <label for="aula">Aula </label><input id="aula" name="aula" type="number"/>
            <label for="ver_disp"></label><input id="ver_disp" type="submit" name="ver_disp" value="Ver disponibilidad"/>
            <label for="cerrar"></label><input id="cerrar" name="cerrar" type="submit" value="Cerrar sesión"/>
        </form>
        <label for="volver1"></label><input type="submit" id="volver1" name="volver" value="Volver" onclick="pag_Anterior()" style="width: 100px;">

        <footer>
            <adress>Realizado por:<br>
                Isabel de Marcos López<br>
                2º DAW
            </adress>
        </footer>
        
    </body>

</html>
