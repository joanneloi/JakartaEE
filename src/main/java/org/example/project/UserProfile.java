package org.example.project;

public class UserProfile {
    private final String email;
    private final String name;
    private final String password;
    private String imagePath;

    public UserProfile(String email, String name, String password, String imagePath) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.imagePath = imagePath;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getImagePath() {
        System.out.println(imagePath);
        return imagePath;
    }

    @Override
    public String toString() {
        return email + "," + name + "," + password + "," + imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public static UserProfile fromString(String csvLine) {
        String[] parts = csvLine.split(",");
        if (parts.length != 4) {  // Adjusted for 4 parts
            throw new IllegalArgumentException("Invalid CSV format.");
        }
        return new UserProfile(parts[0], parts[1], parts[2], parts[3]);
    }


}
