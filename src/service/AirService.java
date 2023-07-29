package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import bean.Flight;
import bean.Passenger;
import bean.Route;
import bean.User;
import dao.AirDAO;

public class AirService 
{
	public AirService(){}
	AirDAO e=new AirDAO();
	public boolean returnLogin(String username,String password,String role)
	{
		User u=new User(username,password,role);
		if(e.findEmployee(u))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	public int getUserBy(User u) {
		return e.getUserBy(u);
	}
	public void changePassword(String username, String password, String role)
	{
		User u=new User(username,password,role);
		e.changePassword(u);		
	}
	
	public int addFlight(Flight f)
	{
		int n=e.addFlight(f);
		return n;
	}
	
	public int deleteFlight(String flightName)
	{
		int n=e.deleteFlight(flightName);
		return n;
	}
	
	public int modifyFlight(Flight f,String fname)
	{
		int n=e.modifyFlight(f,fname);
		return n;
	}
	
	public ArrayList<Flight> viewFlight()
	{
		return e.viewFlight();
	}
	
	public Flight getFlight(String fn)
	{
		return e.getFlight(fn);
	}
	//Route 
	public int addRoute(Route r) throws ClassNotFoundException, SQLException
	{
		int n=e.addRoute(r);
		return n;
	}
	
	public int deleteRoute(int id)
	{
		int n=e.deleteRoute(id);
		return n;
	}
	
	public int modifyRoute(Route r,int id)
	{
		int n=e.modifyRoute(r,id);
		return n;
	}
	
	public ArrayList<Route> viewRoute()
	{
		return e.viewRoute();
	}
	
	public Route getRouteById(int id1)
	{
		return e.getRouteById(id1);
	}
	
	//For booking
	public ArrayList<Route> bookingDetails(String source1,String destination1,Date date)
	{
		return e.bookingDetails(source1, destination1, date);
	}
	
	public int addPassenger(Passenger p) throws ClassNotFoundException, SQLException
	{
		int n=e.addPassenger(p);
		return n;
	}
	
	public ArrayList<Passenger> viewBookings(int id)
	{
		return e.viewBookings(id);
	}
	
	public ArrayList<Passenger> viewBookings()
	{
		return e.viewBookings();
	}
	
	public int deletePassenger(int id)
	{
		int n=0;
		return e.deletePassenger(id);
	}
	
	public ArrayList<Passenger> viewBookingsByDate(Date d)
	{
		return e.viewBookingsByDate(d);
	}
	public int signup(User u) 
	{
		return e.signup(u);
	}
}
