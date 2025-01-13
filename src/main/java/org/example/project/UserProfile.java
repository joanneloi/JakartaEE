package org.example.project;

public class UserProfile {
    private String email;
    private String name;
    private String password;

    public UserProfile(String email, String name, String password) {
        this.email = email;
        this.name = name;
        this.password = password;
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

    @Override
    public String toString() {
        return email + "," + name + "," + password;
    }

    public static UserProfile fromString(String csvLine) {
        String[] parts = csvLine.split(",");
        if (parts.length != 3) {
            throw new IllegalArgumentException("Invalid CSV format.");
        }
        return new UserProfile(parts[0], parts[1], parts[2]);
    }
}
