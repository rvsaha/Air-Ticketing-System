<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
 <%@page import="java.util.Iterator"%> 
 <%@ page import="bean.Flight"%>
 <%@ page import="controller.*"%>
  <%@ page import="bean.User" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
input[type=text], input[type=password] {
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
<% ArrayList<Flight> list = (ArrayList<Flight>)request.getAttribute("flightDetails"); %>

<center>
<%
if(request.getAttribute("flightDetails") != null)  // Null check for the object
{
	%>
<table class="tg">
  <tr>
    <th class="tg-s4a0">   Flight Name&nbsp;&nbsp;&nbsp;</th>
    <th class="tg-1gju">&nbsp;&nbsp;Seating Capacity&nbsp;&nbsp;</th>
    <th class="tg-1gju">&nbsp;&nbsp;Reservation Capacity&nbsp;&nbsp;</th>
  </tr>
  
  <%
// Iterating through subjectList
 

 Iterator<Flight> iterator = list.iterator();  // Iterator interface
 
 while(iterator.hasNext())  // iterate through all the data until the last record
 {
	 Flight f = iterator.next();
	%>
  <tr>
    <td class="tg-f7v4"><%=f.getFlightName()%></td>
    <td class="tg-f7v4"><%=f.getSeatingCapacity()%></td>
    <td class="tg-f7v4"><%=f.getReservationCapacity()%></td>
  </tr>
   <%
 }
}
else
{%>
	<h3>No Results</h3>
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
      <label for="flightname"><b>Flight name:</b></label>
      <input type="text" placeholder="Enter Flight name" name="flight_name" required>

     <label for="seating_capacity"><b>Seating capacity:</b></label>
     <input type="text" placeholder="Enter seating_capacity" name="seating_capacity" required>
        
        <label for="reservation_capacity"><b>Reservation capacity:</b></label>
      <input type="text" placeholder="Enter reservation capacity" name="reservation_capacity" required>
      <button type="submit" name="getButton" value="addFlight">ADD</button>
     
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
       <label for="flightname"><b>Flight name:</b></label>
      
      <select name="flight_name" class="form-control" style=" height:30px;"> 
        <c:forEach items="${flightDetails}" var="category">
            <option value="${category.flightName}">${category.flightName}</option>
        </c:forEach>
    </select>
        
      <button type="submit" name="getButton" value="deleteFlight">DELETE</button>
     
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
    </div>
  </form>
</div>


<button type="button" class="btn" onclick="document.getElementById('id03').style.display='block'" style="width:auto;">MODIFY</button>

<div id="id03" class="modal">
  
  <form class="modal-content animate" action="AirController" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

     <div class="container">
     
     <label for="flightname"><b>Select the Flight you want to modify:</b></label>
     <br> <br>
      <select name="flight_name1"  class="form-control" style=" height:30px;" > 
        <c:forEach items="${flightDetails}" var="category">
            <option value="${category.flightName}">${category.flightName}</option>
        </c:forEach>
    </select>
    <br><br>
      <label for="flightname"><b>Flight name:</b></label>
      <input type="text" placeholder="Enter Flight name" name="flight_name" required>

     <label for="seating_capacity"><b>Seating capacity:</b></label>
     <input type="text" placeholder="Enter seating_capacity" name="seating_capacity" required>
        
        <label for="reservation_capacity"><b>Reservation capacity:</b></label>
      <input type="text" placeholder="Enter reservation capacity" name="reservation_capacity" required>
      <button type="submit" name="getButton" value="modifyFlight">MODIFY</button>
     
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn">Cancel</button>
    </div>
  </form>
</div>
<form action="AirController" method="post">

 		<button type="submit" name="getButton" value="viewFlight" style.display='block'" style="width:auto;">VIEW</button>
 		
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