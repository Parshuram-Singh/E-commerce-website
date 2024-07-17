<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Product</title>

<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&amp;display=swap")
	;
/* Global Styles */
body {
	font-family: "Poppins", sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

/* Container Styles */
.container {
	max-width: 500px;
	margin: 50px auto;
	padding: 30px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.container h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #333;
}

/* Form Styles */
.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"], input[type="file"], textarea {
	width: calc(100% - 22px);
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

textarea {
	height: 100px;
}

/* Button Styles */
button[type="button"], input[type="submit"] {
	background-color: pink;
	color: white;
	padding: 10px 20px;
	border: 1px solid black; /* Add black border */
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button[type="button"]:hover, input[type="submit"]:hover {
	background-color: #ff69b4; /* Lighter pink on hover */
}

/* Go Back Button Styles */
button[type="button"] {
	background-color: #ff69b4;
}

button[type="button"]:hover {
	background-color: #ff69b4; /* Lighter pink on hover */
}
</style>
</head>
<body>
	<%
	String contextPath = request.getContextPath();
	%>
	<div class="container">
		<h2>Edit Product</h2>
		<form action="<%=contextPath %>/EditServlet" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="userProductId">Product ID:</label> <input type="text"
					id="userProductId" name="productId"
					value="<%=request.getParameter("productId")%>">
				<!-- Disable input field -->
			</div>
			<div class="form-group">
				<label for="name">Name:</label> <input type="text" id="name"
					name="name">
			</div>
			<div class="form-group">
				<label for="description">Price:</label>
				<input type="text" id="description" name="price"></input>
			</div>
			<div class="form-group">
				<label for="description">Description:</label>
				<textarea id="description" name="description"></textarea>
			</div>
			<div class="form-group">
				<label for="image">Image:</label> <input type="file" id="image"
					name="image">
			</div>
			<button type="button" onclick="goBack()">Go Back</button>
			<input type="submit" value="Save">
		</form>
	</div>
	<script>
		function goBack() {
			window.history.back();
		}
	</script>
</body>
</html>
