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
 * Servlet implementation class ActionServlet
 * This servlet handles actions related to products, such as editing and deleting.
 * 
 * code by: pratik singh rathour
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ActionServlet" })
@MultipartConfig
public class ActionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the request is for editing a product
        if (request.getParameter("updateId") != null) {
            // Retrieve the ID of the product to be edited
            String productId = request.getParameter("updateId");
            // Redirect to the edit page with the product ID appended as a parameter
            response.sendRedirect(request.getContextPath() + "/pages/edit.jsp?productId=" + productId);
        }
        // Check if the request is for deleting a product
        else if (request.getParameter("deleteId") != null) {
            // Call the doDelete method to handle product deletion
            doDelete(request, response);
        }
    }

    /**
     * Method to handle product deletion
     * 
     * @param request  The HTTP request object containing the product ID to be deleted.
     * @param response The HTTP response object.
     * @throws ServletException if the servlet encounters difficulty.
     * @throws IOException  if an input or output error occurs while the servlet is handling the DELETE request.
     */
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the ID of the product to be deleted
        String productId = request.getParameter("deleteId");
        // Call the deleteProduct method from DatabaseController
        int deletionResult = new DatabaseController().deleteProduct(productId);

        // Check if deletion was successful
        if (deletionResult == 1) {
            // If deletion is successful, redirect to admin page
            response.sendRedirect(request.getContextPath() + "/pages/admin.jsp");
        } else {
            // If deletion fails, redirect to admin page with an error message
            response.sendRedirect(request.getContextPath() + "/pages/admin.jsp?error=delete_failed");
        }
    }

}
