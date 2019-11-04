<%-- 
    Document   : Gestion_Aulas
    Created on : 21-oct-2019, 14:03:47
    Author     : daw203
--%>

<%@page import="Auxiliares.ConexionEstatica"%>
<%@page import="Centro.Profesor"%>
<%@page import="Centro.Aula"%>
<%@page import="java.util.LinkedList"%>
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

        <title>Gestión de aulas</title>
    </head>
    <body>

        <header>
            <h3>Bienvenido a la página de gestión de aulas</h3>
        </header>

        <% Profesor p = (Profesor) session.getAttribute("profe");
            if (p.getRol() == 2) {
        %>
        <nav class="vertical">
            <ul>
                <li><a href="">Administrador de aula</a>
                    <ul>
                        <li><a href="../Profesor/Editar_Perfil.jsp">Editar perfil</a></li>
                        <li><a href="../Profesor/Listado_Reservas.jsp">Ver reservas</a></li>
                        <li><a href="../Profesor/Login_Profesores.jsp">Reservar aula</a></li>
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
                <li><a href="">Administrador general</a>
                    <ul>
                        <li><a href="../Profesor/Editar_Perfil.jsp">Editar perfil</a></li>
                        <li><a href="../Profesor/Listado_Reservas.jsp">Ver reservas</a></li>
                        <li><a href="../Profesor/Login_Profesores.jsp">Reservar aula</a></li>
                        <li><a href="Gestion_Aulas.jsp">Gestionar aulas</a></li>
                        <li><a href="Gestion_Horarios.jsp">Gestionar horarios</a></li>
                        <li><a href="../Admin_General/Gestion_Usuarios.jsp">Gestionar usuarios</a></li>
                        <li><a href="../Admin_General/Ver_Bitacora.jsp">Ver bitácora</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <%
            }
            ConexionEstatica.nueva();
            LinkedList<Aula> ListaAula = ConexionEstatica.obtenerAulas();
            ConexionEstatica.cerrarBD(); %>

        <table>
            <caption>Gestión de aulas</caption>

            <thead>
                <tr>
                    <th>Código del aula</th>
                    <th>Descripción</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>

            <% for (int i = 0; i < ListaAula.size(); i++) {
                    Aula a = (Aula) ListaAula.get(i);
            %>


            <tbody>
                <tr>
            <form name="gestion_aulas" action="../../Controladores/Controlador_Admin_Aulas.jsp" method="POST">
                <td><label for="cod_aula"> </label><input type="number" id="cod_aula" name="cod_aula" value="<%=a.getCodAula()%>"></td>
                <td><label for="descrip"> </label><input type="text" id="descrip" name="descrip" value="<%=a.getDescripcion()%>"></td>
                <td><label for="modificar"></label><input type="submit" id="modificar" name="modificar" value="Modificar"></td>
                <td><label for="borrar"></label><input type="submit" id="borrar" name="borrar" value="Borrar"></td>
                    <% }%>
            </form>
        </tr>
        <tr>
        <form name="add_aula" action="../../Controladores/Controlador_Admin_Aulas.jsp" method="POST">
            <td><label for="cod_aula"></label><input type="number" id="cod_aula" name="cod_aula" value=""></td>
            <td><label for="descrip"></label><input type="text" id="descrip" name="descrip" value=""></td>
            <td><label for="add"></label><input type="submit" id="add" name="add" value="+"></td>
            <td></td>
            </tr>
            <tr>
                <td><label for="cerrar"></label><input type="submit" id="cerrar" name="cerrar" value="Cerrar sesión"></td>
        </form>
        <td><label for="volver"></label><input type="submit" id="volver" name="volver" value="Volver" onclick="pag_Anterior()" style="width: 100px;"></td>
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
