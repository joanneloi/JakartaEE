package org.example.jakartaee;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import project.ProductProfile;
import project.ProductProfileManager;

import java.io.IOException;
import java.util.Collection;

public class ShopServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Debug log
        System.out.println("ShopServlet doGet method called");

        try {
            // Load all products using the ProductProfileManager
            Collection<ProductProfile> products = ProductProfileManager.getAllProducts();

            // Debug log
            System.out.println("Loaded products: " + products);

            // Convert the products collection to JSON
            Gson gson = new Gson();
            String jsonOutput = gson.toJson(products);

            // Debug log
            System.out.println("Sending JSON response: " + jsonOutput);

            // Set response content type and write JSON output
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonOutput);

        } catch (Exception e) {
            // Handle errors
            System.err.println("Error in ShopServlet: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error loading products: " + e.getMessage());
        }
    }
}
