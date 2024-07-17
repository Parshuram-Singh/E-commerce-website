package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.database.DatabaseController;
import model.ProductModel;
import util.StringUtils;

/**
 * Servlet implementation class ModifyServlet
 * This servlet handles modification of products.
 * Code by: Pratik Singh Rathour
 */
@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.MODIFY_SERVLET })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class ModifyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final DatabaseController dbController;

    public ModifyServlet() {
        super();
        dbController = new DatabaseController();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve product information from the request parameters
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        Part imagePart = request.getPart("image");

        // Create a ProductModel object with the retrieved information
        ProductModel product = new ProductModel(name, description, price, imagePart);

        // Add the product to the database
        int result = dbController.addProduct(product);
        
        // If product addition is successful, upload the product image and redirect to the home page
        if (result == 1) {
            String imageUploadPath = StringUtils.IMAGE_DIR_PRODUCT;
            String fileName = product.getImageURLFromPart();
            if (!fileName.isEmpty() && fileName != null) {
                imagePart.write(imageUploadPath + fileName);
            }
            response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE + "?success=true");
        } else {
            // Handle the case where product addition fails
        }
    }
}
