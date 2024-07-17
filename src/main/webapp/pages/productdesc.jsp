<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PIXMA TR7820</title>

<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/stylesheets/details.css" />

</head>

<body>

	<div class="items_that_are_added">
		<div class="cut" onclick="cut_items_div()">*</div>
		<div class="top_title">
			<h2>printer</h2>
		</div>

		<div class="all_added"></div>


	</div>
	<div class="topnav">
		<ul class="profilenav">
			<li class="navlistactive"><a href="#" class="a_nav">Overview</a></li>
			<li class="navlist"><a href="#specification" class="a_nav">Specification</a></li>
			<li class="navlist">Features</li>
			<li class="navlist">Review</li>
			<li class="navlist">Questions</li>
			<li class="navlist">Support</li>
			<li class="navlist">Warranty</li>
			<li class="navlist" onclick="show_items()">Items ADDED</li>
			<button class="mode">Darkmode</button>

		</ul>
	</div>
	<div class="welcomeprinter5">
		<div class="left">
			<img src="<%=contextPath%>/assets/IMAGE/printer/PIXMA TR7820.webp" alt="" height="550"
				width="600">
		</div>

		<!-- right side overview -->
		<div class="right">
			<div class="productname">
				<h2 class="product__name">PIXMA TR7820 Wireless Home All-in-One
					Printer</h2>
				<p>SKU: 6258C002</p>
			</div>
			<div class="pricewishlist">
				<select class="select">
					<option value="">wishlist</option>
					<option value="">2</option>
					<option value="">3</option>
					<option value="">4</option>
					<option value="">5</option>
				</select> <span class="price">Rs 30,700</span>
			</div>
			<div class="estdelivery">
				<span>Est.delivery May 24</span>
			</div>
			<div class="addtocartitem">
				<button onclick="add_to_cart()">
					Add to card <span>&#x1F6D2;</span>
				</button>
			</div>
			<div class="show_hide">
				<div class="one qe">
					<div class="btn">
						<div class="title">About the item</div>
						<div class="go">+</div>
					</div>

					<div class="ans ">
						<ul>
							<li>Wireless 3-in-1 (Print | Copy | Scan)</li>
							<li>15 (BW) / 10 (COLOR) Images Per Minute (ipm)</li>
							<li>100-Sheet Paper Cassette + 100-Sheet Rear Tray</li>
							<li>35-Sheet Auto Document Feeder (ADF)</li>
							<li>Auto 2-sided Printing</li>
							<li>2.7" LCD Touchscreen for easy navigation</li>
							<li>Stable and reliable connection with Dual Band Wi-Fi
								(2.4GHz or 5GHz)</li>
						</ul>

					</div>
				</div>
				<div class="two qe">
					<div class="btn">
						<div class="title">In the Box</div>
						<div class="go">+</div>
					</div>

					<div class="ans ">
						<ul>
							<li>PIXMA TR7820 Wireless Home All-in-One Printer</li>
							<li>Set of Ink Cartridges (PG-285 Black and CL-286 Color
								Cartridges)</li>
							<li>Documentation</li>
							<li>Power Cord</li>
						</ul>
					</div>

				</div>
				<div class="three qe">
					<div class="btn">
						<div class="title">Return Policy</div>
						<div class="go">+</div>
					</div>


					<div class="ans ">
						<p>The Canon Online Store will accept, for return or exchange,
							defective or unopened merchandise purchased at the Canon Online
							Store, subject to the exceptions and timeframe for returns listed
							below: All merchandise returned to the Canon Online Store must be
							in the original packaging with all original items (such as
							manuals, cables, etc.) accompanying the merchandise and a copy of
							the invoice/packing slip included to be eligible for return or
							exchange. Shipping and handling fees from your original order
							will not be refunded, unless the merchandise is determined by the
							Canon Online Store, in its sole discretion, to be defective.</p>
					</div>


				</div>
			</div>
		</div>
	</div>

	<div class="specificationitem" id="specification">
		<br>
		<h3>Specification</h3>
	</div>
	<div class="specificationproduct"></div>
	<!-- specification -->
	<div class="specification">
		<div class="spe">
			<h2>Printer Specifications</h2>

			<div>
				<strong>Print Speed (up to):</strong>
				<p>Black: ESAT Approx. 24.0 ipm, Color: FPOT Color: ESAT Approx.
					15.5 ipm</p>
			</div>

			<div>
				<strong>Number of Nozzles:</strong>
				<p>Color (C/M/Y): 1,024; Pigment Black: 1,280; Total: 4,352</p>
			</div>

			<div>
				<strong>Print Resolution (Up to):</strong>
				<p>Up to 1200 x 600 dpi</p>
			</div>

			<div>
				<strong>Ink Compatibility:</strong>
				<p>INK TYPE GI-26 Pigment-Based Ink Bottles (Cyan, Magenta,
					Yellow, Black)</p>
				<p>INK TANK & FILL VOLUME GI-26 Black Ink Bottles: 167.0 ml;
					GI-26 C, M, Y Ink Bottles: 132.0 ml (each)</p>
			</div>

			<div>
				<strong>Paper Sizes:</strong>
				<p>4"x6", 5"x5" (Square), 5"x7", 7"x10", 8"x10", Letter
					(8.5"x11"), Legal (8.5"x14"), U.S. #10</p>
				<p>Custom Size: Width: 3.5" - 8.5" / Length: 5" - 47"</p>
			</div>

			<div>
				<strong>Paper Compatibility:</strong>
				<p>Plain: Plain Paper, High Resolution Paper;</p>
				<p>Glossy: Photo Paper Plus Glossy II, Photo Paper Glossy;</p>
				<p>Semi-Gloss: Photo Paper Plus Semi-Gloss, Photo Paper Pro
					Luster;</p>
				<p>Matte: Matte Photo Paper, Double-sided Matte Paper;</p>
				<p>Other (Canon): Magnetic Photo Paper, Restickable Photo Paper,
					Light Fabric Iron on Transfers;</p>
				<p>Other (non-Canon): Greeting Card, Envelopes, Recycled paper
					and Chlorine-free paper can be used</p>
			</div>
		</div>
	</div>


	<!-- iframe -->
	<div class="iframe">
		<iframe width="1020" height="500"
			src="https://www.youtube.com/embed/a-JARluZf7w?si=PgX2Wb_UTVTU-Nx3"
			title="YouTube video player" frameborder="50px" allowfullscreen>
		</iframe>
	</div>


	<!-- link js -->
	<script src="<%=contextPath%>/JS/details.js"></script>
	<script src="<%=contextPath%>/JS/addtocard.js"></script>

</body>

</html>