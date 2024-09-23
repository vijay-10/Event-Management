<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login page</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>

<style type="text/css">
body {
	background-image: url('loginbg.png');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

form {
	border-color: #8B9467 padding: 20px;
	border-radius: 10px;
	width: 25%;
	margin: 0 auto;
	margin-top: 50px;
	transition: transform 0.7s ease-in-out;
	background-color: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(3px);
}

form:hover {
	box-shadow: 0 0 20px goldenrod;
	transition: all .3s ease-in-out;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
}

h3 {
	margin-top: 30px;
	text-align: center;
	font-family: unset;
	font-size: 40px;
	fill-opacity: 4px;
	color: #cfcf2d;
}

.parent {
	text-align: center;
}

.parent2 {
	text-align: center;
}

.child1 {
	font-family: monospace;
	color: #c9c39d;
	font-size: 25px;
	font-weight: bolder;
}

.child2 {
	font-family: monospace;
	color: #c9c39d;
	font-size: 20px;
}

input[type="email"], input[type="password"] {
	border: 2px solid #ccc;
	padding: 10px;
	border-radius: 20px;
	width: 70%;
	margin-bottom: 20px;
	font-size: 16px;
}

input[type="email"]:focus, input[type="password"]:focus {
	border-color: #aaa;
	box-shadow: 0 0 10px #aaa;
}

button[type="submit"]:hover {
	background-color: firebrick;
	color: whitesmoke;
	transform: scale(1.1);
}
#msg {
	background: green;
	color: black;
	border: 1px solid red;
	width: 24%;
	font-weight: bold;
	font-size: 25px;
	padding: 5px;
}

</style>

</head>
<body>
<script>
		jQuery.validator
				.addMethod(
						"checkemail",
						function(value, element) {
							return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
									.test(value)
									|| /^[0-9]{10}$/.test(value);
						}, "Please enter the email format as abc@gmail.com");

		jQuery(document)
				.ready(
						function($) {
							$("#login")
									.validate(
											{
												rules : {
													email : {
														required : true,
														checkemail : true
													},
													pw : {
														required : true,
														minlength : 6
													},
												},
												messages : {
													email : {
														required : "Please enter the email.",
													},
													pw : {
														required : "Please enter the password.",
														minlength : "Please enter the password greater than or equal to 6.",
													},
												}
											});
						});
	</script>
	
	<center>
	<%
		if (request.getAttribute("status") != null) {
		%>
		<div id="msg">
			<%=request.getAttribute("status")%></div>
		<%
		}
		%>
		</center>
		
	
	<form id="login" method="post" action="register">
		<fieldset>
			<h3>Login</h3>
			<div class="parent">
				<label class="child1">Email</label><br> <input type="email"
					name="email" placeholder="Enter your email" name="email"><br>
				<br> <label class="child2">Password</label></br> <input
					type="Password" name="pw" placeholder="Enter Password" name="pw"></br>
				<br>
			</div>
			<div class="parent2">
				<button type="submit" class="btn btn-success" name="login">Submit</button>
				<div style="text-align: center; margin-top: 15px;">
					<a href="forgot.jsp">Forgot password?</a>/<a href="ChangePass.jsp">Reset
						Password</a>
						<p>Dont have Account?<a href="Registration.jsp"> Click Here</a> To Register.</p>
				</div>
		</fieldset>
	</form>
<br>

</body>
</html>