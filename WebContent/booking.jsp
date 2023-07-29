<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
 <%@page import="java.util.Iterator"%> 
 <%@page import="java.text.*"%> 
 <%@ page import="bean.Route"%>
  <%@ page import="bean.Flight"%>
  <%@ page import="bean.User" %>
 <%@ page import="controller.*"%>
<!DOCTYPE html>
<html>
<head>

<title>booking</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script language="javascript" type="text/javascript">
window.history.forward();
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
  button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.myLink {display: none}
 select {
        width: 150px;
        margin: 10px;
    }
    select:focus {
        min-width: 150px;
        width: auto;
    } 
</style>
<body class="w3-light-grey">


<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <!-- Links -->
  <div class="collapse navbar-collapse" id="myNavbar">
  <ul class="nav navbar-nav navbar-right">
  <li>
	 		<form action="user.jsp" method="post">
        		<button type="submit"  name="" value="logout">HOME</button>
        	</form>
	 </li>
           <li>
        	<form action="AirController" method="post">
        		<button type="submit"  name="getButton" value="getSourceAndDestination">BOOK TICKET</button>
        	</form>
        </li>
        <li>
        <form action="AirController" method="post">
        	<button type="submit"  name="getButton" value="cancelTicket">CANCEL TICKET</button>
        </form>
        </li>
       
	 <li>
	 		<form action="ca2.html" method="post">
        		<button type="submit"  name="" value="">CHANGE PASSWORD</button>
        	</form>
	 	
	 </li>
	 <li>
	 		<form action="AirController" method="post">
        		<button type="submit"  name="getButton" value="logout">LOGOUT</button>
        	</form>
	 </li>
   
  </ul>
  </div>
</nav>
<%
if(session.getAttribute("loginDetails") !=null)
{  
	
User u=(User)session.getAttribute("loginDetails");
	//out.println(u.getRole());
}
else
{
	 response.sendRedirect(request.getContextPath() + "/login.html");
}
%>
<!-- Navigation Bar -->
<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
  <a href="#" class="w3-bar-item w3-button w3-text-red w3-hover-red"><b></b></a>
  <a href="#" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey"></a>
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-hide-small" style="max-width:1500px">
  <img class="w3-image" src="images/F2.jpg" alt="London" width="1400" height="700">
  <div class="w3-display-middle" style="width:55%">
    <div class="w3-bar w3-black">
      <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Booking');"><i class="fa fa-plane w3-margin-right"></i>Booking</button>
      
    </div>

    <!-- Tabs -->
    <form action="AirController" method="post">
    <div id="Booking" class="w3-container w3-white w3-padding-16 myLink">
      <h3>Travel the world with us</h3>
      <div class="w3-row-padding" style="margin:0 -16px;">
        <div class="w3-half">
          <label>From</label>
	          <select name="source" class="w3-input w3-border">
		        <c:forEach items="${routeDetails}" var="category">
		            <option value="${category.source}">${category.source}</option>
		        </c:forEach>
	   		  </select>
        </div>
        <div class="w3-half">
          <label>To</label>
           <select name="destination" class="w3-input w3-border">
		        <c:forEach items="${routeDetails}" var="category">
		            <option value="${category.destination}">${category.destination}</option>
		        </c:forEach>
	   		  </select>
        </div>
      </div>
       <p>
<label for="booking">Select the date : </label><input id="booking" name="date" type="date" required/>
</p>
      <p><button class="w3-button w3-black" name="getButton" value="getBookingDetails"> Submit </button></p>
    </div>
    </form>
  </div>
</header>


 
<script>

function openLink(evt, linkName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("myLink");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
  }
  document.getElementById(linkName).style.display = "block";
  evt.currentTarget.className += " w3-red";
}

// Click on the first tablink on load
document.getElementsByClassName("tablink")[0].click();
</script>

</body>
</html>

