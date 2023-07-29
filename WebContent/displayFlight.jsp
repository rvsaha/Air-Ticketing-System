<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
 <%@page import="java.util.Iterator"%> 
 <%@ page import="bean.Flight"%>
 <%@ page import="controller.*"%>
  <%@ page import="bean.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<table class="tg">
  <tr>
    <th class="tg-s4a0">   Flight Name&nbsp;&nbsp;&nbsp;</th>
    <th class="tg-1gju">&nbsp;&nbsp;Seating Capacity&nbsp;&nbsp;</th>
    <th class="tg-1gju">&nbsp;&nbsp;Reservation Capacity&nbsp;&nbsp;</th>
  </tr>
  
  <%
// Iterating through subjectList
 
if(request.getAttribute("flightDetails") != null)  // Null check for the object
{
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
{
	%><b><%out.println("No results"); %></b>
	<%
}
%>
  </table>
  </center>
</body>
</html>