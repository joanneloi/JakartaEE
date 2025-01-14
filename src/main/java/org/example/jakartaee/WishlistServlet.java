package org.example.jakartaee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "WishlistServlet", value = "/wishlist-servlet")
public class WishlistServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch wishlist from session
        HttpSession session = request.getSession();
        List<String> wishlist = (List<String>) session.getAttribute("wishlist");

        if (wishlist == null) {
            wishlist = new ArrayList<>();
            session.setAttribute("wishlist", wishlist);
        }

        // Forward to the wishlist page
        request.setAttribute("wishlist", wishlist);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/wishlist.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Action handling (e.g., add or delete)
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        List<String> wishlist = (List<String>) session.getAttribute("wishlist");

        if (wishlist == null) {
            wishlist = new ArrayList<>();
        }

        if ("add".equals(action)) {
            // Add an item to the wishlist
            String item = request.getParameter("item");
            if (item != null && !item.trim().isEmpty()) {
                wishlist.add(item);
            }
        } else if ("delete".equals(action)) {
            // Remove an item from the wishlist
            String item = request.getParameter("item");
            wishlist.remove(item);
        } else if ("clear".equals(action)) {
            // Clear the wishlist
            wishlist.clear();
        }

        // Save updated wishlist in the session
        session.setAttribute("wishlist", wishlist);

        // Redirect back to the wishlist page
        response.sendRedirect("wishlist-servlet");
    }
}