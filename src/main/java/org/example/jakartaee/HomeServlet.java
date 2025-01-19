package org.example.jakartaee;
import org.example.project.ProductProfile;
import org.example.project.ProductProfileManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "HomeServlet", value = "/home-servlet")
public class HomeServlet extends HttpServlet {

    // Handle GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<ProductProfile> products = ProductProfileManager.getAllProducts();
        System.out.println("Products retrieved: " + (products != null ? products.size() : 0)); // Debugging

        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop.jsp");
        dispatcher.forward(request, response);
    }

    // Handle POST request
//    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        // Handle POST and forward to home.jsp if necessary
//        request.setAttribute("message", "POST Request Handled");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
//        try {
//            dispatcher.forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    // Handle PUT request
//    public void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        request.setAttribute("message", "PUT Request Handled");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
//        try {
//            dispatcher.forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    // Handle DELETE request
//    public void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        request.setAttribute("message", "DELETE Request Handled");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
//        try {
//            dispatcher.forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    public void destroy() {}
}
