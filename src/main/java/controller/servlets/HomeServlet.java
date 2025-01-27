package controller.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.database.DatabaseController;
import model.ProductModel;
import util.StringUtils;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.HOME_SERVLET })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController controller = new DatabaseController();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ProductModel> students = controller.getAllProducts();
		request.setAttribute(StringUtils.PRODUCT_LIST, students);
		request.getRequestDispatcher(StringUtils.URL_HOME).forward(request, response);
	}
}