package controller.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import model.LoginModel;
import model.PasswordEncryptionWithAes;
import model.ProductModel;
import model.UserModel;
import util.StringUtils;

/**
 * This class handles database operations. Coded by: Pratik Singh Rathour
 */
public class DatabaseController {
	/**
	 * Establishes a connection to the database using pre-defined credentials and
	 * driver information.
	 * 
	 * @return A `Connection` object representing the established connection to the
	 *         database.
	 * @throws SQLException           if a database access error occurs.
	 * @throws ClassNotFoundException if the JDBC driver class is not found.
	 */

	// Method to establish a database connection
	public Connection establishConnection() throws SQLException, ClassNotFoundException {
		// Load the MySQL JDBC driver
		Class.forName("com.mysql.jdbc.Driver");
		// Database URL, username, and password
		String url = "jdbc:mysql://localhost:3306/home_appliance";
		String user = "root";
		String password = "";
		// Establish and return the connection
		return DriverManager.getConnection(url, user, password);
	}

	/**
	 * This method attempts to register a new user in the database.
	 * 
	 * @param userModel A `UserModel` object containing the user's information.
	 * @return An integer value indicating the registration status: - 1:
	 *         Registration successful - 0: Registration failed (no rows affected) -
	 *         -1: Internal error (e.g., ClassNotFound or SQLException)
	 * @throws SQLException           if a database access error occurs.
	 * @throws ClassNotFoundException if the JDBC driver class is not found.
	 */

	// Method to add a new user to the database
	public int addUser(UserModel userModel) {
		try (Connection connection = establishConnection()) {
			// Check if the username already exists
			PreparedStatement checkusernameStatement = connection.prepareStatement(StringUtils.GET_USERNAME);
			checkusernameStatement.setString(1, userModel.getUserName());
			ResultSet checkUserSet = checkusernameStatement.executeQuery();
			if (checkUserSet.next() && checkUserSet.getInt(1) > 0) {
				return -2; // Username already exists
			}

			// Check if the email already exists
			PreparedStatement checkEmailStatement = connection.prepareStatement(StringUtils.GET_EMAIL);
			checkEmailStatement.setString(1, userModel.getEmail());
			ResultSet checkEmailSet = checkEmailStatement.executeQuery();
			if (checkEmailSet.next() && checkEmailSet.getInt(1) > 0) {
				return -4; // Email already exists
			}

			// Check if the phone number already exists
			PreparedStatement checkPhoneStatement = connection.prepareStatement(StringUtils.GET_PHONE);
			checkPhoneStatement.setString(1, userModel.getPhoneNumber());
			ResultSet checkPhoneSet = checkPhoneStatement.executeQuery();
			if (checkPhoneSet.next() && checkPhoneSet.getInt(1) > 0) {
				return -5; // Phone number already exists
			}

			// Insert new user
			PreparedStatement statement = connection.prepareStatement(StringUtils.INSERT_USER);
			statement.setString(1, userModel.getFullName());
			statement.setString(2, userModel.getUserName());
			statement.setDate(3, Date.valueOf(userModel.getBirthday()));
			statement.setString(4, userModel.getEmail());
			statement.setString(5, userModel.getPhoneNumber());
			statement.setString(6, userModel.getGender());
			statement.setString(7,
					PasswordEncryptionWithAes.encrypt(userModel.getUserName(), userModel.getNewPassword()));

			int result = statement.executeUpdate();

			return result > 0 ? 1 : 0;

		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace(); // Log the exception for debugging
			return -1;
		}
	}

	// Method to authenticate user login
	public int getUserLoginInfo(LoginModel loginModel) {
		try (Connection con = establishConnection()) {
			PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_USER_INFO);
			st.setString(1, loginModel.getUsername());
			ResultSet result = st.executeQuery();

			if (result.next()) {
				String userDb = result.getString(StringUtils.USER_NAME);
				String encryptedPwd = result.getString(StringUtils.PASSWORD);
				// Decrypt the password retrieved from the database
				String decryptedPwd = PasswordEncryptionWithAes.decrypt(encryptedPwd, userDb);
				if (userDb.equals(loginModel.getUsername()) && decryptedPwd.equals(loginModel.getPassword())) {
					return 1; // Successful login
				} else {
					return 0; // Incorrect username or password
				}
			} else {
				return 0; // No matching record found
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace(); // Log the exception for debugging
			return -1;
		}
	}

	// Method to retrieve all users from the database
	public ArrayList<UserModel> getAllUserModels() {
		try (Connection connection = establishConnection()) {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM users");
			ResultSet result = stmt.executeQuery();

			ArrayList<UserModel> users = new ArrayList<>();

			while (result.next()) {
				UserModel user = new UserModel();
				user.setFullName(result.getString("full_name")); // Using getFullName() method
				user.setUserName(result.getString("user_name")); // Using getUserName() method
				user.setBirthday(result.getDate("birthday").toLocalDate()); // Using getBirthday() method
				user.setEmail(result.getString("email"));
				user.setPhoneNumber(result.getString("phone_number")); // Using getPhoneNumber() method
				user.setGender(result.getString("gender"));

				users.add(user);
			}
			return users;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	// Method to retrieve all products from the database
	public ArrayList<ProductModel> getAllProducts() {
		try (Connection connection = establishConnection()) {
			PreparedStatement statement = connection.prepareStatement("SELECT * FROM products");
			ResultSet resultSet = statement.executeQuery();

			ArrayList<ProductModel> products = new ArrayList<>();

			while (resultSet.next()) {
				ProductModel product = new ProductModel();
				product.setName(resultSet.getString("name"));
				product.setPrice(resultSet.getDouble("price"));
				product.setDescription(resultSet.getString("description"));
				product.setImageURLFromPart(resultSet.getString("image"));

				products.add(product);
			}

			return products;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public ArrayList<ProductModel> searchProducts(String searchKeyword) {
		try (Connection connection = establishConnection()) {
			// Prepare the SQL query with a placeholder for the search keyword
			String sql = "SELECT * FROM products WHERE name LIKE ?";
			PreparedStatement statement = connection.prepareStatement(sql);

			statement.setString(1, "%" + searchKeyword + "%");

			// Execute the query
			ResultSet resultSet = statement.executeQuery();

			ArrayList<ProductModel> products = new ArrayList<>();

			while (resultSet.next()) {
				ProductModel product = new ProductModel();
				product.setName(resultSet.getString("name"));
				product.setPrice(resultSet.getDouble("price"));
				product.setDescription(resultSet.getString("description"));
				product.setImageURLFromPart(resultSet.getString("image"));

				products.add(product);
			}

			return products;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public int addProduct(ProductModel product) {
		try (Connection connection = establishConnection()) {
			PreparedStatement statement = connection
					.prepareStatement("INSERT INTO products (name, price, description, image) VALUES (?, ?, ?, ?)");
			statement.setString(1, product.getName());
			statement.setDouble(2, product.getPrice());
			statement.setString(3, product.getDescription());
			statement.setString(4, product.getImageURLFromPart());

			int result = statement.executeUpdate();

			return result > 0 ? 1 : 0;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}

	public int updateProduct(int productId, String name, double price, String description) {
		try (Connection connection = establishConnection()) {
			PreparedStatement statement = connection
					.prepareStatement("UPDATE products SET name = ?, price = ?, description = ? WHERE id = ?");
			statement.setString(1, name);
			statement.setDouble(2, price);
			statement.setString(3, description);
			statement.setInt(4, productId);

			int result = statement.executeUpdate();

			return result > 0 ? 1 : 0;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}

	public int deleteProduct(String deleteId) {
		try (Connection connection = establishConnection()) {
			PreparedStatement statement = connection.prepareStatement("DELETE FROM products WHERE id = ?");
			statement.setString(1, deleteId);

			int result = statement.executeUpdate();

			return result > 0 ? 1 : 0;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1;
		}
	}

	public String getUserFullNameByUsername(String username) {
		try (Connection connection = establishConnection()) {
			PreparedStatement statement = connection
					.prepareStatement("SELECT full_name FROM users WHERE user_name = ?");
			statement.setString(1, username);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				return resultSet.getString("full_name");
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		return null; // Return null if full name is not found or an error occurs
	}

}
