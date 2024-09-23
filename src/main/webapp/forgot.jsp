


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
       <title>TODO supply a title</title>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width">
       <script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
   </head>
   <body>
       <%@include file="Header.jsp"%>
       <script>
           jQuery.validator.addMethod("checkemail", function(value, element) {
               return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
           }, "Please enter the email format as abc@gmail.com");

           jQuery(document).ready(function($) {
               $("#forgot").validate({
                   rules: {
                       email: {
                           required: true,
                           checkemail: true
                       },
                       pw: {
                           required: true,
                           minlength: 6
                            },
                       cpw: {
                           required: true,
                           minlength: 6,
                           equalTo: "#pw"
                       },
                   },
                   messages: {
                       email: {
                           required: "Please enter the email.",
                       },
                       pw: {
                           required: "Please enter the password.",
                           minlength: "Please enter the password greater than or equal to 6.",
                       },
                   }
               });
           });



       </script>
       <style>
           .error{
               color:red;
           }
/*            .button{
               padding: 5px;
               width: 6%;
               background: cornflowerblue;
               color: white;
           }*/

           #msg
           {
               background: green;
               color:black;
               border: 1px solid green;
               width:24%;
               font-weight: bold;
               font-size: 25px;
               padding: 5px;
           }
/*            td input{
               display:block;
           }*/
           body {

	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
       </style>

   <center>

       <% if (request.getAttribute("status") != null) {%>
       <div id="msg">  <%= request.getAttribute("status")%></div>
       <%}%>

       <form method="POST" id="forgot" action="register">
           <font color="blue" size="4">
           <h2> Forgot Password  </h2>
           </font>
           <br>
           <div class="container ">
               <div class="form-group col-md-4">
                   <label >Email address</label>
                   <input type="email" class="form-control" placeholder="Enter email"  name="email">
               </div>
               <div class="form-group col-md-4">
                   <label >Password</label>
                   <input type="password" class="form-control" id="pw" placeholder="Enter Password" name="pw">
               </div>
               <div class="form-group col-md-4">
                   <label >Con Password</label>
                   <input type="password" class="form-control"  placeholder="Re Enter Password" name="cpw">
               </div>
               <button type="submit" class="btn btn-primary" name="forgotPass">Submit</button>
               <div style="text-align: center; margin-top: 15px;">
                  <!-- <a href="login.jsp">Login</a> -->
               </div>
           </div>
       </form>

   </center>
   <br>
     <br>
        <br>
           <br> 
           <br>
           <br>
           <br> 
   <%@include file="Footer.jsp"%>
</body>
</html>
               