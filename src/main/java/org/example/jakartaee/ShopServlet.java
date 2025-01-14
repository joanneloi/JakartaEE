package org.example.jakartaee;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import com.google.gson.Gson;

public class ShopServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Debug log
        System.out.println("ShopServlet doGet method called");

        // Update the file path to match the project structure
        String filePath = getServletContext().getRealPath("/resources/products.csv");
        File csvFile = new File(filePath);

        // Debug log
        System.out.println("CSV file path: " + filePath);
        System.out.println("CSV file exists: " + csvFile.exists());

        if (!csvFile.exists()) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.getWriter().write("Error: CSV file not found at " + filePath);
            return;
        }

        List<Map<String, String>> products = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
            String headerLine = br.readLine(); // Skip header
            String line;

            while ((line = br.readLine()) != null) {
                String[] values = line.split(",");
                if (values.length < 7) continue;

                Map<String, String> product = new HashMap<>();
                product.put("id", values[0].trim());
                product.put("name", values[1].trim());
                product.put("price", String.format("%.2f", Double.parseDouble(values[2].trim())));
                // Keep the image path as is from CSV
                product.put("image", values[3].trim());
                product.put("origin", values[4].trim());
                // Remove quotes from description
                product.put("description", values[5].trim().replace("\"", ""));
                product.put("category", values[6].trim());
                products.add(product);

                // Debug log
                System.out.println("Added product: " + product);
            }
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String jsonOutput = gson.toJson(products);

        // Debug log
        System.out.println("Sending JSON response: " + jsonOutput);

        PrintWriter out = response.getWriter();
        out.write(jsonOutput);
        out.flush();
    }
}
