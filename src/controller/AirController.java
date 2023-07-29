package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Flight;
import bean.Passenger;
import bean.Route;
import bean.User;
import dao.AirDAO;
import service.AirService;

public class AirController extends HttpServlet {
	public void init(ServletConfig config) throws ServletException
	{	
		super.init(config);
	}
 
	public void destroy() {
 
	}
	 private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,NumberFormatException,IOException 
	{
		
		PrintWriter p=resp.getWriter();
		resp.setContentType("text/html"); 
		
		HttpSession session=req.getSession();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf1=new SimpleDateFormat("dd-MM-yyyy");
		AirService airService=new AirService();
		String trigerFrom = req.getParameter("getButton");
		
		System.out.println("HI its controller");
		
		if(trigerFrom.equals("signup"))
		{			 
			String username =req.getParameter("un");
			String password = req.getParameter("pw");
			String role = req.getParameter("role");
			User u=new User(username,password,role);
			AirDAO e=new AirDAO();
			
			if (airService.signup(u)==1)
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Signup Successful');");
			   p.println("</script>");
			   resp.sendRedirect("login.html");
			} 
		
		}
		
		if(trigerFrom.equals("Login"))
		{			 
			String username =req.getParameter("un");
			String password = req.getParameter("pw");
			String role = req.getParameter("role");
			User u=new User(username,password,role);
			AirDAO e=new AirDAO();
			
			if (airService.returnLogin(username, password, role))
			{
				int idOfuser=airService.getUserBy(u);
				User user2=new User(idOfuser,username, password, role);
				session.setAttribute("loginDetails", user2);
				if(role.equals("admin"))
					resp.sendRedirect("Admin.jsp");
				else 
					resp.sendRedirect("user.jsp");
			} 
			else if(!(e.findEmployee(u)))
			{
			   System.out.println("Sorry UserName or Password Error!");
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('User or password incorrect');");
			   // p.println("location='login.html';");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("login.html");  
		       rd.include(req, resp);  
			   //resp.sendRedirect("login.html");
			}
		}
		else if(trigerFrom.equals("Change"))
		{
			HttpSession session1=req.getSession(false);  
			String username="";
			User us=new User();
	        if(session!=null)
	        {  
	         us=(User)session.getAttribute("loginDetails");
	        }
			//String username =req.getParameter("un");
	        username=us.getUserName();
	        System.out.println(username+" "+us.getRole());
			String password = req.getParameter("pass");
			//String role = req.getParameter("role");
			String role = us.getRole();
			airService.changePassword(username,password, role);
			if(role.equals("admin"))
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Password Changed successfully');");
			   p.println("</script>");
			   resp.sendRedirect("Admin.jsp");
			}
				
			else 
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Password Changed successfully');");
			   p.println("</script>");
			   resp.sendRedirect("user.jsp");
			}
		}
		else if(trigerFrom.equals("addFlight"))
		{
			String flightName=req.getParameter("flight_name");
			int seatingCapacity=Integer.parseInt(req.getParameter("seating_capacity"));
			int reservationCapacity =Integer.parseInt(req.getParameter("reservation_capacity"));
			Flight f=new Flight(flightName,seatingCapacity,reservationCapacity);
			if(airService.addFlight(f) == 1)
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Flight added successfully');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("ViewFlight.jsp");  
		       rd.include(req, resp);  
			}
			else
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Adding Flight encountered a problem');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("ViewFlight.jsp");  
		       rd.include(req, resp);
			}
		}
		
		else if(trigerFrom.equals("deleteFlight"))
		{
			String flightName=req.getParameter("flight_name");
			if(airService.deleteFlight(flightName) == 1)
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Flight deleted successfully');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("ViewFlight.jsp");  
		       rd.include(req, resp);  
			}
			else
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Deleting Flight encountered a problem');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("ViewFlight.jsp");  
		       rd.include(req, resp);
			}
		}
		
		else if(trigerFrom.equals("modifyFlight"))
		{
			String flightName1=req.getParameter("flight_name1");
			String flightName=req.getParameter("flight_name");
			int seatingCapacity=Integer.parseInt(req.getParameter("seating_capacity"));
			int reservationCapacity =Integer.parseInt(req.getParameter("reservation_capacity"));
			Flight f=new Flight(flightName,seatingCapacity,reservationCapacity);
			if(airService.modifyFlight(f,flightName1) == 1)
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Flight modified successfully');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("ViewFlight.jsp");  
		       rd.include(req, resp);  
			}
			else
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Modifying Flight encountered a problem');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("ViewFlight.jsp");  
		       rd.include(req, resp);
			}
		}
		
		else if(trigerFrom.equals("viewFlight"))
		{
			ArrayList<Flight> a=airService.viewFlight();
			System.out.println("size is "+a.size());
			req.setAttribute("flightDetails", a);
			RequestDispatcher rd = req.getRequestDispatcher("ViewFlight.jsp"); 
		    rd.forward(req, resp); 
			//resp.sendRedirect("displayFlight.jsp");
		}
		
		//Route details in controller
		else if(trigerFrom.equals("addRoute"))
		{
			try
			{
				String source=req.getParameter("source");
				String destination=req.getParameter("destination");
				Date date=sdf.parse(req.getParameter("date"));
				Date date1=sdf1.parse(req.getParameter("date"));
				String distance=req.getParameter("distance");
				String duration=req.getParameter("duration");
				String flightname=req.getParameter("flight_name");
				double cost=Double.parseDouble(req.getParameter("cost"));
				Flight f=airService.getFlight(flightname);
				Route r=new Route(source,destination,date,distance,duration,cost,f);
				System.out.println(sdf.format(date)+" "+sdf.format(date1));
				if(airService.addRoute(r) == 1)
				{
				   p.println("<script type=\"text/javascript\">");
				   p.println("alert('Route added successfully');");
				   p.println("</script>");
			       RequestDispatcher rd=req.getRequestDispatcher("routeDetails.jsp");  
			       rd.include(req, resp);  
				}
				else
				{
				   p.println("<script type=\"text/javascript\">");
				   p.println("alert('Adding Route encountered a problem');");
				   p.println("</script>");
			       RequestDispatcher rd=req.getRequestDispatcher("routeDetails.jsp");  
			       rd.include(req, resp);
				}
			}
			catch(ParseException e) {} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if(trigerFrom.equals("deleteRoute"))
		{
			int id=Integer.parseInt(req.getParameter("idOfRoute"));
		/*	String source=req.getParameter("source");
			String destination=req.getParameter("destination");
			double cost=Double.parseDouble(req.getParameter("cost"));*/
			if(airService.deleteRoute(id) == 1)
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Route deleted successfully');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("routeDetails.jsp");  
		       rd.include(req, resp);  
			}
			else
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Deleting Route encountered a problem');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("routeDetails.jsp");  
		       rd.include(req, resp);
			}
		}
		
		else if(trigerFrom.equals("modifyRoute"))
		{
			//String source=req.getParameter("source");
			//String destination=req.getParameter("destination");
			//Date date;
			try 
			{
				int id=Integer.parseInt(req.getParameter("idOfRoute")); 
				String source=req.getParameter("source");
				String destination=req.getParameter("destination");
				Date date=sdf.parse(req.getParameter("date"));
				Date date1=sdf1.parse(req.getParameter("date"));
				String distance=req.getParameter("distance");
				String duration=req.getParameter("duration");
				String flightname=req.getParameter("flight_name");
				double cost=Double.parseDouble(req.getParameter("cost"));
				System.out.println(sdf.format(date)+" "+sdf.format(date1));
				Flight f=airService.getFlight(flightname);
				Route r=new Route(source,destination,date,distance,duration,cost,f);
			
			if(airService.modifyRoute(r,id) == 1)
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Route modified successfully');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("routeDetails.jsp");  
		       rd.include(req, resp);  
			}
			else
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Modifying Route encountered a problem');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("routeDetails.jsp");  
		       rd.include(req, resp);
			}
			}
			catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if(trigerFrom.equals("viewRoute"))
		{
			ArrayList<Route> a=airService.viewRoute();
			System.out.println("size is "+a.size());
			req.setAttribute("routeDetails", a);
			RequestDispatcher rd = req.getRequestDispatcher("routeDetails.jsp"); 
		    rd.forward(req, resp); 
			//resp.sendRedirect("displayFlight.jsp");
		}
		
		//For booking details
		else if(trigerFrom.equals("getBookingDetails"))
		{
			try 
			{
				String source=req.getParameter("source");
				String destination=req.getParameter("destination");
				Date date=sdf.parse(req.getParameter("date"));
				Date date1=sdf1.parse(req.getParameter("date"));
				System.out.println(date+" "+date1);
				ArrayList<Route> a=airService.bookingDetails(source, destination, date);
				System.out.println("size is "+a.size());
				if(a.size()==0)
				{
				   p.println("<script type=\"text/javascript\">");
				   p.println("alert('Route not found');");
				   p.println("</script>");
			       RequestDispatcher rd=req.getRequestDispatcher("user.jsp");  
			       rd.include(req, resp);  
				}
				else
				{
					req.setAttribute("bookingDetails", a);
					RequestDispatcher rd = req.getRequestDispatcher("bookingDetails.jsp"); 
				    rd.forward(req, resp);
				}
				
			}
			catch (ParseException e) 
			{
				e.printStackTrace();
			}
		}
		
		else if(trigerFrom.equals("addBookingDetails"))
		{
			HttpSession session1=req.getSession(false);  
			User us=new User();
			if(session1 != null)
			{
				us=(User)session1.getAttribute("loginDetails");
			}
			int idOfuser=airService.getUserBy(us);
			
			
			String passenger_name=req.getParameter("passenger_name");
			int age=Integer.parseInt(req.getParameter("age"));
			String gender=req.getParameter("gender");
			System.out.println(gender +" "+req.getParameter("gender1"));
			int id=Integer.parseInt(req.getParameter("route_info"));
			int no_of_seats=Integer.parseInt(req.getParameter("no_of_seats"));
			Route r=airService.getRouteById(id);
			if(r.getFlight().getReservationCapacity() < no_of_seats)
			{
				   p.println("<script type=\"text/javascript\">");
				   p.println("alert('Number of seats need to be reduced');");
				   p.println("</script>");
				   RequestDispatcher rd=req.getRequestDispatcher("user.jsp");  
				   rd.include(req, resp);  
			}
			else
			{
				Passenger passenger=new Passenger(passenger_name,age,gender,r,no_of_seats,us);
				try
				{
						if(airService.addPassenger(passenger) == 1)
						{
						   p.println("<script type=\"text/javascript\">");
						   p.println("alert('Booked successfully');");
						   p.println("</script>");
						   RequestDispatcher rd=req.getRequestDispatcher("user.jsp");  
						   rd.include(req, resp);  
						}
						else
						{
						   p.println("<script type=\"text/javascript\">");
						   p.println("alert('Booking ticket encountered a problem');");
						   p.println("</script>");
						   RequestDispatcher rd=req.getRequestDispatcher("user.jsp");  
						   rd.include(req, resp);
						}
				}
				catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}			
		}
		else if(trigerFrom.equals("cancelTicket"))
		{
			HttpSession session1=req.getSession(false);  
			User us=new User();
			if(session1 != null)
			{
				us=(User)session1.getAttribute("loginDetails");
			}
		//	System.out.println(us.getUserName() +" "+us.getPassowrd());
			//System.out.println(airService.getUserBy(us));
			ArrayList<Passenger> a=airService.viewBookings(us.getId());
			System.out.println("size is "+a.size());
			if(a.size()==0)
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('No bookings found');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("user.jsp");  
		       rd.include(req, resp);  
			}
			else
			{
				req.setAttribute("bookingTicketDetails", a);
				RequestDispatcher rd = req.getRequestDispatcher("cancelTicket.jsp"); 
			    rd.forward(req, resp);
			}
		}
		
		else if(trigerFrom.equals("cancelTheTicket"))
		{
			req.setAttribute("transfer", "transfer");
			int id=Integer.parseInt(req.getParameter("idOfPassenger"));
			if(airService.deletePassenger(id) == 1)
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Booking deleted successfully');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("user.jsp");  
		       rd.include(req, resp); 
			}
			else
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('Deleting Bookings encountered a problem');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("user.jsp");  
		       rd.include(req, resp);
			}
		}
		
		else if(trigerFrom.equals("getSourceAndDestination"))
		{
				ArrayList<Route> a=airService.viewRoute();
				System.out.println("size is "+a.size());
				req.setAttribute("routeDetails", a);
				RequestDispatcher rd = req.getRequestDispatcher("booking.jsp"); 
			    rd.forward(req, resp); 
				//resp.sendRedirect("displayFlight.jsp");
			
		}
		
		else if(trigerFrom.equals("gotoRouteDetails"))
		{
			ArrayList<Route> a=airService.viewRoute();
			System.out.println("size is "+a.size());
			req.setAttribute("routeDetails", a);
			RequestDispatcher rd = req.getRequestDispatcher("routeDetails.jsp"); 
		    rd.forward(req, resp); 
			//resp.sendRedirect("displayFlight.jsp");
		}
		
		else if(trigerFrom.equals("gotoPassengerDetails"))
		{
			HttpSession session1=req.getSession(false);  
			User us=new User();
			if(session1 != null)
			{
				us=(User)session1.getAttribute("loginDetails");
			}
			ArrayList<Passenger> a=airService.viewBookings();
			System.out.println("size is "+a.size());
			if(a.size()==0)
			{
			   p.println("<script type=\"text/javascript\">");
			   p.println("alert('No results found for passenger');");
			   p.println("</script>");
		       RequestDispatcher rd=req.getRequestDispatcher("Admin.jsp");  
		       rd.include(req, resp);
			}
			else
			{
				req.setAttribute("bookingTicketDetails", a);
				RequestDispatcher rd = req.getRequestDispatcher("displayPassenger.jsp"); 
			    rd.forward(req, resp); 
			}
			
		}
		
		else if(trigerFrom.equals("getScheduleDetailsByDate"))
		{
			try 
			{
				Date date=sdf.parse(req.getParameter("date"));
				Date date1= sdf1.parse(req.getParameter("date"));
				ArrayList<Passenger> a=airService.viewBookingsByDate(date);
				System.out.println("size is "+a.size());
				if(a.size()==0)
				{
				   p.println("<script type=\"text/javascript\">");
				   p.println("alert('No schedule found');");
				   p.println("</script>");
			       RequestDispatcher rd=req.getRequestDispatcher("scheduleDetails.jsp");  
			       rd.include(req, resp);  
				}
				else
				{
					req.setAttribute("bookingTicketDetails", a);
					RequestDispatcher rd = req.getRequestDispatcher("scheduleDetails.jsp"); 
				    rd.forward(req, resp);
				}
				
								
			} 
			catch (ParseException e) 
			{
				e.printStackTrace();
			}
		}
		else if(trigerFrom.equals("logout"))
		{
			req.getSession().invalidate();
	        resp.sendRedirect(req.getContextPath() + "/login.html");
		}
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
