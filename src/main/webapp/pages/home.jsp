<%@page import="controller.database.DatabaseController"%>

<%@ page import="util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/stylesheets/description.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/stylesheets/category.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style type="text/css">
.message-container {
	background-color: #f8d7da; /* Red background color */
	color: #721c24; /* Dark text color */
	padding: 10px; /* Add some padding around the message */
	border: 1px solid #f5c6cb; /* Add a border */
	border-radius: 5px; /* Add rounded corners */
	margin-bottom: 20px; /* Add some space below the message */
}

.message-container p {
	margin: 0; /* Remove default margin for paragraphs */
}

/* Style for the login link */
.message-container a {
	color: #721c24; /* Dark text color */
	font-weight: bold; /* Make the text bold */
	text-decoration: underline; /* Add underline effect */
}
</style>

</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	String userSession = (String) session.getAttribute(StringUtils.USERNAME);
	String cookieUsername = null;
	String cookieSessionID = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(StringUtils.USER))
		cookieUsername = cookie.getValue();
			if (cookie.getName().equals(StringUtils.JSESSIONID))
		cookieSessionID = cookie.getValue();
		}
	}

	DatabaseController dbController = new DatabaseController(); // Use 'new' keyword to create an instance
	String fullName = null; // Initialize fullName variable

	if (userSession != null) { // Check if user is logged in using session
		String username = (String) session.getAttribute(StringUtils.USERNAME); // Retrieve username from session
		fullName = dbController.getUserFullNameByUsername(username); // Get full name from the database
	} else if (cookieUsername != null) { // Check if user is logged in using cookie
		fullName = dbController.getUserFullNameByUsername(cookieUsername); // Get full name from the database
	}
	%>


	<div class="message-container">
	
		<%
		if (fullName != null) { // Check if full name is retrieved successfully
			out.println("Welcome to our Home Page, " + fullName + "! &#x1F60A;"); // Display the full name
		} else {
			out.println("Welcome to our Home Page! Please <a href='" + request.getContextPath()
			+ "/pages/login.jsp'>log in</a> to get the best product! &#x1F60A;"); // Display a default welcome message with login link
		}
		%>

	</div>

	<!--shop by category section-->
	<div class="feturedcatagories">
		<div class="catagoriesheader">
			<h2>Shop by category</h2>
		</div>
		<br>
		<div class="featured-items">

			<div class="item">
				<div class="border">
					<div class="itemimage">
						<a href="<%=contextPath%>/pages/product.jsp"> <img
							src="<%=contextPath%>/assets/IMAGE/1.jpg" alt="">
						</a>
					</div>
					<div class="itemname">
						<h3>Digital camera</h3>
						<span class="itemarrow">&#8594;</span>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="border">
					<div class="itemimage">
						<a href="<%=contextPath%>/pages/product.jsp"> <img
							src="<%=contextPath%>/assets/IMAGE/appliance/Electric Cooktop, 30 Inch Built-in Electric Stove, 6800W Ceramic Cooktop, 9 Heating Level Overheat Protection with Touch Screen, Timer & Safety Lock.webp">
							alt="">
						</a>
					</div>
					<div class="itemname">
						<h3>Cook Top</h3>
						<span class="itemarrow">&#8594;</span>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="border">
					<div class="itemimage">
						<a href="<%=contextPath%>/pages/product.jsp"> <img
							src="<%=contextPath%>/assets/IMAGE/printer/Color imageCLASS MF656Cdw.webp"
							alt="Printer Image">
						</a>

					</div>
					<div class="itemname">
						<h3>Printer</h3>
						<span class="itemarrow">&#8594;</span>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="border">
					<div class="itemimage">
						<a href="<%=contextPath%>/pages/product.jsp"> <img
							src="<%=contextPath%>/assets/IMAGE/appliance/Hoshizaki DCM-500BAH Ice maker and water dispenser.jpeg"
							alt="">
						</a>
					</div>
					<div class="itemname">
						<h3>Ice Maker</h3>
						<span class="itemarrow">&#8594;</span>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="border">
					<div class="itemimage">
						<a href="<%=contextPath%>/pages/product.jsp"> <img
							src="<%=contextPath%>/assets/IMAGE/printer/HP-OfficeJet Pro 9050e.jpg"
							alt="">
						</a>
					</div>
					<div class="itemname">
						<h3>Best seller</h3>
						<span class="itemarrow">&#8594;</span>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="border">
					<div class="itemimage">
						<a href="<%=contextPath%>/pages/product.jsp"> <img
							src="<%=contextPath%>/assets/IMAGE/printer/GI-26 Pigment Magenta Ink Bottle.webp"
							alt=" image">
						</a>
					</div>
					<div class="itemname">
						<h3>Acessories</h3>
						<span class="itemarrow">&#8594;</span>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="border">
					<div class="itemimage">
						<a href="<%=contextPath%>/pages/product.jsp"> <img
							src="<%=contextPath%>/assets/IMAGE/appliance/Samsung - Bespoke AI Laundry.jpg"
							alt="image laundry">
						</a>
					</div>
					<div class="itemname">
						<h3>Laundry Combo</h3>
						<span class="itemarrow">&#8594;</span>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="border">
					<div class="itemimage">
						<a href="<%=contextPath%>/pages/product.jsp"> <img
							src="<%=contextPath%>/assets/IMAGE/appliance/water_purifier.jpg"
							alt="image laundry">
						</a>
					</div>
					<div class="itemname">
						<h3>Water Purifier</h3>
						<span class="itemarrow">&#8594;</span>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="border">
					<div class="itemimage">
						<a href="<%=contextPath%>/pages/product.jsp"> <img
							src="<%=contextPath%>/assets/IMAGE/appliance/oven.jpg"
							alt="image laundry">
						</a>
					</div>
					<div class="itemname">
						<h3>Laundry Combo</h3>
						<span class="itemarrow">&#8594;</span>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="border">
					<div class="itemimage">
						<a href="<%=contextPath%>/pages/product.jsp"> <img
							src="<%=contextPath%>/assets/IMAGE/appliance/Thor Kitchen 30 in..jpeg"
							alt="">
						</a>
					</div>
					<div class="itemname">
						<h3>Thor Kitcher</h3>
						<span class="itemarrow">&#8594;</span>
					</div>
				</div>
			</div>

		</div>
	</div>
	<br>
	<div class="descContainer">
		<!-- container for description -->
		<div class="descSection">
			<div class="descSection-content">
				<h2>Description</h2>
				<p>
					1. Home Page:<br> Welcome to our Home Appliance Store! Explore
					a wide range of top-quality home appliances including printers,
					cameras, refrigerators, cooktops, and more. Stay updated with the
					latest technology and trends in home appliances. Start your journey
					to upgrading your home with reliable and efficient appliances that
					suit your needs.
				</p>

				<p>
					2. Blog Page:<br> Dive into our Blog page where we discuss the
					positive and negative impacts of technology on our daily lives and
					in businesses, particularly focusing on how technological
					advancements affect the home appliance industry. Stay informed with
					expert tips, exciting news, and how advancements in home appliances
					are enhancing everyday living.
				</p>

				<p>
					3. Product Page:<br> Discover our diverse selection of home
					appliances on the Product page. Explore various brands and new
					technologies. Each product is detailed with specifications
					including name, price, discounted price, and actual price. Find the
					perfect appliance to elevate your home living experience and unlock
					your full potential.
				</p>

				<p>
					4. Research Section:<br> In our Research section, we compare
					our website with other industry-leading websites (at least 5
					references) showcasing features and functionalities. We've learned
					from the best while designing our website, ensuring an excellent
					user experience tailored to your appliance shopping needs.
				</p>

				<p>
					5. About Us:<br> Get to know our team members through the
					About Us section where detailed portfolios showcase our technical
					expertise, educational background, volunteering experiences,
					certifications, and more. Learn about how we strive to provide
					outstanding customer service and enhance your appliance shopping
					experience.
				</p>

				<p>
					6. Profile Page:<br> Visit your Profile page to view your
					account details, order history, and manage your cart. Add
					appliances to your cart for a seamless shopping experience. Connect
					with our dedicated customer support team through the provided
					functional feedback form for any inquiries or assistance.
				</p>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />





</body>

</html>
