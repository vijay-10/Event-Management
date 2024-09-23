<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Home</title>
<style>
body {
	background-color: lightgrey;
}

h1 {
	text-align: center;
	font-family: POPPINS;
	FONT-SIZE: 50PX;
	color: orange;
	animation: topSideviji 2s ease forwards;
	animation-delay: 1s;
}

@
keyframes topSideviji { 0% {
	transform: translateY(-200px);
	opacity: 0;
}

100%{transform:translateY(0);
     opacity:1;
    }
}
#one {
	margin-left: -70px;
}

.carousel-item img {
	height: 400px;
	width: 100%;
	object-fit: cover;
}

#services {
	align-items: center;
	color: firebrick;
	font-weight: bolder;
	font-size: 30px;
	font-family: 'sans-serif';
	animation: leftSideviji 2s ease forwards;
}

@
keyframes leftSideviji { 0% {
	transform: translateX(-100px);
	opacity: 0;
}

100%{transform:translateX(0);
     opacity:1;
    }
}
#four {
	display: inline-flex;
	justify-content: space-evenly;
	padding-left: 100px;
}

#four .card {
	margin: 35px;
}

.card-title {
	text-align: center;
	font-family: 'sans-serif';
}

.card {
	background-color: lightgold;
	border-radius: 10px;
}

.card:hover {
	transform: scale(1.05);
	background-color: #daf4ff;
	box-shadow: 0 0 20px goldenrod;
	transition: all .3s ease-in-out;
}

.d-block1 {
	background-position: bottom;
}

.card-title a {
	text-decoration: none;
	color: limegreen;
	font-weight: bold;
}

.card-title a:hover {
	color: darkred;
}

.card-text a {
	text-decoration: none;
	color: inherit;
}

.row {
	background-color: gold;
	height: 120px;
	border-radius: 10px;
	box-shadow: 0 0 20px goldenrod;
}

.col-sm-8 {
	display: inline-flex;
	padding-top: 60px;
	font-family: 'sans-serif';
	padding-left: 200px;
}

#slogon {
	text-align: center;
	padding-top: 30px;
}

#slogan1 {
	padding-left: 250px;
}

hr {
	border: 2px black;
}

</style>
</head>
<body>
	<%@include file="Header.jsp"%>
	<hr>
	<div class="compname">
		<h1>CREATIVE MOMENTS</h1>
	</div>
	<nav>
		<div id="carouselExampleSlidesOnly"
			class="carousel slide carousel-fade" data-bs-ride="carousel"
			data-bs-interval="500">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block" src="slide1.jpg" alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block1" src="slide2.jpg" alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block1" src="slide3.jpg" alt="Third slide">
				</div>
				<div class="carousel-item">
					<img class="d-block" src="slide4.jpg" alt="Fourth slide">
				</div>
				<div class="carousel-item">
					<img class="d-block" src="slide5.jpg" alt="Fourth slide">
				</div>
			</div>
		</div>
	</nav>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<br>
	<center>
		<h4 id="services">
			<b><u>OUR SERVICES</u></b>
	</center>
	<div class="container mt-3">
		<div id="four">
			<div class="card" style="width: 300px">
				<div class="card-body">

					<img src="card1.jpg" height="150px" width="250px">
					<center>
						<p class="card-text">Our events include Stage decor,Candle
							decor,Lighting,Entrance decor,Tablecloths and Runners,Fairy
							Lights</p>
					</center>
					<br> <br>
					<h5 class="card-title">
						<a href="Wedding.jsp">WEDDING CERAMONY</a>
						</h4>
				</div>
				
				
			</div>
			<div class="card" style="width: 300px">
				<div class="card-body">
					<img src="card2.jpg" height="150px" width="250px">
					<center>
						<p class="card-text">Our events include Table settings,Cake
							table,Banners and streamers, Lights,hats and favors</p>
					</center>
					<br> <br> <br>
					<h5 class="card-title">
						<a href="BIRTHDAY.jsp">BIRTHDAY</a>
					</h5>
				</div>
			</div>
			
			
			<div class="card" style="width: 300px">
				<div class="card-body">
					<img src="card3.jpeg" height="150px" width="250px">
					<center>
						<p class="card-text">
					</center>
					</p>Corporate event decor includes sleek stage setups, LED candles, branded lighting, elegant entrances, neutral table settings, and subtle fairy lights
					<h5 class="card-title">
					<br>
						<a href="Corporate.jsp">CORPORATE</a>
					</h5>
				</div>
			</div>
		</div>
	</div>
	<br>

	<div id=slogan1>
		<div class="container ">
			<div class="jumbotron " style="width: 1000px">
				<div class="row">
					<div class="col-sm-3">
						<img src="logo.jpg" height="120px" width="300px">
					</div>
					
					
					
					
					<div id="slogon" class="col-sm-9 ml-10px rounded">
						<h2>Colorfull Moments ANYTIME.ANYWHERE!</h2>
					</div>
				</div>
			</div>

			

</div>
</div>
			<br>
			<center>
				<a href="Eventcategories.jsp" class="btn btn-primary">BOOK EVENT</a>
		</center>
			<br>
			<%@ include file="Footer.jsp"%>
			
</body>
</html>