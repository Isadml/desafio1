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
        <title>Archivo bitácora</title>
    </head>
    <body>
        <h3>Contenido del archivo bitácora</h3>
        
        <% LinkedList<String> ListaBitacora = (LinkedList<String>) session.getAttribute("bitacora");
        for (int i = 0; i < ListaBitacora.size(); i++) {
                String cad = ListaBitacora.get(i);
                %>
                <p><%out.println(cad);%></p>
            }

        %>
        
    </body>
</html>
