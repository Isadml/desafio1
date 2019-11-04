<%-- 
    Document   : Editar_Perfil
    Created on : 23-oct-2019, 8:58:08
    Author     : daw203
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

        <title>Editar perfil</title>
    </head>
    <body>

        <header>
            <h3>Editar perfil</h3>
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


        <form name="editar" action="../../Controladores/Controlador_Profesor.jsp" method="POST">
            <label for="email">Email: </label><input type="email" id="email" name="email" value="<%=p.getEmail()%>">
            <label for="nombre">Nombre: </label><input type="text" id="nombre" name="nombre" value="<%=p.getNombre()%>">
            <label for="apellido">Apellido: </label><input type="text" id="apellido" name="apellido" value="<%=p.getApellidos()%>">
            <label for="password1">Contraseña: </label><input type="password" id="password1" name="pass1" value="">
            <label for="password2">Confirmar contraseña: </label><input type="password" id="password2" name="pass2" value="">
            <label for="modificar"></label><input type="submit" id="modificar" name="modificar" value="Modificar">
            <label for="cerrar"></label><input type="submit" id="cerrar" name="cerrar" value="Cerrar sesión">
        </form>
        <label for="volver2"></label><input type="submit" id="volver2" name="volver" value="Volver" onclick="pag_Anterior()" style="width: 100px;">

        <footer>
            <adress>Realizado por:<br>
                Isabel de Marcos López<br>
                2º DAW
            </adress>
        </footer>

    </body>


</html>
