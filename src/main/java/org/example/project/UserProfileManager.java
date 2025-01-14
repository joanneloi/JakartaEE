package org.example.project;

import java.io.*;
import java.io.IOException;
import java.nio.file.Files;
import java.util.*;

public class UserProfileManager {
    private static final String FILE_NAME = "user_profiles.csv";

    private static Map<String, UserProfile> userMap = new HashMap<>();

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
                    }
                } catch (IllegalArgumentException e) {
                    System.err.println("Skipping malformed line " + lineNumber + ": " + line);
                }
            }
        }
    }

    public static UserProfile findUserByEmail(String email) {
        return userMap.get(email);
    }

    public static void saveUser(UserProfile user) {
        // Handle image storage
        String imageFilePath = "path/to/images/" + user.getEmail() + ".png";
        File imageFile = new File(imageFilePath);

        try {
            Files.copy(new File(imagePath).toPath(), imageFile.toPath());
            user.setImagePath(imageFilePath);  // Update UserProfile with image path
        } catch (IOException e) {
            System.err.println("Error storing image: " + e.getMessage());
            return;
        }

        // Save user profile
        try (FileWriter writer = new FileWriter(FILE_NAME, true)) {
            writer.append(user.toString()).append("\n");
            System.out.println("User saved successfully.");
        } catch (IOException e) {
            System.err.println("Error saving user profile: " + e.getMessage());
        }
    }

}

