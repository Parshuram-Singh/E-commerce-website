<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.StringUtils"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%
// Get the session and request objects
HttpSession userSession = request.getSession();
String currentUser = (String) userSession.getAttribute(StringUtils.USERNAME);
String userType = (String) userSession.getAttribute("userRole"); // Retrieve user role from session
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/navbar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>

<body>
	<div class="container-navbar">
		<div class="navbar">
			<div class="logo">
				<a href="<%=contextPath + StringUtils.HOME_PAGE%>">Grihaa</a>
			</div>

			<div class="search-box">
				<input type="search" class="search-txt" placeholder="search">
				<a class="search-btn" href="#"> <i class="fas fa-search"></i>
				</a>
			</div>

			<nav>
				<ul id="MenuItems">
					<li><a href="<%=contextPath + StringUtils.HOME_PAGE%>">Home</a></li>
					<li><a href="<%=contextPath + StringUtils.PRODUCT_PAGE%>">Products</a></li>
					<li><a href="<%=contextPath + StringUtils.PROFILE_PAGE%>">Profile</a></li>
					<li><a href="<%=contextPath + StringUtils.ABOUTUS_PAGE%>">About
							Us</a></li>
					<li><form
							action="<%// Conditionally set the action URL based on user session
if (currentUser != null) {
	out.print(contextPath + StringUtils.LOGOUT_SERVLET);
} else {
	out.print(contextPath + StringUtils.LOGIN_PAGE);
}%>"
							method="post">
							<input type="submit"
								style="background-color: pink; border: 1px solid Black; width: 5em; height: 2em;"
								value="<%// Conditionally set the button label based on user session
if (currentUser != null) {
	out.print(StringUtils.LOGOUT);
} else {
	out.print(StringUtils.LOGIN);
}%>" />
						</form></li>
				</ul>
			</nav>
			<a href="cart.html"><img src="https://i.ibb.co/PNjjx3y/cart.png"
				alt="" width="30px" height="30px" /></a> <img
				src="https://i.ibb.co/6XbqwjD/menu.png" alt="" class="menu-icon"
				onclick="menutoggle()" />
		</div>
	</div>

	<!-- JavaScript for toggle menu -->
	<script>
		var MenuItems = document.getElementById('MenuItems');
		MenuItems.style.maxHeight = '0px';

		function menutoggle() {
			if (MenuItems.style.maxHeight == '0px') {
				MenuItems.style.maxHeight = '200px';
			} else {
				MenuItems.style.maxHeight = '0px';
			}
		}
	</script>
</body>

</html>