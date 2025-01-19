package org.example.jakartaee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet(name = "RegisterServlet", value = "/register-servlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";
    private static final String CSV_FILE = "csv_file/user_profiles.csv";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String confirmPassword = request.getParameter("cpass");

        // Validate passwords
        if (!password.equals(confirmPassword)) {
            response.getWriter().write("Passwords do not match!");
            return;
        }

        // Validate uploaded image
        String contentType = request.getPart("image").getContentType();
        if (!contentType.equals("image/jpeg") && !contentType.equals("image/png")) {
            response.getWriter().write("Invalid image type! Please upload a JPG or PNG image.");
            return;
        }

        // Save uploaded image
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String fileName = Paths.get(request.getPart("image").getSubmittedFileName()).getFileName().toString();
        String filePath = uploadPath + File.separator + fileName;
        request.getPart("image").write(filePath);

        // Write user profile to CSV
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(CSV_FILE, true))) {
            String csvLine = email + "," + name + "," + password + "," + fileName;
            writer.write(csvLine);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred while saving user profile.");
            return;
        }

        response.sendRedirect("login.jsp");
    }
}
