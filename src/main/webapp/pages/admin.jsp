<%@ page import="util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- Welcome message with admin name --%>
<%
Object adminNameObject = session.getAttribute("userRole");
%>
<!DOCTYPE html>
<html>

<head>
<title>Admin Portal</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/stylesheets/admin.css">
</head>

<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>


	<sql:setDataSource var="dbconnection" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/home_appliance" user="root"
		password="" />

	<sql:query var="users" dataSource="${dbconnection }">
    SELECT id, full_name, user_name, birthday, email, phone, gender, role FROM users WHERE role = "regular"
</sql:query>

	<sql:query var="usersType" dataSource="${dbconnection }">
    SELECT role FROM users WHERE user_name = '${adminNameObject }'
</sql:query>

	<sql:query var="search" dataSource="${dbconnection }">
    SELECT full_name, user_name FROM users WHERE user_name LIKE "%P%"
</sql:query>


	<sql:query var="products" dataSource="${dbconnection }">
    SELECT id, name, price, description, image From products
</sql:query>

	<div class="container">
		<%-- Welcome message with admin name --%>
		<p>
			Welcome,
			<%=adminNameObject%>
		</p>
		<main>
			<h2>Users</h2>
			<table class="users-table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Full Name</th>
						<th>Username</th>
						<th>Birthday</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Gender</th>
						<th>Role</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${users.rows}">
						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.full_Name}" /></td>
							<td><c:out value="${user.user_name}" /></td>
							<td><c:out value="${user.birthday}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.phone}" /></td>
							<td><c:out value="${user.gender}" /></td>
							<td><c:out value="${user.role}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<h2>Products</h2>
			<!-- Add Product Form -->
			<form class="add-product-form"
				action="${pageContext.request.contextPath}/ModifyServlet"
				method="post" enctype="multipart/form-data">
				Name: <input type="text" name="name" required="required">
				Description: <input type="text" name="description" required="required"> Price: <input
					type="text" name="price" required="required"> Image: <input type="file"
					name="image">
				<!-- This input field allows file uploads -->
				<input type="submit" value="Add Product">
			</form>
			<!-- Display Products -->
			<table class="products-table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Description</th>
						<th>Price</th>
						<th>Image</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${products.rows}">
						<tr>
							<td><c:out value="${product.id}" /></td>
							<td><c:out value="${product.name}" /></td>
							<td><c:out value="${product.description}" /></td>
							<td><c:out value="${product.price}" /></td>
							<td><img src="${product.image}" alt="Product Image"></td>
							<td class="action-buttons">
								<!-- Edit button -->
								<form action="${pageContext.request.contextPath}/ActionServlet"
									method="post" enctype="multipart/form-data">
									<input type="hidden" name="updateId" value="${product.id}">
									<button type="submit">Edit</button>
								</form> <!-- Delete button -->
								<form action="${pageContext.request.contextPath}/ActionServlet"
									method="post">
									<input type="hidden" name="deleteId" value="${product.id}">
									<button type="submit">Delete</button>
								</form>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>




			<h2>Orders</h2>
			<table class="orders-table">
				<thead>
					<tr>
						<th>ID</th>
						<th>User ID</th>
						<th>State</th>
						<th>Shipping Address</th>
						<th>Additional Address</th>
						<th>Unit Price</th>
						<th>Total Price</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orderList}">
						<tr>
							<td><c:out value="${order.id}" /></td>
							<td><c:out value="${order.userId}" /></td>
							<td><c:out value="${order.state}" /></td>
							<td><c:out value="${order.shippingAddress}" /></td>
							<td><c:out value="${order.additionalAddress}" /></td>
							<td><c:out value="${order.unitPrice}" /></td>
							<td><c:out value="${order.totalPrice}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</main>
	</div>
	<script type="${pageContext.request.contextPath}/js/admin.js"></script>
</body>

</html>

