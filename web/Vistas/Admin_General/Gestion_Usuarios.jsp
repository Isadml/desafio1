<%-- 
    Document   : Gestion_Usuarios
    Created on : 21-oct-2019, 14:08:00
    Author     : isa
--%>

<%@page import="Centro.Profesor"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Auxiliares.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <link rel="stylesheet" type="text/css" href="../../css/estiloFormularios.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/.css"/>

        <title>Gestión de usuarios</title>
    </head>
    <body>

        <header>
            <h3>Bienvenido a la página de gestión de usuarios</h3>
        </header>

        <nav class="vertical">
            <ul>
                <li><a href="">Profesor</a>
                    <ul>
                        <li><a href="../Profesor/Editar_Perfil.jsp">Editar perfil</a></li>
                        <li><a href="../Profesor/Listado_Reservas.jsp">Ver reservas</a></li>
                        <li><a href="../Profesor/Login_Profesores.jsp">Reservar aula</a></li>
                    </ul>
                </li>

                <li><a href="">Administrador de aula</a>
                    <ul>
                        <li><a href="../Admin_Aulas/Gestion_Aulas.jsp">Gestionar aulas</a></li>
                        <li><a href="../Admin_Aulas/Gestion_Horarios.jsp">Gestionar horarios</a></li>
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


        <% ConexionEstatica.nueva();
            LinkedList<Profesor> ListaProfes = ConexionEstatica.obtenerProfesores();
            ConexionEstatica.cerrarBD();
            for (int i = 0; i < ListaProfes.size(); i++) {
                Profesor p = (Profesor) ListaProfes.get(i);
        %>
        <form name="gestion_usuarios" action="../../Controladores/Controlador_Admin_General.jsp" method="POST">
            <label for="email">Email: </label><input type="email" id="email" name="email" value="<%=p.getEmail()%>">
            <label for="nombre">Nombre: </label><input type="text" id="nombre" name="nombre" value="<%=p.getNombre()%>" >
            <label for="apellido">Apellido: </label><input type="text" id="apellido" name="apellido" value="<%=p.getApellidos()%>" >
            <label for="codigo"></label><input type="hidden" id="codigo" name="codigo" value="<%=p.getCod_Prof()%>" style="width: 50px">
            </br></br>
            <label for="modificar"></label><input type="submit" id="modificar" name="modificar" value="Modificar">
            <label for="borrar"></label><input type="submit" id="borrar" name="borrar" value="Borrar">

        </form>

        <form name="permisos" action="../../Controladores/Controlador_Admin_General.jsp" method="POST">
            <label for="codigo"></label><input type="hidden" id="codigo" name="codigo" value="<%=p.getCod_Prof()%>" style="width: 50px">
            <label for="permisos"></label><input type="number" id="permisos" name="permisos" min="1" max="3">
            <label for="mod_perm"></label><input type="submit" id="mod_perm" name="mod_perm" value="Modificar permisos">
            <label for="add_perm"></label><input type="submit" id="add_perm" name="add_perm" value="Añadir permisos"><br><br>
        </form>

        <%}%>
        <br><br>
        <form name="botones" action="../../Controladores/Controlador_Admin_General.jsp" method="POST">
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
