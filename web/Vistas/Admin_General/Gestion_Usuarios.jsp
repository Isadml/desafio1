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
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../../index.jsp">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/estiloFormularios.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/miestilo.css"/>
        <script type="text/javascript" src="../../javaScript.js"></script>

        <title>Gestión de usuarios</title>
    </head>
    <body>

        <header>
            <h3>Bienvenido a la página de gestión de usuarios</h3>
        </header>

        <nav class="vertical">
            <ul>
                <li><a href="">Administrador general</a>
                    <ul>
                        <li><a href="../Profesor/Editar_Perfil.jsp">Editar perfil</a></li>
                        <li><a href="../Profesor/Listado_Reservas.jsp">Ver reservas</a></li>
                        <li><a href="../Profesor/Login_Profesores.jsp">Reservar aula</a></li>
                        <li><a href="../Admin_Aulas/Gestion_Aulas.jsp">Gestionar aulas</a></li>
                        <li><a href="../Admin_Aulas/Gestion_Horarios.jsp">Gestionar horarios</a></li>
                        <li><a href="Gestion_Usuarios.jsp">Gestionar usuarios</a></li>
                        <li><a href="Ver_Bitacora.jsp">Ver bitácora</a></li>
                    </ul>
                </li>
            </ul>
        </nav>


        <% ConexionEstatica.nueva();
            LinkedList<Profesor> ListaProfes = ConexionEstatica.obtenerProfesores();
            ConexionEstatica.cerrarBD();%>

        <table>
            <caption>Usuarios registrados</caption>

            <thead>
                <tr>
                    <th>Email</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <% for (int i = 0; i < ListaProfes.size(); i++) {
                    Profesor p = (Profesor) ListaProfes.get(i);
            %>

            <tbody>
                <tr>
            <form name="gestion_usuarios" action="../../Controladores/Controlador_Admin_General.jsp" method="POST">
                <td><label for="email"></label><input type="email" id="email" name="email" value="<%=p.getEmail()%>" style="width: 200px;"></td>
                <td><label for="nombre"></label><input type="text" id="nombre" name="nombre" value="<%=p.getNombre()%>" style="width: 100px;"></td>
                <td><label for="apellido"></label><input type="text" id="apellido" name="apellido" value="<%=p.getApellidos()%>" style="width: 100px;"></td>
                <td><label for="modificar"></label><input type="submit" id="modificar" name="modificar" value="Modificar"></td>
                <td><label for="borrar"></label><input type="submit" id="borrar" name="borrar" value="Borrar"></td>
                <td><label for="permisos"></label><input type="number" id="permisos" name="permisos" min="1" max="3" value="<%=p.getRol()%>"style="width: 50px;"></td>
                <td><label for="mod_perm"></label><input type="submit" id="mod_perm" name="mod_perm" value="Modificar permisos"></td>
                <td><label for="add_perm"></label><input type="submit" id="add_perm" name="add_perm" value="Añadir permisos"></td>
                <label for="codigo"></label><input type="hidden" id="codigo" name="codigo" value="<%=p.getCod_Prof()%>">
            </form>
            <% }%>
        </tr>
        <tr>
        <form name="botones" action="../../Controladores/Controlador_Admin_General.jsp" method="POST">
            <td><label for="add"></label><input type="submit" id="add" name="add" value="+"></td>
            <td><label for="cerrar"></label><input type="submit" id="cerrar" name="cerrar" value="Cerrar sesión"></td>
        </form>
        <td><label for="volver"></label><input type="submit" id="volver" name="volver" value="Volver" onclick="pag_Anterior()" style="width: 100px;"></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>

    </tr>
</tbody>

</table>

<footer>
    <adress>Realizado por:<br>
        Isabel de Marcos López<br>
        2º DAW
    </adress>
</footer>

</body>

</html>
