package org.example.jakartaee;
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

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        if (email == null || email.isBlank() || password == null || password.isBlank()) {
            request.setAttribute("message", "Email and password are required.");
            forwardToLogin(request, response);
            return;
        }

        UserProfile user = UserProfileManager.findUserByEmail(email);

        if (user != null && user.getPassword().equals(password)) {
            response.sendRedirect("home.jsp");
        } else {
            request.setAttribute("message", "Invalid email or password.");
            forwardToLogin(request, response);
        }
    }

    private void forwardToLogin(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

