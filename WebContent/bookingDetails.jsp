<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
 <%@page import="java.util.Iterator"%> 
 <%@page import="java.text.*"%> 
 <%@ page import="bean.Route"%>
  <%@ page import="bean.Flight"%>
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
  select {
        width: 150px;
        margin: 10px;
    }
    select:focus {
        min-width: 150px;
        width: auto;
    }  
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
input[type=text], input[type=password],input[type=number]{
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
.person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 50%;
    opacity: 0.7;
  }
  .person:hover {
    border-color: #f1f1f1;
  }
  .carousel-inner img {
    -webkit-filter: grayscale(90%);
  /*  filter: grayscale(90%);  make all photos black and white */ 
    width: 100%; /* Set width to 100% */
    height:50%;
    margin: auto;
  }
  .carousel-caption h3 {
    color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is 
      less than 600 pixels wide */
    }
  }
  .bg-1 {
    background: #2d2d30;
    color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
    border-top-right-radius: 0;
    border-top-left-radius: 0;
  }
  .list-group-item:last-child {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail p {
    margin-top: 15px;
    color: #555;
  }
  .btn {
    padding: 10px 20px;
    background-color: #333;
    color: #f1f1f1;
    border-radius: 0;
    transition: .2s;
  }
  .btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
  }
  .modal-header, h4, .close {
    background-color: #333;
    color: #fff !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-header, .modal-body {
    padding: 40px 50px;
  }
  .nav-tabs li a {
    color: #777;
  }
  #googleMap {
    width: 100%;
    height: 400px;
    -webkit-filter: grayscale(100%);
    filter: grayscale(100%);
  }  
  .navbar {
    font-family: Montserrat, sans-serif;
    margin-bottom: 0;
    background-color: #2d2d30;
    border: 0;
    font-size: 11px !important;
    letter-spacing: 4px;
    opacity: 0.9;
  }
  .navbar  li a, .navbar .navbar-brand { 
    color: #d5d5d5 !important;
  }
  .navbar-nav  li a:hover {
    color: #fff !important;
  }
  .navbar-nav li.active a {
    color: #fff !important;
    background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
  }
  .open .dropdown-toggle {
    color: #fff;
    background-color: #555 !important;
  }
  .dropdown-menu li a {
    color: #000 !important;
  }
  .dropdown-menu li a:hover {
    background-color: red !important;
  }
</style>
</head>
<body>

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
<% ArrayList<Route> list = (ArrayList<Route>)request.getAttribute("bookingDetails"); %>

<center>
<table class="tg">
   <tr>
    <th class="tg-s4a0">&nbsp;&nbsp;Source&nbsp;&nbsp;</th>
    <th class="tg-1gju"> Destination&nbsp;&nbsp;</th>
    <th class="tg-1gju"> Date&nbsp;&nbsp;</th>
    <th class="tg-1gju">&nbsp;&nbsp;Distance&nbsp;&nbsp;</th>
    <th class="tg-1gju">&nbsp;&nbsp;Duration&nbsp;&nbsp;</th>
    <th class="tg-s4a0">&nbsp;&nbsp;&nbsp;&nbsp;Cost&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th class="tg-1gju">&nbsp;&nbsp;Available Tickets&nbsp;&nbsp;</th>
  </tr>
  
  <%
// Iterating through subjectList
 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
if(request.getAttribute("bookingDetails") != null)  // Null check for the object
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
    <td class="tg-f7v4"><%=r.getFlight().getReservationCapacity()%></td>
  </tr>
   <%
 }
}
%>
  </table>
 
  
 <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">BOOK</button>

<div id="id01" class="modal">
  
  <form class="modal-content animate" action="AirController" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
      <label for="name"><b>Passenger Name:</b></label>
      <input type="text" placeholder="Enter passesnger name" name="passenger_name" required>

     <label for="age"><b>Age:</b></label>
     <input type="text" placeholder="Enter the age" name="age" required>
    <br>
     <label for="gender"><b>Gender:</b></label>
     <br> <br>
	   <input type="radio" name="gender" value="male"> Male
	  <input type="radio" name="gender" value="female"> Female
	  <input type="radio" name="gender" value="other"> Other
	  <br>  <br>
   
   <div class="w3-half">
          <label><b>Source And Destination</b></label>
          <br><br>
         
	          <select  class="form-control" style=" height:30px;" name="route_info" class="w3-input w3-border">
		        <c:forEach items="${bookingDetails}" var="category">
		            <option value="${category.id}">${category.source} && ${category.destination}</option>
		        </c:forEach>
		    </select>
        </div>
   	
   
   <br>
     <label for="No of Seats"><b>No of Seats:</b></label>
      <input type="number" placeholder="Enter Number of seats " name="no_of_seats" min="1" max="5" required>
      
      <button type="submit" name="getButton" value="addBookingDetails">BOOK</button>
     
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
    </div>
  </form>
</div>

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