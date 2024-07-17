<%@page import="com.mysql.cj.xdevapi.DbDoc"%>
<%@page import="controller.database.DatabaseController"%>
<%@page import="model.ProductModel"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/stylesheets/product.css" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<jsp:include page="header.jsp" />

	<%
	DatabaseController dbController = new DatabaseController(); // Use 'new' keyword to create an instance
	String username = (String) session.getAttribute(StringUtils.USERNAME); // Retrieve username from session
	String fullName = dbController.getUserFullNameByUsername(username); // Use 'dbController' to call the method
	ArrayList<ProductModel> products = dbController.getAllProducts();
	%>

	<c:set var="products" value="<%=products%>" />



	<h2>
		Welcome to our Product Page,
		<%=fullName%>
		!&#x1F60A;
	</h2>

	<c:if test="${empty products}">
		<p>not found</p>
	</c:if>

	<main>
		<!-- stating of the product page -->
		<div class="WholeCamera">
			<div class="left">
				<div class="applyFilter">
					<a href="<%=contextPath%>/pages/home.jsp" class="disabledbutton">Go
						back to Home</a>
				</div>

				<div class="small1">
					<p class="h8">All Home Appliance</p>
					<span>&#187;</span>
				</div>

				<div class="small1">
					<p class="h8">Price</p>
					<span>&#187;</span>
				</div>

				<div class="small1">
					<p class="h8">Kitchen</p>
					<span>&#187;</span>
				</div>

				<div class="small1">
					<p class="h8">Refrigerator</p>
					<span>&#187;</span>
				</div>

				<div class="small1">
					<p class="h8">Electric cooktop</p>
					<span>&#187;</span>
				</div>

				<div class="small1">
					<p class="h8">Printer</p>
					<span>&#187;</span>
				</div>

				<div class="small1">
					<p class="h8">AI laundry combo</p>
					<span>&#187;</span>
				</div>

				<div class="small1">
					<p class="h8">Rating</p>
					<span>&#187;</span>
				</div>

				<div class="small1">
					<p class="h8">Compact</p>
					<span>&#187;</span>
				</div>
			</div>

		</div>
		<!-- starting of the product section category -->
		<!-- 1 -->
		<div class="right">
			<div class="cameras">
				<div class="checkbox">
					<input type="checkbox" name="" id="check">
					<p class="add">Add to Compare</p>
				</div>
				<a href="#"> <img
					src="<%=contextPath%>/assets/IMAGE/appliance/Electric Cooktop, 30 Inch Built-in Electric Stove, 6800W Ceramic Cooktop, 9 Heating Level Overheat Protection with Touch Screen, Timer & Safety Lock.webp"
					alt="" height="220" width="220">
				</a>


				<div class="heading">
					<p class="hchild">In Stock</p>
					<p>Grihaa provides best quality products..</p>
					<p class="model">Model : MFR #1585</p>
				</div>

				<div class="delevery">
					<p class="del">Est.Delevery May 24</p>
				</div>

				<div class="money">
					<h3>$2496</h3> 
				</div>


				<div class="button">
					<button>Add to card</button>
				</div>
			</div>

			<!-- 2 -->
			<div class="cameras">

				<div class="checkbox">
					<input type="checkbox" name="" id="check">
					<p class="add">Add to Compare</p>
				</div>

				<a href="<%=contextPath%>/pages/productdesc.jsp"> <img
					src="<%=contextPath%>/assets/IMAGE/printer/PIXMA TR7820.webp"
					alt="" height="220" width="220">
				</a>

				<div class="heading">
					<p class="hchild pricered">Out of stock</p>
					<p>Grihaa provides best quality products..</p>
					<p class="model">Model : MFR #1483C002</p>
				</div>

				<div class="delevery">
					<p class="del">Est.Delevery May 24</p>
				</div>

				<div class="money pricered">
					<h3>$2321</h3>
				</div>

				<div class=" email">
					<button>Email me when avaliable</button>

				</div>
			</div>

			<!-- 3 -->
			<div class="cameras">
				<div class="checkbox">
					<input type="checkbox" name="" id="check">
					<p class="add">Add to Compare</p>
				</div>
				<a href=""> <img
					src="<%=contextPath%>/assets/IMAGE/appliance/Thor Kitchen 30 in..jpeg"
					alt="" height="220" width="220">
				</a>
				<div class="heading">
					<p class="hchild">In Stock</p>
					<p>Grihaa provides best quality products..</p>
					<p class="model">Model : MFR #1581</p>
				</div>

				<div class="delevery">
					<p class="del">Est.Delevery May 24</p>
				</div>

				<div class="money">
					<h3>$2000</h3>
				</div>


				<div class="button">
					<button>Add to card</button>
				</div>
			</div>
			<!-- 4 -->
			<div class="cameras">
				<div class="checkbox">
					<input type="checkbox" name="" id="check">
					<p class="add">Add to Compare</p>
				</div>
				<a href="./digital.html"> <img
					src="<%=contextPath%>/assets/IMAGE/1.jpg" alt="" height="220"
					width="220">
				</a>
				<div class="heading">
					<p class="hchild">In Stock</p>
					<p>Grihaa provides best quality products..</p>
					<p class="model">Model : MFR #1581</p>
				</div>

				<div class="delevery">
					<p class="del">Est.Delevery May 24</p>
				</div>

				<div class="money">
					<h3>$2000</h3>
				</div>


				<div class="button">
					<button>Add to card</button>
				</div>
			</div>
			<!-- 5 -->
			<div class="cameras">
				<div class="checkbox">
					<input type="checkbox" name="" id="check">
					<p class="add">Add to Compare</p>
				</div>
				<a href=""> <img
					src="<%=contextPath%>/assets/IMAGE/appliance/Samsung - Bespoke AI Laundry.jpg"
					alt="" height="220" width="220">
				</a>
				<div class="heading">
					<p class="hchild">In Stock</p>
					<p>Grihaa provides best quality products..</p>
					<p class="model">Model : MFR #1581</p>
				</div>

				<div class="delevery">
					<p class="del">Est.Delevery May 24</p>
				</div>

				<div class="money">
					<h3>$2000</h3>
				</div>


				<div class="button">
					<button>Add to card</button>
				</div>
			</div>
			<!-- 6 -->
			<div class="cameras">
				<div class="checkbox">
					<input type="checkbox" name="" id="check">
					<p class="add">Add to Compare</p>
				</div>
				<a href="./MAXIFY-GX7021.html"> <img
					src="<%=contextPath%>/assets/IMAGE/printer/MAXIFY GX7021(P).webp"
					alt="" height="220" width="220">
				</a>
				<div class="heading">
					<p class="hchild">In Stock</p>
					<p>Grihaa provides best quality products..</p>
					<p class="model">Model : MFR #1581</p>
				</div>

				<div class="delevery">
					<p class="del">Est.Delevery May 24</p>
				</div>

				<div class="money">
					<h3>$2000</h3>
				</div>


				<div class="button">
					<button>Add to card</button>
				</div>
			</div>


			<!-- 7 -->
			<div class="cameras">
				<div class="checkbox">
					<input type="checkbox" name="" id="check">
					<p class="add">Add to Compare</p>
				</div>
				<a href="./color-mfg56cdw.html"> <img
					src="<%=contextPath%>/assets/IMAGE/printer/Color imageCLASS MF656Cdw.webp"
					alt="" height="220" width="220">
				</a>


				<div class="heading">
					<p class="hchild">In Stock</p>
					<p>Grihaa provides best quality products..</p>
					<p class="model">Model : MFR #RK0101</p>
				</div>

				<div class="delevery">
					<p class="del">Est.Delevery May 24</p>
				</div>

				<div class="money">
					<h3>$49</h3>
				</div>


				<div class="button">
					<button>Add to card</button>
				</div>
			</div>

			<!-- 8 -->
			<div class="cameras">
				<div class="checkbox">
					<input type="checkbox" name="" id="check">
					<p class="add">Add to Compare</p>
				</div>
				<img src="<%=contextPath%>/assets/IMAGE/microphone.png" alt=""
					height="220" width="220">

				<div class="heading">
					<p class="hchild pricered">Out of stock</p>
					<p>Grihaa provides best quality products..</p>
					<p class="model">Model : LLCE-396</p>
				</div>

				<div class="delevery">
					<p class="del">Est.Delevery May 24</p>
				</div>

				<div class="money pricered">
					<h3>$232</h3>
				</div>
				<div class=" email">
					<button>Email me when avaliable</button>

				</div>
			</div>


			<!-- 9 -->
			<div class="cameras">
				<div class="checkbox">
					<input type="checkbox" name="" id="check">
					<p class="add">Add to Compare</p>
				</div>
				<a href="./GI-26-Pigment-Magenta-Ink-Bottle.html"> <img
					src="<%=contextPath%>/assets/IMAGE/printer/GI-26 Pigment Magenta Ink Bottle.webp"
					alt="" height="220" width="220">
				</a>


				<div class="heading">
					<p class="hchild">In Stock</p>
					<p>Grihaa provides best quality products..</p>
					<p class="model">Model : EGE-3970</p>
				</div>

				<div class="delevery">
					<p class="del">Est.Delevery May 24</p>
				</div>

				<div class="money">
					<h3>$290</h3>
				</div>


				<div class="button">
					<button>Add to card</button>
				</div>
			</div>


			<!-- 9 -->
			<div class="cameras">
				<div class="checkbox">
					<input type="checkbox" name="" id="check">
					<p class="add">Add to Compare</p>
				</div>
				<a href=""> <img
					src="<%=contextPath%>/assets/IMAGE/printer/MC-G03 Maintenance Cartridge.webp"
					alt="" height="220" width="220">
				</a>


				<div class="heading">
					<p class="hchild">In Stock</p>
					<p>Grihaa provides best quality products..</p>
					<p class="model">Model : LLE-67844</p>
				</div>

				<div class="delevery">
					<p class="del">Est.Delevery May 24</p>
				</div>

				<div class="money">
					<h3>$920</h3>
				</div>


				<div class="button">
					<button>Add to card</button>
				</div>
			</div>
			<!-- end of product  -->

			<c:forEach items="${products}" var="product">
				<div class="cameras">
					<div class="checkbox">
						<input type="checkbox" name="" id="check">
						<p class="add">Add to Compare</p>
					</div>
					<a href=""> <img src='${product.getImageURLFromPart()}' alt=""
						height="220" width="220">
					</a>



					<div class="heading">
						<p class="hchild">In Stock</p>
						<p>${product.getName()}</p>
						<p class="model">Model : LLE-67844</p>
					</div>

					<div class="delevery">
						<p class="del">Est.Delevery May 24</p>
					</div>

					<div class="money">
						<h3>${product.getPrice()}</h3>
					</div>


					<div class="button">
						<button>Add to card</button>
					</div>
				</div>
			</c:forEach>

		</div>
	</main>

	<script>
		function confirmDelete(userName) {
			if (confirm("Are you sure you want to delete this user: "
					+ userName + "?")) {
				document.getElementById("deleteForm-" + userName).submit();
			}
		}
	</script>
</body>
</html>