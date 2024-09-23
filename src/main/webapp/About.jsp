<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>About Us</title>
<style>

    h2{
      text-align: center;
      font-family: POPPINS;
      FONT-SIZE: 50PX;
      animation: topSideviji 2s ease forwards; 
    }
    h1
    {
      text-align: center;
      font-family: POPPINS;
      FONT-SIZE: 50PX;
      color:orange;
       animation: leftSideviji 1s ease forwards;
    animation-delay: 1s;
    }
    .info{
      display: flex;
      justify-items:space-between;
      
    }
    .vision{
      padding: 50px;
       color: orange;
    font-size: 4rem;
    font-weight: 100;
    opacity: 0;
    animation: leftSideviji 1s ease forwards;
    animation-delay: 1s;

      
    }
   
/*adding hover effect to the vision*/
    .vision:hover {
    color: goldenrod;
    background-color: lightblue   ;
    box-shadow: 0 0 20px goldenrod;
    transition: all .3s ease-in-out;
    color: black;

  }

    .visioninfo{
      margin-left: 70px;
      height: 250px;
      width: 1000px;
      padding: 50px;
       color: #000;
    font-size: 1rem;
    opacity: 0;
    animation: topSideviji 2s ease forwards;
      
    }
    /*adding hover effect to the visioninfo*/
    .visioninfo:hover {
    color: goldenrod;
    background-color: lightblue   ;
     
    box-shadow: 0 0 20px goldenrod;
    transition: all .3s ease-in-out;
    color: black;

  }
 
    .infomission{
      display: flex;
      
    }
    .missioninfo{
      height: 250px;
      width: 3000px;
      padding: 50px;
       color: #000;
    font-size: 1rem;
    opacity: 0;
    animation: topSideviji 2s ease forwards;
   
    }
    /*adding hover effect to the missioninfo*/
    .missioninfo:hover {
    color: goldenrod;
    background-color: lightblue   ;
    box-shadow: 0 0 20px goldenrod;
    transition: all .3s ease-in-out;
    color: black;

  }
    .mission{
     margin-left: 20px;
      height: 250px;
      width: 300px;
         padding: 50px;
       color: orange;
    font-size: 4rem;
    font-weight: 100;
    opacity: 0;
    
    animation: leftSideviji 1s ease forwards;
    animation-delay: 1s;

     
      
    }
    /*adding hover effect to the mission*/
    .mission:hover {
    color: goldenrod;
    background-color: lightblue   ;
   
    box-shadow: 0 0 20px goldenrod;
    transition: all .3s ease-in-out;
    color: black;

  }

/*adding transformation effect to the visioninfo and missioninfo and h2(about us)*/
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
  @keyframes leftSideviji {
    0% {
        transform: translateX(-100px);
        opacity: 0;
    }
    100% {
        transform: translateX(0);
        opacity: 1;
    }
}

  </style>
</head>
<body style="background-color: lightgrey;">
<%@include file="Header.jsp"%>

	<div class="container mt-3">
		<h2>
			<U>About Us</U>
		</h2>

		<!--JUMBOTRON-->
		<div id='one'>
			<div class="mt-4 p-5 bg-secondary text-white rounded">

				<h1>CREATIVE MOMENTS</h1>
				<p>Creative Moments is a premier event management company
					dedicated to bringing your visions to life. With a passion for
					creativity and a commitment to excellence, we specialize in
					planning and executing a wide range of events, from corporate
					gatherings and product launches to weddings, parties, and social
					celebrations. Our team of experienced professionals works closely
					with clients to tailor each event to their specific needs and
					desires, ensuring a seamless and memorable experience. At Creative
					Moments, we believe that every event should be a unique reflection
					of its host's personality and style. Our innovative approach,
					attention to detail, and extensive network of industry contacts
					enable us to deliver events that not only meet but exceed our
					clients' expectations. Whether it’s an intimate gathering or a
					large-scale event, we manage every aspect with precision and care,
					so you can enjoy the moment while we handle the rest. From concept
					to execution, Creative Moments is committed to turning your dreams
					into unforgettable experiences. Let us make your next event a
					memorable one!</p>


			</div>




		</div>
		<br>

		<!--VISSION-->
		<div class="info">
			<div class="vision">
				<h1>
					<b>OUR VISION</b>
				</h1>
				<!--<img src="https://tse2.mm.bing.net/th?id=OIP.KJ47HLcF-atyqk3ZY1qEmQHaFS&pid=Api&P=0&h=180" height="250px">-->
			</div>
			<div class="visioninfo">
				<p>To be the leading event management company renowned for
					transforming visions into extraordinary experiences. We aspire to
					set new benchmarks in creativity, innovation, and service
					excellence, crafting events that captivate, inspire, and leave a
					lasting impact. By continuously pushing the boundaries of what's
					possible, we aim to bring joy, connection, and memorable moments to
					people and organizations worldwide, making every event a creative
					masterpiece.</p>
			</div>
		</div>
		<hr>
		<!--MISSIOON-->
		<div class="infomission">
			<div class="missioninfo">
				<P>At Creative Moments, our mission is to design, plan, and
					execute exceptional events that resonate with our clients' visions
					and aspirations. We are committed to delivering personalized,
					innovative, and high-quality event solutions that create lasting
					memories. By fostering strong relationships with our clients,
					partners, and communities, we strive to exceed expectations through
					our dedication to detail, creativity, and outstanding service. Our
					goal is to make every event a seamless and unforgettable
					experience, leaving a positive and lasting impression on all who
					attend.</P>
			</div>
			<div class="mission">
				<h1>
					<b>OUR MISSION</b>
				</h1>
				<!--<img src="https://tse4.mm.bing.net/th?id=OIP.xMcmR6O4e4COF9HmFWUG1AHaE3&pid=Api&P=0&h=180" height="250px" width="300px">-->
			</div>
		</div>
		<br>
		<hr>
		</div>
		<%@include file="Footer.jsp"%>
		
</body>
</html>