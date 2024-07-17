package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.database.DatabaseController;

/**
 * Servlet implementation class EditServlet
 * This servlet handles editing of products.
 * 
 * code by: pratik singh rathour
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Delegate the POST request to the doPut method
        doPut(request, response);
    }

    /**
     * Method to handle product update
     * 
     * @param request  The HTTP request object containing the product information to be updated.
     * @param response The HTTP response object.
     * @throws ServletException if the servlet encounters difficulty.
     * @throws IOException      if an input or output error occurs while the servlet is handling the PUT request.
     */
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve product information from request parameters
        String productIdString = request.getParameter("productId");
        String newName = request.getParameter("name");
        String newDescription = request.getParameter("description");
        String newPriceString = request.getParameter("price");

        try {
            // Parse newPriceString to double
            double newPrice = Double.parseDouble(newPriceString);

            // Parse productId
            int productId = Integer.parseInt(productIdString);

            // Call the updateProduct method from DatabaseController and pass the updated product information
            int updationResult = new DatabaseController().updateProduct(productId, newName, newPrice, newDescription);

            if (updationResult == 1) {
                // If update is successful, redirect to admin page
                response.sendRedirect(request.getContextPath() + "/pages/admin.jsp");
            } else {
                // If update fails, redirect to admin page with an error message
                response.sendRedirect(request.getContextPath() + "/pages/admin.jsp?error=update_failed");
            }
        } catch (NumberFormatException ex) {
            // Handle the case where newPriceString cannot be parsed to double
            response.sendRedirect(request.getContextPath() + "/pages/admin.jsp?error=invalid_price");
        }
    }

}
