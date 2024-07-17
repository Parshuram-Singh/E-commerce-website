package controller.servlets;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.database.DatabaseController;
import model.UserModel;
import util.StringUtils;

/**
 * Servlet implementation class RegisterServlet
 * This servlet handles user registration.
 * code by: pratik singh rathour
 */
@WebServlet(urlPatterns = { StringUtils.REGISTER_SERVLET })
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final DatabaseController dbController;

    public RegisterServlet() {
        super();
        dbController = new DatabaseController();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user information from request parameters
        String fullName = request.getParameter(StringUtils.FULL_NAME);
        String username = request.getParameter(StringUtils.USERNAME);
        String dobString = request.getParameter(StringUtils.BIRTHDAY);
        LocalDate dob = LocalDate.parse(dobString);
        String email = request.getParameter(StringUtils.EMAIL);
        String phoneNumber = request.getParameter(StringUtils.PHONE_NUMBER);
        String gender = request.getParameter(StringUtils.GENDER);
        String password = request.getParameter(StringUtils.PASSWORD);
        String retypePassword = request.getParameter(StringUtils.RETYPE_PASSWORD);

        // Create a UserModel object with the retrieved information
        UserModel userModel = new UserModel(fullName, username, dob, email, phoneNumber, gender, password);

        // Add the user to the database
        int result = dbController.addUser(userModel);

        // Check if passwords match
        if (!password.equals(retypePassword)) {
            // Passwords do not match, set an error message and forward to the registration page
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PASSWORD_UNMATCHED_ERROR_MESSAGE);
            request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
            return; // Exit the method
        }

        // Handle the registration result
        switch (result) {
            case 1:
                // Registration successful, set a success message and redirect to the login page
                request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_REGISTER_MESSAGE);
                response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
                return; // Exit the method after successful registration
            case 0:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.REGISTER_ERROR_MESSAGE);
                break;
            case -2:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.USERNAME_ERROR_MESSAGE);
                break;
            case -4:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.EMAIL_ERROR_MESSAGE);
                break;
            case -5:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PHONE_ERROR_MESSAGE);
                break;
            default:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
        }
        // Forward to the register page in case of any errors
        request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
    }

}
