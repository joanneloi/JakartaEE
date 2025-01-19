package org.example.jakartaee;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;
import org.example.project.UserProfile;
import org.example.project.UserProfileManager;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {

    private static final String ERROR_REQUIRED_FIELDS = "Email and password are required.";
    private static final String ERROR_INVALID_CREDENTIALS = "Invalid email or password!";

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserProfile user = UserProfileManager.findUserByEmail(email);

        if (email == null || email.isBlank() || password == null || password.isBlank()) {
            request.setAttribute("message", ERROR_REQUIRED_FIELDS);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            System.out.println("login");
            return;
        }

        if (user != null && user.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("userName", user.getName());
            session.setAttribute("userImage", "uploads/" + user.getImagePath());
            response.sendRedirect("home.jsp");
            response.sendRedirect("about.jsp");
            response.sendRedirect("cart.jsp");
            response.sendRedirect("catogory.jsp");
            response.sendRedirect("shop.jsp");
        } else {
            System.out.println("unsuccessful login");
            request.setAttribute("errorMessage", ERROR_INVALID_CREDENTIALS);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

