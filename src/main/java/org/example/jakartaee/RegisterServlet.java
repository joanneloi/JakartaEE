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
    private static final String UPLOAD_DIR = "uploads";  // For images and CSV file
    private static final String CSV_FILE = "user_profile.csv";  // CSV file name

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
        var imagePart = request.getPart("image");
        if (imagePart == null || (!imagePart.getContentType().equals("image/jpeg") && !imagePart.getContentType().equals("image/png"))) {
            response.getWriter().write("Invalid image type! Please upload a JPG or PNG image.");
            return;
        }

        // Get the submitted file name and extract the extension
        String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
        String extension = fileName.substring(fileName.lastIndexOf("."));

        // Rename the file using the email
        String newFileName = email + extension;

        // Get the path to store the uploaded image
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Save the image with the new name
        String filePath = uploadPath + File.separator + newFileName;
        imagePart.write(filePath);

        // Define path for the CSV file (outside of resources)
        String csvFilePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR + File.separator + CSV_FILE;

        // Ensure the CSV file exists
        File csvFile = new File(csvFilePath);
        if (!csvFile.exists()) {
            csvFile.createNewFile();  // Create the file if it doesn't exist
        }

        // Write user profile to CSV
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(csvFile, true))) {
            String csvLine = email + "," + name + "," + password + "," + newFileName;
            writer.write(csvLine);
            writer.newLine();
            writer.flush();  // Ensure data is written
        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred while saving user profile.");
            return;
        }

        response.sendRedirect("login.jsp");
    }
}
