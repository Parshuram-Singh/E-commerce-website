<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Document</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/header.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>

<body>
	<div class="menuBar">
		<ul>
			<li><a href="" class="brand"><span>Grihaa</span></a></li>
			<li><a href="" class="border">Shop By Brand</a></li>
			<li><a href="" class="border">Sell with Us</a></li>
			<li><a href="" class="border">Featured Appliances</a></li>
			<li><a href="" class="border">Kitchen Appliances</a></li>
			<li><a href="" class="border">Laundry Appliances</a></li>
			<li><a href="" class="border">Deals & Steals</a></li>
			<li><a href="" class="border">New Arrivals</a></li>
			<li><a href="" class="border">Help & Support</a></li>
			<li><a href="" class="border"> <span>Financing
						Options</span></a></li>
			<li><a href="" class="border">Appliance Guides</a></li>
			<li><a href="" class="border">Gift Cards</a></li>
		</ul>

		<%-- Check if the user is logged in and is an admin, then show the admin panel link --%>
		<%
		if (currentUser != null && userType != null && userType.equals("admin")) {
		%>
		<ul>
			<li><a style="color: red;"
				href="<%=contextPath + StringUtils.ADMIN_PAGE%>" class="border">Admin
					Panel</a></li>
		</ul>
		<%
		}
		%>

		<div class="location">
			<i class="fa-solid fa-location-dot"></i>
			<p>Select a location to see product availabilty</p>
			<i class="fa-solid fa-angle-down"></i>
		</div>
	</div>

	<div class="quickLink">
		<h2>Shop by Appliance</h2>
		<ul>
			<li><a href="">Refrigerators</a></li>
			<li><a href="">Freezers</a></li>
			<li><a href="">Washers &amp; Dryers</a></li>
			<li><a href="">Dishwashers</a></li>
			<li><a href="">Ovens &amp; Ranges</a></li>
			<li><a href="">Microwaves</a></li>
			<li><a href="">Vacuum Cleaners</a></li>
			<li><a href="">Air Purifiers</a></li>
			<li><a href="">More Appliances</a></li>
		</ul>
	</div>

</body>

</html>
