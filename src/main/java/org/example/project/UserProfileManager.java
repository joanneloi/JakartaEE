package org.example.project;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
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
                new FileReader(UserProfileManager.class.getClassLoader().getResource(FILE_NAME).getFile()))) {
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
}
