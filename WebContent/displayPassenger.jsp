<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
 <%@page import="java.util.Iterator"%> 
 <%@ page import="bean.Passenger"%>
  <%@ page import="bean.Route"%>
 <%@ page import="controller.*"%>
  <%@page import="java.text.*"%> 
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
<% ArrayList<Passenger> list = (ArrayList<Passenger>)request.getAttribute("bookingTicketDetails"); %>

<center>
<table class="tg">
  <tr>
    <th class="tg-s4a0">   Passenger Name&nbsp;&nbsp;&nbsp;</th>
    <th class="tg-1gju">&nbsp;&nbsp;Age&nbsp;&nbsp;</th>
    <th class="tg-1gju">&nbsp;&nbsp;Gender&nbsp;&nbsp;</th>
    
  </tr>
  
  <%
// Iterating through subjectList
if(request.getAttribute("bookingTicketDetails") != null)  // Null check for the object
{
 Iterator<Passenger> iterator = list.iterator();  // Iterator interface
 
 while(iterator.hasNext())  // iterate through all the data until the last record
 {
	 Passenger p = iterator.next();	%>
  <tr>
    <td class="tg-f7v4"><%=p.getPassengerName()%></td>
    <td class="tg-f7v4"><%=p.getAge()%></td>
    <td class="tg-f7v4"><%=p.getGender()%></td>
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
  </center>
</body>
</html>