package org.example.jakartaee;
import jakarta.servlet.annotation.WebServlet;
import org.example.project.ProductProfile;
import org.example.project.ProductProfileManager;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Collection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "ShopServlet", value = "/shop-servlet")
public class ShopServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<ProductProfile> products = ProductProfileManager.getAllProducts();
        System.out.println("Products retrieved: " + (products != null ? products.size() : 0)); // Debugging

        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop.jsp");
        dispatcher.forward(request, response);
    }
}

