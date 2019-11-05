<%--
    Document   : Reservar_Aula
    Created on : 23-oct-2019, 18:47:43
    Author     : isa
--%>

<%@page import="Auxiliares.ConexionEstatica"%>
<%@page import="Centro.Profesor"%>
<%@page import="Centro.Reserva"%>
<%@page import="Centro.Horario"%>
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
        <link rel="stylesheet" type="text/css" href="../../css/menu_hamburguesa.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/estilo_movil.css"/>
        <link rel="stylesheet" type="text/css" href="../../css/estilo_tablet.css"/>
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
        <button id="menu">MENU</button>
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
        <button id="menu">MENU</button>
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
        <button id="menu">MENU</button>
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

        <% ConexionEstatica.nueva();
            LinkedList Lista_Horario = ConexionEstatica.obtenerHorario();
            String fecha = (String) session.getAttribute("fecha");
            int cod_Aula = (Integer) session.getAttribute("cod_aula");
            LinkedList Lista_Horas_Reservadas = ConexionEstatica.obetenerHorasReservadas(cod_Aula, fecha);
            ConexionEstatica.cerrarBD();
        %>
        <h4>Fecha <% out.println(fecha);%></h4>
        <h4>Aula <% out.println(cod_Aula);%></h4>

        <table>
            <caption>Disponibilidad del aula</caption>

            <thead>
                <tr>
                    <th>Código de hora</th>
                    <th>Hora de inicio</th>
                    <th>Hora de final</th>
                    <th></th>
                </tr>
            </thead>

            <% for (int i = 0; i < Lista_Horario.size(); i++) {
                    Horario h = (Horario) Lista_Horario.get(i);
            %>
            <form name="reservas" action="../../Controladores/Controlador_Profesor.jsp" method="POST">

                <tbody>
                    <tr>
                        <td><label for="cod_hora"></label><input type="text" id="cod_hora" name="cod_hora" value="<%=h.getCod_Hora()%>"></td>
                        <td><label for="hora_inicio"></label><input type="text" id="hora_inicio" name="hora_inicio" value="<%=h.getHora_Inicio()%>"></td>
                        <td><label for="hora_finalizar"></label><input type="text" id="hora_finalizar" name="hora_finalizar" value="<%=h.getHora_Finalizar()%>"></td>

                        <%    if (!Lista_Horas_Reservadas.isEmpty()) {
                                int j = 0;
                                boolean encontrado = false;
                                while (j < Lista_Horas_Reservadas.size() && !encontrado) {
                                    //Horario h = (Horario) Lista_Horario.get(i);
                                    Reserva r = (Reserva) Lista_Horas_Reservadas.get(j); %>

                        <% if (r.getFecha().equals(fecha) && h.getCod_Hora() == r.getCod_Hora()) {
                                    encontrado = true;
                                    j++;
                                } else {
                                    j++;
                                }
                            }//fin while
                            if (encontrado) {
                        %>
                        <td><label for="reservar"></label><input type="submit" id="reservar" name="reservar" value="Reservada" disabled></td>
                            <% } else { %>
                        <td><label for="reservar"></label><input type="submit" id="reservar" name="reservar" value="Reservar"></td>
                            <%
                                }
                            } else {%> 
                        <td><label for="reservar"></label><input type="submit" id="reservar" name="reservar" value="Reservar"></td>
                            <%
                                }
                            %>  
                    </tr>
                    <tr>
                        <td><label for="cerrar"></label><input type="submit" id="cerrar" name="cerrar" value="Cerrar sesión"></td>
            </form>
            <% }%>
            <td><label for="volver"></label><input type="submit" id="volver" name="volver" value="Volver" onclick="pag_Anterior()" </form>
                <% }%>></td>
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