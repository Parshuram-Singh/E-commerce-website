package controller.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.database.DatabaseController; 
import controller.filters.AuthorizationFilter;
import model.LoginModel;
import util.StringUtils;

/**
 * Servlet implementation class LoginServlet
 * This servlet handles user login functionality.
 * 
 * Code by: Pratik Singh Rathour
 */
@WebServlet(urlPatterns = { StringUtils.LOGIN_SERVLET })
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DatabaseController dbController = new DatabaseController();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle GET requests (e.g., form submission)
        String username = request.getParameter(StringUtils.USERNAME);
        String password = request.getParameter(StringUtils.PASSWORD);

        // Create a LoginModel object to hold user credentials
        LoginModel loginModel = new LoginModel(username, password);

        // Call DBController to validate login credentials
        int loginResult = dbController.getUserLoginInfo(loginModel);

        if (loginResult == 1) {
            // Login successful
            HttpSession userSession = request.getSession();
            userSession.setAttribute(StringUtils.USERNAME, username);
            userSession.setMaxInactiveInterval(30 * 60); // Set session timeout to 30 minutes

            Cookie cookie = new Cookie(StringUtils.USER, username);
            cookie.setMaxAge(30 * 60); // Set cookie timeout to 30 minutes
            response.addCookie(cookie);

            // Determine user role using AuthorizationService
            String role = AuthorizationFilter.determineUserRole(username);
            // Set session attribute for user role
            userSession.setAttribute("userRole", role);

            // Redirect to the home page
            request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.MESSAGE_SUCCESS_LOGIN);
            response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);

        } else if (loginResult == 0) {
            // Login failed
            request.setAttribute("errorMessage", "Invalid username or password. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/login.jsp");
            dispatcher.forward(request, response); // Forward to login page with error message
        } else if (loginResult == -1) {
            // Username not found
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PASSWORD_UNMATCHED_ERROR_MESSAGE);
            request.setAttribute(StringUtils.USERNAME, username);
            request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
        } else {
            // Internal server error
            request.setAttribute(StringUtils.ERROR_MESSAGE, "An unexpected server error has occurred.");
            request.setAttribute(StringUtils.USERNAME, username);
            request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Delegate the logic to doGet (assuming form submission is POST)
        doGet(request, response);
    }
}
