package org.example.jakartaee;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "ShopServlet", value = "/shop-servlet")
public class ShopServlet extends HttpServlet {

    // Handle GET request
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Set attributes in the request to send data to the JSP
        request.setAttribute("message", "Welcome to Jom Makan Shop! Explore our spices and herbs.");

        // Forward the request to shop.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/shop.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Handle POST request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        // Get parameters from the form
        String productId = request.getParameter("pid");
        int quantity = Integer.parseInt(request.getParameter("qty"));
        String action = null;

        // Determine which button was clicked
        if (request.getParameter("add_to_cart") != null) {
            action = "cart";
        } else if (request.getParameter("add_to_wishlist") != null) {
            action = "wishlist";
        }

        if ("cart".equals(action)) {
            addToCart(session, productId, quantity);
        } else if ("wishlist".equals(action)) {
            addToWishlist(session, productId);
        }

        // Set success message
        String message = "cart".equals(action) ? "Product added to cart!" : "Product added to wishlist!";
        request.setAttribute("message", message);

        // Forward the request back to shop.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/shop.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void addToCart(HttpSession session, String productId, int quantity) {
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        cart.put(productId, cart.getOrDefault(productId, 0) + quantity);
        session.setAttribute("cart_count", cart.size());
    }

    private void addToWishlist(HttpSession session, String productId) {
        Set<String> wishlist = (Set<String>) session.getAttribute("wishlist");
        if (wishlist == null) {
            wishlist = new HashSet<>();
            session.setAttribute("wishlist", wishlist);
        }

        wishlist.add(productId);
        session.setAttribute("wishlist_count", wishlist.size());
    }

    public void destroy() {}
}