package org.example.project;

import java.io.*;
import java.io.IOException;
import java.nio.file.Files;
import java.util.*;

public class UserProfileManager {
    private static final String FILE_NAME = "user_profiles.csv";

    private static Map<String, UserProfile> userMap = new HashMap<>();
    private static String imagePath;

    static {
        try {
            loadAllUsers();
        } catch (IOException e) {
            System.err.println("Error loading user profiles: " + e.getMessage());
        }
    }

    public static void loadAllUsers() throws IOException {
        try (BufferedReader reader = new BufferedReader(
                new FileReader(Objects.requireNonNull(UserProfileManager.class.getClassLoader().getResource(FILE_NAME)).getFile()))) {
            String line;
            int lineNumber = 0;
            while ((line = reader.readLine()) != null) {
                lineNumber++;
                try {
                    if (!line.trim().isEmpty()) {
                        UserProfile user = UserProfile.fromString(line);
                        userMap.put(user.getEmail(), user);
                        System.out.println("Loaded user: " + user.getEmail());
                    }
                } catch (IllegalArgumentException e) {
                    System.err.println("Skipping malformed line " + lineNumber + ": " + line);
                }
            }
        }
    }

    public static UserProfile findUserByEmail(String email) {
        System.out.println("Finding user by email: " + email);
        return userMap.get(email);
    }

    public static void saveUser(UserProfile user) {
        // Ensure the uploads directory exists
        File uploadDir = new File("uploads");
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Generate unique image path
        String imageFileName = UUID.randomUUID() + "_" + user.getEmail() + ".png";
        String imageFilePath = "uploaded_img/" + imageFileName;

        try {
            // Copy the image file
            Files.copy(new File(imagePath).toPath(), new File(imageFilePath).toPath());
            user.setImagePath(imageFilePath); // Update UserProfile with image path
        } catch (IOException e) {
            System.err.println("Error storing image: " + e.getMessage());
            return;
        }

        // Save user profile to CSV
        try (FileWriter writer = new FileWriter(FILE_NAME, true)) {
            writer.append(user.getEmail()).append(",")
                    .append(user.getName()).append(",")
                    .append(user.getPassword()).append(",")
                    .append(imageFilePath).append("\n");
            System.out.println("User saved successfully.");
        } catch (IOException e) {
            System.err.println("Error saving user profile: " + e.getMessage());
        }
    }


}

