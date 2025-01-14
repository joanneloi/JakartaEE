package project;

import java.io.*;
import java.util.*;

public class ProductProfileManager {
    private static final String FILE_NAME = "products.csv";

    private static Map<String, ProductProfile> productMap = new HashMap<>();

    // Static block to load all products at startup
    static {
        try {
            loadAllProducts();
        } catch (IOException e) {
            System.err.println("Error loading product profiles: " + e.getMessage());
        }
    }

    // Load all products from the CSV file
    public static void loadAllProducts() throws IOException {
        try (BufferedReader reader = new BufferedReader(
                new FileReader(new File("products.csv")))) {
            String line;
            int lineNumber = 0;
            while ((line = reader.readLine()) != null) {
                lineNumber++;
                try {
                    if (!line.trim().isEmpty()) {
                        ProductProfile product = ProductProfile.fromString(line);
                        productMap.put(product.getId(), product);
                    }
                } catch (IllegalArgumentException e) {
                    System.err.println("Skipping malformed line " + lineNumber + ": " + line);
                }
            }
        }
    }

    // Find a product by its ID
    public static ProductProfile findProductById(String id) {
        return productMap.get(id);
    }

    // Save a new product to the CSV file
    public static void saveProduct(ProductProfile product) {
        // Save product profile
        try (FileWriter writer = new FileWriter("produc.csv", true)) {
            writer.append(product.toString()).append("\n");
            productMap.put(product.getId(), product); // Add to in-memory map
            System.out.println("Product saved successfully.");
        } catch (IOException e) {
            System.err.println("Error saving product profile: " + e.getMessage());
        }
    }

    // Get all products as a collection
    public static Collection<ProductProfile> getAllProducts() {
        return productMap.values();
    }
}
