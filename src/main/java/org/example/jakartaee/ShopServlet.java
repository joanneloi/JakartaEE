package org.example.jakartaee;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/ShopServlet")
public class ShopServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String productId = request.getParameter("productId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Initialize cart and wishlist if they don't exist
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        List<String> wishlist = (List<String>) session.getAttribute("wishlist");
        if (wishlist == null) {
            wishlist = new ArrayList<>();
            session.setAttribute("wishlist", wishlist);
        }

        if ("addToCart".equals(action)) {
            // Add to cart
            cart.put(productId, cart.getOrDefault(productId, 0) + quantity);
            session.setAttribute("cartSize", cart.values().stream().mapToInt(Integer::intValue).sum());
        } else if ("addToWishlist".equals(action)) {
            // Add to wishlist
            if (!wishlist.contains(productId)) {
                wishlist.add(productId);
            }
            session.setAttribute("wishlistSize", wishlist.size());
        }

        // Calculate total price (assuming you have a method to get price by productId)
        double totalPrice = calculateTotalPrice(cart);
        session.setAttribute("totalPrice", totalPrice);

        // Send JSON response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("{\"cartSize\":" + session.getAttribute("cartSize") +
                ",\"wishlistSize\":" + session.getAttribute("wishlistSize") +
                ",\"totalPrice\":" + totalPrice + "}");
        out.flush();
    }

    private double calculateTotalPrice(Map<String, Integer> cart) {
        // Implement price calculation logic here
        // This is a placeholder implementation
        return cart.values().stream().mapToDouble(quantity -> quantity * 10.0).sum();
    }
}