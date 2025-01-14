package project;

public class ProductProfile {
    private String id;
    private String name;
    private String price; // Use String to match "RM5/-" format
    private String image;
    private String origin;
    private String description;
    private String category;

    public ProductProfile(String id, String name, String price, String image, String origin, String description, String category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.origin = origin;
        this.description = description;
        this.category = category;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPrice() {
        return price;
    }

    public String getImage() {
        return image;
    }

    public String getOrigin() {
        return origin;
    }

    public String getDescription() {
        return description;
    }

    public String getCategory() {
        return category;
    }

    @Override
    public String toString() {
        return id + "," + name + "," + price + "," + image + "," + origin + "," + description + "," + category;
    }

    public static ProductProfile fromString(String csvLine) {
        String[] parts = csvLine.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)", -1); // Handle commas inside quotes
        if (parts.length != 7) {
            throw new IllegalArgumentException("Invalid CSV format for product.");
        }
        return new ProductProfile(
                parts[0].trim(),
                parts[1].trim(),
                parts[2].trim(),
                parts[3].trim().replace("\"", ""), // Remove quotes around the image path
                parts[4].trim().replace("\"", ""), // Remove quotes around the origin
                parts[5].trim().replace("\"", ""), // Remove quotes around the description
                parts[6].trim()
        );
    }
}
