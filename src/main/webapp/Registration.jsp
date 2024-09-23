<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Sign up</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<style type="text/css">

	body{
	background-image: url('Registrationbg.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	
}
form {
  border-color: #8B9467
  padding: 20px;
  border-radius: 10px;
  width: 25%; 
  margin: 0 auto;
   margin-top: 20px; 
    transition: transform 0.7s ease-in-out;
    background-color: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(3px);
    
	}
	 form:hover {
  box-shadow: 0 0 20px goldenrod;
	transition: all .3s ease-in-out;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.5); 
}
	h3{
		margin-top: 30px;
		text-align: center;
		font-family: unset;
		font-size: 40px;
		fill-opacity: 4px;
		color: #916d09;
	}
	.parent{
		text-align: center;
	}
	.parent2{
		text-align: center;
	}
	.child1, .child2, .child3, .child4,.child5{
		font-family: monospace;
		color: #4f4543;
		font-size: 25px;
		font-weight: bolder;

	}
	
	input[type="email"], input[type="password"], input[type="text"], input[type="number"] {
		border: 2px solid #ccc; 
  padding: 10px; 
  border-radius: 20px; 
  width: 70%; 
  margin-bottom: 20px; 
  font-size: 16px;
}

  input[type="email"]:focus, input[type="password"]:focus, input[type="text"]:focus, input[type="number"]:focus {
  border-color: #aaa; 
  box-shadow: 0 0 10px #aaa; 
}
button[type="submit"]:hover {
  background-color: firebrick;
  color: whitesmoke;
  transform: scale(1.1);
}
input[type="email"]:hover, input[type="password"]:hover, input[type="text"]:hover, input[type="number"]:hover{
	transform: scale(1.1);
}
#msg {
	background: red;
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
						});

		jQuery(document)
				.ready(function($) {
							$("#signup").validate(
											{
												rules : {
													name : {
														required : true
													},
													email : {
														required : true,
														checkemail : true
													},
													phone : {
														required : true,
														minlength : 10,
														maxlength : 10
													},
													pw : {
														required : true,
														minlength : 6
													},
													cp : {
														required : true,
														minlength : 6,
														equalTo : "#pw"
													}
												},
												messages : {
													name : {
														required : "Please enter the name."
													},
													email : {
														required : "Please enter the email.",
														email : "Please enter a valid email ID."
													},
													phone : {
														required : "Please enter the number.",
														minlength : "Please enter a 10-digit number.",
														maxlength : "Please enter a 10-digit number."
													},
													pw : {
														required : "Please enter the password.",
														minlength : "Password must be at least 6 characters long."
													},
													cp : {
														required : "Please re-enter the password.",
														minlength : "Password must be at least 6 characters long.",
														equalTo : "Passwords do not match."
													}
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
		%></center>
		<center>
<form id="signup" action="register" method="post">

	<h3>Registraion </h3>
	<div class="parent">
	<label class="child1">Name</label><br>
	<input type="text" name="name" id="name" placeholder="Enter your Name"><br>
	<label class="child2">Phone</label><br>
	<input type="number" name="phone" placeholder="Enter your Mobile number"><br>
	<label class="child3">Email</label><br>
	<input type="email" name="email" placeholder="Enter your email"><br>
	<label class="child4">Password</label></br>
	<input type="Password" name="pw" id="pw" placeholder="Enter Password"></br>
	<label class="child5"> Confirm Password</label></br>
	<input type="Password" name="cp"  placeholder="ReEnter Password"></br>
</div>
<div class="parent2">
	<button type="submit" class="btn btn-success" name="register">Submit</button>

	
</div>


	</form>
	</center>
	<br>
	

</body>
</html>