package servlet;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ServletPrepararProductos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        final String categoria = request.getParameter("categoria");
        final ArrayList<String> productos = this.obtenerProductosPorCatergoria(categoria);

        session.setAttribute("categoria", categoria);
        session.setAttribute("productos", productos);

        final RequestDispatcher dispacher = request.getRequestDispatcher("/compra.jsp");
        dispacher.forward(request, response);

    }

    public ArrayList<String> obtenerProductosPorCatergoria(String categoria) {
        final ArrayList<String> productos = new ArrayList();
        String realPath = this.getServletContext().getRealPath(getInitParameter("ficheroProductos"));
        try (BufferedReader br = new BufferedReader(new FileReader(realPath))) {

            String linea = br.readLine();
            while (linea != null) {
                String[] catProd = linea.split(";");
                
                if (catProd.length >= 2) {
                    if("".equals(categoria) == false && categoria != null){
                        if(catProd[0].equals(categoria))
                             productos.add(catProd[1]); 
                    } else productos.add(catProd[1]); 
                }
                linea = br.readLine();
            }
            br.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return productos;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet Preparar Productos";
    }

}