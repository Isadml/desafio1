<%-- 
    Document   : Gestion_Aulas
    Created on : 21-oct-2019, 14:03:47
    Author     : daw203
--%>

<%@page import="Centro.Profesor"%>
<%@page import="Centro.Aula"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <link rel="stylesheet" type="text/css" href="../css/.css"/>
        <link rel="stylesheet" type="text/css" href="../css/.css"/>

        <title>Gestión de aulas</title>
    </head>
    <body>

        <header>
            <h3>Bienvenido a la página de gestión de aulas</h3>
        </header>

        <% Profesor p = (Profesor) session.getAttribute("profe");

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

    <footer>
        <adress>Realizado por:<br>
            Isabel de Marcos López<br>
            2º DAW
        </adress>
    </footer>

</html>
