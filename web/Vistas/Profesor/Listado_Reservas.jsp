<%-- 
    Document   : Listado_Reservas
    Created on : 22-oct-2019, 8:48:06
    Author     : daw203
--%>

<%@page import="Auxiliares.ConexionEstatica"%>
<%@page import="Centro.Profesor"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Centro.Reserva"%>
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
            }

            ConexionEstatica.nueva();
            LinkedList<Reserva> Lista = ConexionEstatica.obtenerReservas(p.getCod_Prof());
            ConexionEstatica.cerrarBD();%>

        <table>
            <caption>Listado de reservas</caption>

            <thead>
                <tr>
                    <th>Código reserva</th>
                    <th>Código aula</th>
                    <th>Código hora</th>
                    <th>Fecha</th>
                    <th>Hora de inicio</th>
                    <th>Hora de final</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>

            <% for (int i = 0; i < Lista.size(); i++) {
                    Reserva r = Lista.get(i);
            %>


            <tbody>
                <tr>
            <form name="listado_aulas" action="../../Controladores/Controlador_Profesor.jsp" method="POST">
                <td><label for="cod_reser"></label><input type="number" id="cod_reser" name="cod_reser" value="<%=r.getCod_Reserva()%>"></td>
                <td><label for="cod_aula"></label><input type="text" id="cod_aula" name="cod_aula" value="<%=r.getCod_Aula()%>"></td>
                <td><label for="cod_hora"></label><input type="number" id="cod_hora" name="cod_hora" value="<%=r.getCod_Hora()%>"></td>
                <td><label for="fecha"></label><input type="date" id="fecha" name="fecha" value="<%=r.getFecha()%>"></td>
                <td><label for="hora_Inicio"></label><input type="text" id="hora_Inicio" name="hora_Inicio" value="<%=r.getHora_Inicio()%>"></td>
                <td><label for="hora_Finalizar"></label><input type="text" id="hora_Finalizar" name="hora_Finalizar" value="<%=r.getHora_Finalizar()%>"></td>
                <td><label for="modificar"></label><input type="submit" id="modificar" name="modificar_R" value="Modificar"></td>
                <td><label for="borrar"></label><input type="submit" id="borrar" name="borrar_R" value="Borrar"></td>
            </form>
            <%}%>
        </tr>
        <tr>
        <form name="botones" action="../../Controladores/Controlador_Profesor.jsp" method="POST">
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
