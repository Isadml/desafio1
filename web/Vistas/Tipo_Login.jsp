<%-- 
    Document   : Tipo_Login
    Created on : 18-oct-2019, 12:43:30
    Author     : daw203
--%>

<%@page import="Centro.Profesor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css"/>
        <link rel="stylesheet" type="text/css" href="../css/estiloFormularios.css"/>

        <title>Tipo login</title>
    </head>
    <body>
        <header>
            <h3>¿Cómo te quieres logear?</h3>
        </header>

        <% Profesor p = (Profesor) session.getAttribute("profe");

            if (p.getRol() == 1) {
        %>
        <nav class="vertical">
            <ul>
                <li><a href="">Profesor</a>
                    <ul>
                        <li><a href="">Editar perfil</a></li>
                        <li><a href="">Ver reservas</a></li>
                        <li><a href="">Reservar aula</a></li>
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
                        <li><a href="">Editar perfil</a></li>
                        <li><a href="">Ver reservas</a></li>
                        <li><a href="">Reservar aula</a></li>
                    </ul>
                </li>

                <li><a href="">Administrador de aula</a>
                    <ul>
                        <li><a href="">Gestionar aulas</a></li>
                        <li><a href="">Gestionar horarios</a></li>
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
                        <li><a href="">Editar perfil</a></li>
                        <li><a href="">Ver reservas</a></li>
                        <li><a href="">Reservar aula</a></li>
                    </ul>
                </li>

                <li><a href="">Administrador de aula</a>
                    <ul>
                        <li><a href="">Gestionar aulas</a></li>
                        <li><a href="">Gestionar horarios</a></li>
                    </ul>
                </li>

                <li><a href="">Administrador general</a>
                    <ul>
                        <li><a href="">Gestionar usuarios</a></li>
                        <li><a href="">Ver bitácora</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <% }
        %>

    </body>

    <footer>
        <adress>Realizado por:<br>
            Isabel de Marcos López<br>
            2º DAW
        </adress>
    </footer>

</html>
