package model;

import java.io.File;
import java.io.Serializable;

import javax.servlet.http.Part;

import util.StringUtils;

public class ProductModel implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private String name;
    private String description;
    private double price;
    private String imageURLFromPart;

    public ProductModel() {
        // Default constructor
    }

    public ProductModel(String name, String description, double price, Part imagePart) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.imageURLFromPart = getImageUrl(imagePart);
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageURLFromPart() {
        return imageURLFromPart;
    }

    public void setImageURLFromPart(String imageURLFromPart) {
        this.imageURLFromPart = imageURLFromPart;
    }


	private String getImageUrl(Part part) {
		// Define the directory path to store uploaded user images. This path should be
		// configured elsewhere in the application.
		String savePath = StringUtils.IMAGE_DIR_USER;

		// Create a File object representing the directory to store uploaded images.
		File fileSaveDir = new File(savePath);

		// Initialize the variable to store the extracted image file name.
		String imageUrlFromPart = null;

		// Check if the directory to store uploaded images already exists.
		if (!fileSaveDir.exists()) {
			// If the directory doesn't exist, create it.
			// user mkdirs() method to create multiple or nested folder
			fileSaveDir.mkdir();
		}

		// Get the Content-Disposition header from the request part. This header
		// contains information about the uploaded file, including its filename.
		String contentDisp = part.getHeader("content-disposition");

		// Split the Content-Disposition header into individual parts based on
		// semicolons.
		String[] items = contentDisp.split(";");

		// Iterate through each part of the Content-Disposition header.
		for (String s : items) {
			// Check if the current part starts with "filename" (case-insensitive trim is
			// used).
			if (s.trim().startsWith("filename")) {
				// Extract the filename from the current part.
				// The filename is assumed to be enclosed in double quotes (").
				// This part removes everything before the equal sign (=) and the double quotes
				// surrounding the filename.
				imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
				break; // Exit the loop after finding the filename
			}
		}

		// If no filename was extracted from the Content-Disposition header, set a
		// default filename.
		if (imageUrlFromPart == null || imageUrlFromPart.isEmpty()) {
			imageUrlFromPart = "/Home_appliance/src/main/webapp/assets/IMAGE/printer/Color imageCLASS MF656Cdw.webp";
		}

		// Return the extracted or default image file name.
		return imageUrlFromPart;
	}

}
