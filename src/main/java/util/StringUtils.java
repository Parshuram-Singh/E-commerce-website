	package util;

public class StringUtils {

	// SQL Queries
	public static final String INSERT_USER = "INSERT INTO users "
			+ "(full_name, user_name, birthday, email, phone, gender, password) " + "VALUES (?, ?, ?, ?, ?, ?, ?)";


	public static final String GET_LOGIN_USER_INFO = "SELECT * FROM users WHERE user_name = ?";
	public static final String GET_ALL_USER_INFO = "SELECT * FROM users";
	
	public static final String IMAGE_ROOT_PATH = "Users\\singh\\eclipse-workspace\\22085566 Pratik Singh Rathour.zip_expanded\\22085566 Pratik Singh Rathour\\src\\main\\webapp\\assets\\IMAGE\\";
	public static final String IMAGE_DIR_PRODUCT = "C:/" + IMAGE_ROOT_PATH + "appliance/";
	public static final String IMAGE_DIR_USER = "C:/" + IMAGE_ROOT_PATH + "profile\\";


	public static final String GET_USERNAME = "SELECT COUNT(*) FROM users WHERE user_name = ?;";
	public static final String GET_EMAIL = "SELECT COUNT(*) FROM users WHERE email = ?;";
	public static final String GET_PHONE = "SELECT COUNT(*) FROM users WHERE phone = ?;";
	// Parameter Names
	public static final String FULL_NAME = "fullName";
	public static final String USERNAME = "username";
	public static final String USER_NAME = "user_name";
	public static final String BIRTHDAY = "birthday";
	public static final String EMAIL = "email";
	public static final String PHONE_NUMBER = "phone";
	public static final String GENDER = "gender";
	public static final String PASSWORD = "password";
	public static final String RETYPE_PASSWORD = "confirmPassword";

	// Messages
	public static final String SUCCESS_REGISTER_MESSAGE = "Registration Successful!";
	public static final String REGISTER_ERROR_MESSAGE = "Please review and correct the provided information.";
	public static final String USERNAME_ERROR_MESSAGE = "Username already exists. Please choose a different one.";
	public static final String EMAIL_ERROR_MESSAGE = "Email is already registered. Please use a different email address.";
	public static final String PASSWORD_ERROR_MESSAGE = "Password must meet the required criteria. Please choose a stronger password.";
	public static final String PHONE_ERROR_MESSAGE = "PHONE NUMBER INCORRECT OR ALREDY REGISTERD";
	public static final String PASSWORD_UNMATCHED_ERROR_MESSAGE = "Passwords do not match. Please make sure they match!";
	public static final String SERVER_ERROR_MESSAGE = "An unexpected server error has occurred.";
	public static final String SQL_ERROR_MESSAGE = "An unexpected server error has occurred.";
	public static final String SUCCESS_MESSAGE = "Success";
	public static final String ERROR_MESSAGE = "Error";
	// Login Page Messages
	public static final String MESSAGE_SUCCESS_LOGIN = "Successfully LoggedIn!";
	public static final String MESSAGE_ERROR_LOGIN = "Either username or password is not correct!";
	public static final String MESSAGE_ERROR_CREATE_ACCOUNT = "Account for this username is not registered! Please create a new account.";

	// Other Messages
	public static final String MESSAGE_SUCCESS_DELETE = "Successfully Deleted!";
	public static final String MESSAGE_ERROR_DELETE = "Cannot delete the user!";

	// Servlet Routes
	public static final String REGISTER_SERVLET = "/RegisterServlet";
	public static final String LOGIN_SERVLET = "/LoginServlet";
	public static final String LOGOUT_SERVLET = "/logoutServlet";
	public static final String MODIFY_SERVLET = "/ModifyServlet";
	public static final String HOME_SERVLET = "/HomeServlet";
	public static final String EDIT_SERVLET = "/EditServlet";


	// servlet routes

	// Start: JSP Route
	// JSP Routes
	public static final String LOGIN_PAGE = "/pages/login.jsp";
	public static final String REGISTER_PAGE = "/pages/register.jsp";  
	public static final String HOME_PAGE = "/pages/home.jsp";
	public static final String ADMIN_PAGE = "/pages/admin.jsp";
	public static final String PRODUCT_PAGE = "/pages/product.jsp";
	public static final String PROFILE_PAGE = "/pages/profile.jsp";
	public static final String ABOUTUS_PAGE = "/pages/aboutus.jsp";




	public static final String URL_LOGIN = "/login.jsp";
	public static final String URL_HOME = "/home.jsp";
	// End: JSP Route
	// End: JSP Route
	// Start: Normal Text
	public static final String USER = "user";
	public static final String SUCCESS = "success";
	public static final String TRUE = "true";
	public static final String JSESSIONID = "JSESSIONID";
	public static final String LOGIN = "Login";
	public static final String LOGOUT = "Logout";
	public static final String REGISTER = "Logout";
	public static final String PRODUCT_MODEL = "ProductModel";
	public static final String PRODUCT_LIST = "ProductList";
	public static final String SLASH= "/";
	public static final String DELETE_ID= "deleteId";
	public static final String UPDATE_ID= "updateId";

	// End: Normal Text

}
