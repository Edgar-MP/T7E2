<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tema7Ejercicio2 | Edgar Martínez Palmero</title>
    </head>
    <body>
        <%
            ArrayList<String> productos = (ArrayList<String>) session.getAttribute("productos");
            HashMap<String, Integer> carritoCompra = (HashMap<String, Integer>) session.getAttribute("carritoCompra");

            if (carritoCompra == null) {
                carritoCompra = new HashMap();
            }

            if (request.getParameter("buy") != null) {
                String producto = request.getParameter("buy");
                if (!carritoCompra.containsKey(producto)) {
                    carritoCompra.put(producto, 1);
                } else {
                    carritoCompra.put(producto, carritoCompra.get(producto)  + 1);
                }
            }
            session.setAttribute("carritoCompra", carritoCompra);
        %>
        <table>
            <tr>
                <th>Poducto</th>
                <th>Pedir</th>
            </tr>
            <%
                for (String producto : productos) {
                    out.print("<tr>");
                    out.print("<td>" + producto + "</td>");
                    out.print("<td>");
                    out.print("<form action='" + getServletContext().getContextPath() + "/compra.jsp' method='get'>");
                    out.print("<input type='submit' value='Adquirir unidad'>");
                    out.print("<input type='hidden' name='buy' value='" + producto + "'>");
                    out.print("</form>");
                    out.print("</td>");
                    
                    if(carritoCompra.containsKey(producto))
                        out.print("<td>" +carritoCompra.get(producto) + " unidades</td>");
                    
                    out.print("</tr>");
                }
            %>
            
            
        </table>
            
        <jsp:include page="/muestracarro.jsp"></jsp:include>

    </body>
</html>