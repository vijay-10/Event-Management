<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Student"%>
<%@page import="Model.Registration"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>
<style>
body{
background-image: url('46.jpg');;
}
.info{
color:orange;
       animation: topSideviji 2s ease forwards;
    animation-delay: 1s;

}
 @keyframes topSideviji {
    0% {
        transform: translateY(-100px);
        opacity: 0;
    }
    100% {
        transform: translateY(0);
        opacity: 1;
    }
}

</style>
</head>
<body  >
<%@include file="Header.jsp" %>
<center>
<div class="info">
		<% if (request.getAttribute("status") != null) {%>
		<h1 class="errmsg">
			<%= request.getAttribute("status")%></h1>
		<%}%>
		<br>
		</div>
	
		<% if (session.getAttribute("uname") != null) {%>
		<h1>
			Welcome
			<%= session.getAttribute("uname")%></h1>

<h1>
		
			your  event id is :
			<%= session.getAttribute("id")%></h1>
		<%}%>
		</h1>
	</center>
	<BR>
		<BR>
			<BR>
				<BR><BR>
				
					<BR>
						<BR>
				
					<BR>
						<BR>
						
							<BR>
	<%@include file="Footer.jsp"%>
</body>
</html>