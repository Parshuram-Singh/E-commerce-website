<%@page import="util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/register.css">
</head>
<body>
    <div class="container">
        <h1>Sign Up</h1>
        <%-- Display error message if present --%>
        <% String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);
           if (errorMessage != null && !errorMessage.isEmpty()) { %>
            <p class="error-message" style="color: red;"><%= errorMessage %></p>
        <% } %>
        
        <form method="post" action="${pageContext.request.contextPath}/RegisterServlet"> <!-- Specify the action to the processing page -->
            <div class="form-grid">
                <div class="form-group">
                    <label for="firstName">Full Name</label>
                    <input type="text" id="firstName" name="fullName" placeholder="e.g. Pratik Singh">
                </div>
                <div class="form-group">
                    <label for="lastName">User Name</label>
                    <input type="text" id="lastName" name="username" placeholder="e.g. pratik_singh">
                </div>

                <div class="form-group">
                    <label for="birthday">Birthday:</label>
                    <input type="date" id="birthday" name="birthday" required>
                </div>

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="e.g. college_id@college_domain.com">
                </div>

                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" placeholder="+977 XXX XXX XXXX" maxlength="10">
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender">
                        <option value="">Please select</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="others">rather not to say</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="password">New Password</label>
                    <input type="password" id="password" name="password" placeholder="pra13a$sdf@Singh">
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Re-type Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Your Password">
                </div>
            </div>
            <div class="terms">
                <input type="checkbox" id="terms" required="required">
                <label for="terms">Creating an account means you're okay with our <a href="#">Terms and Conditions</a> and
                    our <a href="#">Privacy Policy</a>.</label>
            </div>
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
