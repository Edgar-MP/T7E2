<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tema7Ejercicio2 | Edgar Martínez Palmero</title>
    </head>
    <body>
        <br>
        <h1>Tu carro: </h1>
        <br>
        <%
            HashMap<String,Integer> carritoCompra = (HashMap<String,Integer>) session.getAttribute("carritoCompra");
            for (String producto : carritoCompra.keySet()) {
                out.print("<li>");
                out.print("<b>" + producto + "</b>");
                out.print("&nbsp;&nbsp;&nbsp; " + carritoCompra.get(producto) + " unidades ");
                out.print("</li>");
            }
        %>
    </body>
</html>