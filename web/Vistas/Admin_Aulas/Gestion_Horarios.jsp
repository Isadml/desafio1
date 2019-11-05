<%-- 
    Document   : Gestion_Horarios
    Created on : 21-oct-2019, 14:06:16
    Author     : isa
--%>

<%@page import="Auxiliares.ConexionEstatica"%>
<%@page import="Centro.Profesor"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Centro.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../../index.jsp">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../../css/estiloFormularios.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/miestilo.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/menu_hamburguesa.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/estilo_movil.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/estilo_tablet.css"/>
        <script type="text/javascript" src="../../javaScript.js"></script>

        <title>Gestión de horarios</title>
    </head>
    <body>

        <header>
            <h3>Bienvenido a la página de gestión de horarios</h3>
        </header>

        <% Profesor p = (Profesor) session.getAttribute("profe");
            if (p.getRol() == 2) {
        %>
        <button id="menu">MENU</button>
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
        <button id="menu">MENU</button>
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
            LinkedList<Horario> ListaHorario = ConexionEstatica.obtenerHorario();
            ConexionEstatica.cerrarBD(); %>
        <table>
            <caption>Gestión de horarios</caption>

            <thead>
                <tr>
                    <th>Código de la hora</th>
                    <th>Hora de inicio</th>
                    <th>Hora de finalización</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <% for (int i = 0; i < ListaHorario.size(); i++) {
                    Horario h = (Horario) ListaHorario.get(i);
            %>

            <tbody>
            <form name="gestion_horarios" action="../../Controladores/Controlador_Admin_Aulas.jsp" method="POST">
                <tr>
                    <td><label for="cod_hora"></label><input type="number" id="cod_hora" name="cod_hora" value="<%=h.getCod_Hora()%>"style="width: 50px;"></td>
                    <td><label for="hora_inicio"></label><input type="text" id="hora_inicio" name="hora_inicio" value="<%=h.getHora_Inicio()%>"style="width: 200px;"></td>
                    <td><label for="hora_final"></label><input type="text" id="hora_final" name="hora_final" value="<%=h.getHora_Finalizar()%>"style="width: 200px;"></td>
                    <td><label for="modificar"></label><input type="submit" id="modificar" name="modificar_H" value="Modificar"></td>
                    <td><label for="borrar"></label><input type="submit" id="borrar" name="borrar_H" value="Borrar"></td>
            </form>
        </tr>
        <% }
        %>

        <tr>
        <form name="add_hora" action="../../Controladores/Controlador_Admin_Aulas.jsp" method="POST">
            <td><label for="cod_hora"></label><input type="number" id="cod_hora" name="cod_hora" value="" style="width: 50px;"></td>
            <td><label for="hora_inicio"></label><input type="text" id="hora_inicio" name="hora_inicio" value="" style="width: 200px;"></td>
            <td><label for="hora_final"></label><input type="text" id="hora_final" name="hora_final" value="" style="width: 200px;"></td>
            <td><label for="add"></label><input type="submit" id="add" name="add_H" value="+"></td>
            <td></td>
            </tr>
            <tr>
                <td><label for="cerrar"></label><input type="submit" id="cerrar" name="cerrar" value="Cerrar sesión"></td>
        </form>    
        <td><label for="volver"></label><input type="submit" id="volver" name="volver" value="Volver" onclick="pag_Anterior()" style="width: 100px;"></td>
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
