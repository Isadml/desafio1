<%-- 
    Document   : Ver_Bitacora
    Created on : 21-oct-2019, 14:18:12
    Author     : isa
--%>

<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="REFRESH" CONTENT="60;URL=../index.jsp">
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css"/>
        <link rel="stylesheet" type="text/css" href="../css/estiloFormularios.css"/>

        <title>Archivo bitácora</title>
    </head>
    <body>
        <header>
            <h3>Contenido del archivo bitácora</h3>
        </header>

        <nav class="vertical">
            <ul>
                <li><a href="Login_Profesores.jsp">Profesor</a>
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

        <% LinkedList<String> ListaBitacora = new LinkedList();
            ListaBitacora = (LinkedList<String>) session.getAttribute("bitacora");
            for (int i = 0; i < ListaBitacora.size(); i++) {
                String cad = ListaBitacora.get(i);
        %>
        <p><% out.println(cad);%></p>
        }

        %>

    </body>

    <footer>
        <adress>Realizado por:<br>
            Isabel de Marcos López<br>
            2º DAW
        </adress>
    </footer>

</html>
