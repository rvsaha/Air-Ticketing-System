<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList"%>    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%--Importing all the dependent classes--%>
 <%@page import="java.util.Iterator"%> 
 <%@page import="java.text.*"%> 
 <%@ page import="bean.Route"%>
 <%@ page import="controller.*"%>
  <%@ page import="bean.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
  <script language="javascript" type="text/javascript">
window.history.forward();
</script>
  
<title>Insert title here</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
body
{
background-image:url("images/F4.jpg");
height: 500px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
} 
/* Full-width input fields */
input[type=text], input[type=password], input[type=date] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
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

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}

.tg  {border-collapse:collapse;border-spacing:0;border-color:#aaa;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#aaa;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#aaa;color:#fff;background-color:#f38630;}
.tg .tg-1gju{font-weight:bold;font-size:22px;background-color:#00009b;border-color:#000000;text-align:center;vertical-align:top}
.tg .tg-rbwf{background-color:#efefef;border-color:#000000;text-align:left;vertical-align:top}
.tg .tg-6scu{background-color:#efefef;font-size:20px;font-family:Impact, Charcoal, sans-serif !important;;border-color:#000000;text-align:left;vertical-align:top}
.tg .tg-f7v4{background-color:#c0c0c0;border-color:#000000;text-align:left;vertical-align:top}
.tg .tg-s4a0{font-weight:bold;font-size:22px;background-color:#00009b;border-color:#000000;text-align:left;vertical-align:top}
.tg .tg-mois{background-color:#ffffff;border-color:#000000;text-align:left;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;}}

body {font-family: Arial, Helvetica, sans-serif;}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <!-- Links -->
  <div class="collapse navbar-collapse" id="myNavbar">
  <ul class="nav navbar-nav navbar-right">
  <li>
	 		<form action="Admin.jsp" method="post">
        		<button type="submit"  name="" value="logout">HOME</button>
        	</form>
	 </li>
    <li>
        	<form action="AirController" method="post">
        		<button type="submit"  name="getButton" value="viewFlight">FLIGHT DETAILS</button>
        	</form>
        </li>
        <li>
	        <form action="AirController" method="post">
	        	<button type="submit"  name="getButton" value="gotoRouteDetails">ROUTE DETAILS</button>
	        </form>
        </li>
        <li>
        	<form action="scheduleDetails.jsp" method="post">
	        	<button type="submit"  name="getButton" value="gotoPassengerDetails">SCHEDULE DETAILS</button>
	        </form>
        </li>
        <li>
        	<form action="AirController" method="post">
	        	<button type="submit"  name="getButton" value="gotoPassengerDetails">PASSESNGER DETAILS</button>
	        </form>
        </li>
	 <li>
	 		<form action="ca.html" method="post">
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
<% ArrayList<Route> list = (ArrayList<Route>)request.getAttribute("routeDetails"); %>

<center>
<table class="tg">
   <tr>
    <th class="tg-s4a0">&nbsp;&nbsp;Source&nbsp;&nbsp;</th>
    <th class="tg-1gju"> Destination&nbsp;&nbsp;</th>
     <th class="tg-1gju"> Date&nbsp;&nbsp;</th>
    <th class="tg-1gju">&nbsp;&nbsp;Distance&nbsp;&nbsp;</th>
    <th class="tg-1gju">&nbsp;&nbsp;Duration&nbsp;&nbsp;</th>
    <th class="tg-s4a0">&nbsp;&nbsp;&nbsp;&nbsp;Cost&nbsp;&nbsp;&nbsp;&nbsp;</th>
  </tr>
  
  <%
// Iterating through subjectList
 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
if(request.getAttribute("routeDetails") != null)  // Null check for the object
{
 Iterator<Route> iterator = list.iterator();  // Iterator interface
 
 while(iterator.hasNext())  // iterate through all the data until the last record
 {
	 Route r = iterator.next();
	%>
	
  <tr>
    <td class="tg-f7v4"><%=r.getSource()%></td>
    <td class="tg-f7v4"><%=r.getDestination()%></td>
    <td class="tg-f7v4"><%=sdf.format(r.getDate())%></td>
    <td class="tg-f7v4"><%=r.getDistance()%></td>
    <td class="tg-f7v4"><%=r.getDuration()%></td>
    <td class="tg-f7v4"><%=r.getCost()%></td>
  </tr>
   <%
 }
}
else
{
	%><b><%out.println("No results"); %></b>
	<%
}
%>
  </table>
 
  
 <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">ADD</button>

<div id="id01" class="modal">
  
  <form class="modal-content animate" action="AirController" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
      <label for="Source"><b>Source:</b></label>
      <input type="text" placeholder="Enter Source" name="source" required>

     <label for="Destination"><b>Destination:</b></label>
     <input type="text" placeholder="Enter Destination" name="destination" required>
    
    <label for="booking_date"><b>Date:</b></label> <br> <br>
      <input type="date" id="Date" name="date"  placeholder="Enter booking date" name="booking_date" required>
      <br>
        
        <label for="Distance"><b>Distance:</b></label>
      <input type="text" placeholder="Enter Distance" name="distance" required>
      
      <label for="Duration"><b>Duration:</b></label>
     <input type="text" placeholder="Enter Duration" name="duration" required>
     
       <label for="Cost"><b>Cost:</b></label>
     <input type="text" placeholder="Enter Cost" name="cost" required>
      
      <label for="Cost"><b>Flight name:</b></label>
      <select name="flight_name" class="form-control" style=" height:30px;">
		        <c:forEach items="${routeDetails}" var="category">
		            <option value="${category.flight.flightName}">${category.flight.flightName}</option>
		        </c:forEach>
	  </select>
     
      <button type="submit" name="getButton" value="addRoute">ADD</button>
     
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
    </div>
  </form>
</div>

<button onclick="document.getElementById('id02').style.display='block'" style="width:auto;">DELETE</button>

<div id="id02" class="modal">
  
  <form class="modal-content animate" action="AirController" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
        
     <select name="idOfRoute" class="form-control" style=" height:30px;">
		        <c:forEach items="${routeDetails}" var="category">
		            <option value="${category.id}">Source name:<b>${category.source}</b>-Destination:<b>${category.destination}</b>-Cost:<b>${category.cost}</b></option>
		        </c:forEach>
	  </select>
     
      <button type="submit" name="getButton" value="deleteRoute">DELETE</button>
     
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
    </div>
  </form>
</div>


<button type="button" onclick="document.getElementById('id03').style.display='block'" style="width:auto;">MODIFY</button>

<div id="id03" class="modal">
  
  <form class="modal-content animate" action="AirController" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
    
    <label for="Routing"><b>Select the Route you want to modify:</b></label>
    <br>
      <select name="idOfRoute" class="form-control" style=" height:30px;">
		        <c:forEach items="${routeDetails}" var="category">
		            <option value="${category.id}">Source name:<b>${category.source}</b>-Destination:<b>${category.destination}</b>-Cost:<b>${category.cost}</b></option>
		        </c:forEach>
	  </select>
	  <br> <br>
	  
     <label for="Source"><b>Source:</b></label>
      <input type="text" placeholder="Enter Source" name="source" required>

     <label for="Destination"><b>Destination:</b></label>
     <input type="text" placeholder="Enter Destination" name="destination" required>
    
    <label for="booking_date"><b>Date:</b></label> <br> <br>
      <input type="date" id="Date" name="date"  placeholder="Enter booking date" name="booking_date" required>
      <br>
        
        <label for="Distance"><b>Distance:</b></label>
      <input type="text" placeholder="Enter Distance" name="distance" required>
      
      <label for="Duration"><b>Duration:</b></label>
     <input type="text" placeholder="Enter Duration" name="duration" required>
     
       <label for="Cost"><b>Cost:</b></label>
     <input type="text" placeholder="Enter Cost" name="cost" required>
      
      <label for="Cost"><b>Flight name:</b></label>
      <select name="flight_name"  class="form-control" style=" height:30px;">
		        <c:forEach items="${routeDetails}" var="category">
		            <option value="${category.flight.flightName}">${category.flight.flightName}</option>
		        </c:forEach>
	  </select>
	  
	 
      <button type="submit" name="getButton" value="modifyRoute">MODIFY</button>
     
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn">Cancel</button>
    </div>
  </form>
</div>
<form action="AirController" method="post">

 		<button type="submit" name="getButton" value="viewRoute" style.display='block'" style="width:auto;">VIEW</button>
 		
  </form>

</center>
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

var modal = document.getElementById('id02');

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
 if (event.target == modal) {
     modal.style.display = "none";
 }
}

var modal = document.getElementById('id03');

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
if (event.target == modal) {
   modal.style.display = "none";
}
}
</script>
  
  
</body>
</html>