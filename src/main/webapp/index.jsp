<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tema7Ejercicio2</title>
    </head>
    <body>
        <form action="<%= getServletContext().getContextPath() + "/productos" %>" method="get">

            <select name="category">
                <option value="">todos</option>
                <option value="100">100</option>
                <option value="200">200</option>
                <option value="300">300</option>
            </select>
            <input type="submit" value="Ver productos">
        </form>
    </body>
</html>