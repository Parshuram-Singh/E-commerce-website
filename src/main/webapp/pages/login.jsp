<%@page import="util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/login.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
	<div class="container">
		<div class="image">
			<img src="${pageContext.request.contextPath}/assets/login.png" alt="">
		</div>
		<div class="screen">


			<div class="screen__content">
				<!-- Modify the form tag to use the POST method -->
				<form class="login" method="post"
					action="${pageContext.request.contextPath}/LoginServlet">
					<!-- display error message -->
					<%
					String errorMessage = (String) request.getAttribute("errorMessage");
					if (errorMessage != null && !errorMessage.isEmpty()) {
					%>
					<p style="color: red;" class="error-message"><%=errorMessage%></p>
					<%
					}
					%>
					<div class="login__field">
						<i class="login__icon fas fa-user"></i> <input type="text"
							class="login__input" placeholder="User name / Email"
							name="username">
					</div>
					<div class="login__field">
						<i class="login__icon fas fa-lock"></i> <input type="password"
							class="login__input" placeholder="Password" name="password">
					</div>
					<button class="button login__submit">
						<span class="button__text">Log In Now</span> <i
							class="button__icon fas fa-chevron-right"></i>
					</button>
				</form>
				<div class="social-login">
					<h3>log in via</h3>
					<div class="social-icons">
						<a href="#" class="social-login__icon fab fa-instagram"></a> <a
							href="#" class="social-login__icon fab fa-facebook"></a> <a
							href="#" class="social-login__icon fab fa-twitter"></a>
					</div>
				</div>
				<button class="register" onclick="window.location.href='register.jsp'">Register</button>
			</div>
		</div>
	</div>
</body>
</html>
