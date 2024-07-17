<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Meet the Crew!</title>
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/stylesheets/aboutus.css" />
</head>
<body>
<jsp:include page="navbar.jsp" />
	<jsp:include page="header.jsp" />
	<h1>About our Team members</h1>
	<section class="dashboard">
		<article class="card">
			<h1>Pratik Singh Rathour</h1>
			<img src="<%=contextPath%>/assets/IMAGE/profile/Pratik singh rathour.jpg" alt="Team-member-1">
			<h2>Web Developer & Software Engineer</h2>
			<p>Crafts websites, loves AI, and wrangles Linux.</p>
		</article>
		<article class="card">
			<h1>Sujal Khadka</h1>
			<img src="<%=contextPath%>/assets/IMAGE/profile/Sujal Khadka.jpg" alt="Team-member-1">
			<h2>Tech & Sports Enthusiast</h2>
			<p>Plays sports, conquers games, and builds websites (IT whiz).</p>
		</article>
		<article class="card">
			<h1>Nitish Kumar Yadav</h1>
			<img src="<%=contextPath%>/assets/IMAGE/profile/Nitish kumar yadav.jpg" alt="Team-member-1">
			<h2>Data Analyst & Web Developer</h2>
			<p>Analyzes data with AI and builds websites.</p>
		</article>
		<article class="card">
			<h1>Dijan Karki</h1>
			<img src="<%=contextPath%>/assets/IMAGE/profile/Dijan karki.jpg" alt="Team-member-1">
			<h2>IT Student & Multi-Talent</h2>
			<p>Studies IT, enjoys singing, and excels at sports.</p>
		</article>
	</section>
</body>
</html>
