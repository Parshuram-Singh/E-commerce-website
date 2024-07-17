
<%@page import="model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="controller.database.DatabaseController"%>
<%@page import="model.UserModel"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="util.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Account Settings</title>
<link rel="stylesheet" href="<%=contextPath%>/stylesheets/profile.css">
</head>

<body>

	<jsp:include page="navbar.jsp" />
	<jsp:include page="header.jsp" />

	<%
	DatabaseController dbController = new DatabaseController(); // Use 'new' keyword to create an instance
	String username = (String) session.getAttribute(StringUtils.USERNAME); // Retrieve username from session
	String fullName = dbController.getUserFullNameByUsername(username); // Use 'dbController' to call the method
	ArrayList<UserModel> users = dbController.getAllUserModels();
	%>


	<%
	Object adminNameObject = session.getAttribute("userRole");
	%>

	<sql:setDataSource var="dbconnection" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/home_appliance" user="root"
		password="" />

	<c:if test="${empty users}">
		<p>not found</p>
	</c:if>

	<div class="container">
		<div class="sidebar">
			<ul>
				<li><a href="#">My Profile</a></li>
				<li><a href="#">Security</a></li>
				<li><a href="#">Teams</a></li>
				<li><a href="#">Role</a></li>
				<li><a href="#">Notifications</a></li>
				<li><a href="#">Billing</a></li>
				<li><a href="#">Data Export</a></li>
				<li class="danger"><a href="#">Delete Account</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="profile-header">
				<h1>My Profile</h1>
				<p>
					<span><%=fullName%></span> - <span><%=adminNameObject%>!&#x1F60A;</span>
				</p>
			</div>
			<div class="profile-info">

				<div class="profile-picture-container">
					<img id="profilePicture"
						src="https://media.vanityfair.com/photos/64aecd3d4bf5235b00ae4462/master/w_2240,c_limit/zayn-malik.jpg"
						alt="Profile Picture" class="profile-picture"> <br></br>
					<form action="#" method="" enctype="multipart/form-data">
						<input type="file" id="profilePictureInput" accept="image/*"
							style="display: none;">
						<button type="submit">Change Photo</button>
					</form>
					<h1>
						<b></b> <span id="fullName"></span>
					</h1>
					<p>
						<b>Team Manager</b> <span id="role"></span>
					</p>
					<button onclick="editInfo()">Edit</button>
					<br></br>

					<div class="info-container">
						<h2>Personal Information</h2>
						<p>
							<b>Full Name:</b> <span id="fullName"></span>
						</p>
						<p>
							<b>Username:</b> <span id="username"></span>
						</p>
						<p>
							<b>Birthday:</b> <span id="birthday"></span>
						</p>
						<p>
							<b>Email:</b> <span id="email"></span>
						</p>
						<p>
							<b>Phone:</b> <span id="phone"></span>
						</p>
						<p>
							<b>Gender:</b> <span id="gender"></span>
						</p>
						<button onclick="editInfo()">Edit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>