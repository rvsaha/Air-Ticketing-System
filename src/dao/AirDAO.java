package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Flight;
import bean.Passenger;
import bean.Route;
import bean.User;

import util.DBUtill;
import java.util.*;
import java.text.*;
public class AirDAO {
	public AirDAO(){}
	SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
	 SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
	public boolean findEmployee(User u) {
		boolean a=false;
		try {			
			System.out.println("Its dao");
			Connection connection = DBUtill.getConnection();
			//String query = "select * from  login where username='"+u.getUserName()+"' password='"+u.getPassowrd()+"' role='"+u.getRole()+"';";
			String query = "select * from  login where username='"+u.getUserName()+"' and password='"+u.getPassowrd()+"' and role='"+u.getRole()+"';";
			Statement s=connection.createStatement();
			/*PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, u.getUserName());
			preparedStatement.setString(2, u.getPassowrd());
			preparedStatement.setString(3,u.getRole());*/
			ResultSet resultSet = s.executeQuery(query);
			if(resultSet.next())
			{
				System.out.println(resultSet.getString("username")+"  "+resultSet.getString("password")+" "+resultSet.getString("role"));
				a= true;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return a;
	}
	public void changePassword(User u)
	{
		try {			
			System.out.println("Its dao ");
			Connection connection = DBUtill.getConnection();
			String query = "update login set password='"+u.getPassowrd()+"' where username='"+u.getUserName()+"' and role='"+u.getRole()+"'";
			//UPDATE `login` SET `password`='bb' where `username`='b' and 'role'='admin'
			Statement s=connection.createStatement();
			/*PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, u.getPassowrd());
			preparedStatement.setString(2, u.getUserName());
			preparedStatement.setString(3,u.getRole());
			preparedStatement.executeUpdate(query);*/
			s.executeUpdate(query);
		} catch (Exception e) {
			System.out.println(e);
		}		
	}
	public int addFlight(Flight f)
	{
		int n=0;
		try 
		{
			System.out.println("Its for adding flight");
			Connection connection = DBUtill.getConnection();
			String query="insert into flight(flightName,seatingCapacity,reservationCapacity) values('"+f.getFlightName()+"',"+f.getSeatingCapacity()+","+f.getReservationCapacity()+")";
			Statement s=connection.createStatement();
			n=s.executeUpdate(query);
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return n;
	}
	public int deleteFlight(String flightName)
	{
		int n=0;
		try
		{
			System.out.println("Flight is deleting");
			Connection connection = DBUtill.getConnection();
			String query="DELETE FROM `flight` WHERE flightname='"+flightName+"'";
			Statement s=connection.createStatement();
			n=s.executeUpdate(query);
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return n;
	}
	public int modifyFlight(Flight f,String fname)
	{
		int n=0;
		try
		{
			System.out.println("Flight is updating");
			Connection connection = DBUtill.getConnection();
			String query="UPDATE flight SET flightName='"+f.getFlightName()+"',seatingCapacity="+f.getSeatingCapacity()+",reservationCapacity="+f.getReservationCapacity()+" where flightName='"+fname+"'";
			//UPDATE `flight` SET `seatingCapacity`=500,`reservationCapacity`=5 WHERE `flightName`='A121'
			Statement s=connection.createStatement();
			n=s.executeUpdate(query);
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return n;
	}
	
	public ArrayList<Flight> viewFlight()
	{
		ArrayList<Flight> a=new ArrayList<Flight>();
		try
		{			
			Connection connection = DBUtill.getConnection();
			String query = "select * from  flight";
			Statement s=connection.createStatement();
			ResultSet resultSet = s.executeQuery(query);
			while(resultSet.next())
			{
				String flightName=resultSet.getString(("flightName"));
				int seatingCapacity=resultSet.getInt(("seatingCapacity"));
				int reservationCapacity =resultSet.getInt(("reservationCapacity"));
				Flight f=new Flight(flightName,seatingCapacity,reservationCapacity);
				a.add(f);
			}
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return a;
	}
	
	public Flight getFlight(String fn)
	{
		Flight f=new Flight();
		try
		{			
			Connection connection = DBUtill.getConnection();
			String query = "select * from  flight where flightName='"+fn+"'";
			Statement s=connection.createStatement();
			ResultSet resultSet = s.executeQuery(query);
			while(resultSet.next())
			{
				int id=resultSet.getInt("id");
				String flightName=resultSet.getString(("flightName"));
				int seatingCapacity=resultSet.getInt(("seatingCapacity"));
				int reservationCapacity =resultSet.getInt(("reservationCapacity"));
				f=new Flight(id,flightName,seatingCapacity,reservationCapacity);
			}
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return f;
	}

	//Route details
	public int addRoute(Route r) throws SQLException, ClassNotFoundException
	{
		int n=0;
		System.out.println("Its for adding route");
		Connection connection = DBUtill.getConnection();
		System.out.println("flight id is  "+r.getFlight().getId());
		String query="insert into route(source,destination,date,distance,duration,cost,flight_id) values('"+r.getSource()+"','"+r.getDestination()+"','"+sdf1.format(r.getDate())+"','"+r.getDistance()+"','"+r.getDuration()+"',"+r.getCost()+","+r.getFlight().getId()+")";
		Statement s=connection.createStatement();
		n=s.executeUpdate(query);
		return n;
	}
	
	public int deleteRoute(int id)
	{
		int n=0;
		try
		{
			System.out.println("Route is deleting");
			Connection connection = DBUtill.getConnection();
			String query="DELETE FROM `route` WHERE id="+id;
			Statement s=connection.createStatement();
			n=s.executeUpdate(query);
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return n;
	}
	public int modifyRoute(Route r,int id)
	{
		int n=0;
		try
		{
			System.out.println("Route is updating");
			Connection connection = DBUtill.getConnection();
			String query="UPDATE route SET source='"+r.getSource()+"', destination='"+r.getDestination()+"', date='"+sdf1.format(r.getDate())+"',distance='"+r.getDistance()+"',duration='"+r.getDuration()+"',cost="+r.getCost()+",flight_id="+r.getFlight().getId()+" where id="+id;
			Statement s=connection.createStatement();
			n=s.executeUpdate(query);
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return n;
	}
	
	public ArrayList<Route> viewRoute()
	{
		ArrayList<Route> a=new ArrayList<Route>();
		try
		{
			System.out.println("dao for view route");
			Connection connection = DBUtill.getConnection();
			String query = "select * from  route";
			Statement s=connection.createStatement();
			ResultSet resultSet = s.executeQuery(query);
			while(resultSet.next())
			{
				int id=resultSet.getInt("id");
				String source=resultSet.getString(("source"));
				String destination=resultSet.getString(("destination"));
				Date d=sdf1.parse(resultSet.getString("date"));
				String distance=resultSet.getString(("distance"));
				String duration=resultSet.getString(("duration"));
				double cost=resultSet.getDouble(("cost"));
				int id1=resultSet.getInt("flight_id");
				Route r=new Route(id,source,destination,d,distance,duration,cost,getFlightById(id1));
				a.add(r);
			}
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return a;
	}
	public Route getRouteById(int id1)
	{
		Route r=new Route();
		try
		{			
			Connection connection = DBUtill.getConnection();
			String query = "select * from  route where id="+id1;
			Statement s=connection.createStatement();
			ResultSet resultSet = s.executeQuery(query);
			while(resultSet.next())
			{
				int route_id=resultSet.getInt("id");
				String source=resultSet.getString(("source"));
				String destination=resultSet.getString(("destination"));
				Date d=sdf1.parse(resultSet.getString("date"));
				String distance=resultSet.getString(("distance"));
				String duration=resultSet.getString(("duration"));
				double cost=resultSet.getDouble(("cost"));
				int id=resultSet.getInt("flight_id");
				r=new Route(route_id,source,destination,d,distance,duration,cost,getFlightById(id));
			}
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return r;
	}
	
	//For booking details
	public ArrayList<Route> bookingDetails(String source1,String destination1,Date date)
	{
		ArrayList<Route> a=new ArrayList<Route>();
		try
		{
			System.out.println("dao for booking route ");
			Connection connection = DBUtill.getConnection();
			String query = "select * from  route where source='"+source1+"' and destination='"+destination1+"' and date='"+sdf1.format(date)+" 00:00:00'";
			Statement s=connection.createStatement();
			ResultSet resultSet = s.executeQuery(query);
			while(resultSet.next())
			{
				int route_id=resultSet.getInt("id");
				String source=resultSet.getString(("source"));
				String destination=resultSet.getString(("destination"));
				Date d=sdf1.parse(resultSet.getString("date"));
				String distance=resultSet.getString(("distance"));
				String duration=resultSet.getString(("duration"));
				double cost=resultSet.getDouble(("cost"));
				int id=resultSet.getInt("flight_id");
				Route r=new Route(route_id,source,destination,d,distance,duration,cost,getFlightById(id));
				a.add(r);
			}
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return a;
	}
	
	public Flight getFlightById(int id1)
	{
		Flight f=new Flight();
		try
		{			
			Connection connection = DBUtill.getConnection();
			String query = "select * from  flight where id="+id1;
			Statement s=connection.createStatement();
			ResultSet resultSet = s.executeQuery(query);
			while(resultSet.next())
			{
				int id=resultSet.getInt("id");
				String flightName=resultSet.getString(("flightName"));
				int seatingCapacity=resultSet.getInt(("seatingCapacity"));
				int reservationCapacity =resultSet.getInt(("reservationCapacity"));
				f=new Flight(id,flightName,seatingCapacity,reservationCapacity);
			}
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return f;
	}
	
	public int addPassenger(Passenger p) throws SQLException, ClassNotFoundException
	{
		int n=0;
		System.out.println("Its for adding passenger");
		Connection connection = DBUtill.getConnection();
		//System.out.println("flight id is  "+r.getFlight().getId());
		String query="insert into pass (passenger_name,age,gender,route_id,no_of_tickets,user_id) values('"+p.getPassengerName()+"',"+p.getAge()+",'"+p.getGender()+"','"+p.getRoute().getId()+"',"+p.getNo_of_seats()+","+p.getUser().getId()+")";
		Statement s=connection.createStatement();
		n=s.executeUpdate(query);
				
		query="update flight SET reservationCapacity="+(p.getRoute().getFlight().getReservationCapacity()-p.getNo_of_seats())+" WHERE flight.id IN (SELECT flight_id from route WHERE id="+p.getRoute().getId()+")";
		s=connection.createStatement();
		s.executeUpdate(query);
		return n;
	}
	
	public ArrayList<Passenger> viewBookings(int idOfUser)
	{
		ArrayList<Passenger> a=new ArrayList<Passenger>();
		try
		{
			System.out.println("dao for view route");
			Connection connection = DBUtill.getConnection();
			String query = "select * from  pass where user_id="+idOfUser;
			Statement s=connection.createStatement();
			ResultSet resultSet = s.executeQuery(query);
			while(resultSet.next())
			{
				int id1=resultSet.getInt("id");
				String passenger_name=resultSet.getString(("passenger_name"));
				int age=resultSet.getInt(("age"));
				String gender=resultSet.getString("gender");
				int id=resultSet.getInt("route_id");
				int no_of_seats=resultSet.getInt("no_of_tickets");
				Route r=getRouteById(id); 
				Passenger pass=new Passenger(id1,passenger_name,age,gender,r,no_of_seats);
				a.add(pass);
			}
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return a;
	}
	
	public int deletePassenger(int id)
	{
		int n=0;
		try
		{
			System.out.println("Passenger is deleting");
			Connection connection = DBUtill.getConnection();
			
			Passenger p=getPassengerById(id);
			String query="update flight SET reservationCapacity="+(p.getRoute().getFlight().getReservationCapacity()+p.getNo_of_seats())+" WHERE flight.id IN (SELECT flight_id from route WHERE id="+p.getRoute().getId()+")";
			Statement s=connection.createStatement();
			s.executeUpdate(query);
			
			query="DELETE FROM `pass` WHERE id="+id;
			s=connection.createStatement();
			n=s.executeUpdate(query);
			
			
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return n;
	}
	
	public ArrayList<Passenger> viewBookingsByDate(Date d)
	{
		ArrayList<Passenger> a=new ArrayList<Passenger>();
		try
		{
			System.out.println("dao for view route");
			Connection connection = DBUtill.getConnection();
			String query = "SELECT * from pass WHERE route_id in (SELECT route.id FROM route WHERE route.date='"+sdf1.format(d)+" 00:00:00')";
			Statement s=connection.createStatement();
			ResultSet resultSet = s.executeQuery(query);
			while(resultSet.next())
			{
				int id1=resultSet.getInt("id");
				String passenger_name=resultSet.getString(("passenger_name"));
				int age=resultSet.getInt(("age"));
				String gender=resultSet.getString("gender");
				int id=resultSet.getInt("route_id");
				int no_of_seats=resultSet.getInt("no_of_tickets");
				Route r=getRouteById(id); 
				Passenger pass=new Passenger(id1,passenger_name,age,gender,r,no_of_seats);
				a.add(pass);
			}
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return a;
	}
	//display passenger
	public ArrayList<Passenger> viewBookings()
	{
		ArrayList<Passenger> a=new ArrayList<Passenger>();
		try
		{
			System.out.println("dao for view route");
			Connection connection = DBUtill.getConnection();
			String query = "select * from  pass";
			Statement s=connection.createStatement();
			ResultSet resultSet = s.executeQuery(query);
			while(resultSet.next())
			{
				int id1=resultSet.getInt("id");
				String passenger_name=resultSet.getString(("passenger_name"));
				int age=resultSet.getInt(("age"));
				String gender=resultSet.getString("gender");
				int id=resultSet.getInt("route_id");
				int no_of_seats=resultSet.getInt("no_of_tickets");
				Route r=getRouteById(id); 
				Passenger pass=new Passenger(id1,passenger_name,age,gender,r,no_of_seats);
				a.add(pass);
			}
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return a;
	}
	
	
	public Passenger getPassengerById(int id2)
	{
		Passenger a=new Passenger();
		try
		{
			System.out.println("dao for get passenger by id");
			Connection connection = DBUtill.getConnection();
			String query = "select * from  pass where id="+id2;
			Statement s=connection.createStatement();
			ResultSet resultSet = s.executeQuery(query);
			while(resultSet.next())
			{
				int id1=resultSet.getInt("id");
				String passenger_name=resultSet.getString(("passenger_name"));
				int age=resultSet.getInt(("age"));
				String gender=resultSet.getString("gender");
				int id=resultSet.getInt("route_id");
				int no_of_seats=resultSet.getInt("no_of_tickets");
				Route r=getRouteById(id); 
				a=new Passenger(id1,passenger_name,age,gender,r,no_of_seats);
			}
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return a;
	}
	
	public int getUserBy(User u) {
		boolean a=false;
		int c=0;
		try {			
			System.out.println("Its daofor id");
			Connection connection = DBUtill.getConnection();
			String query = "select * from  login where username='"+u.getUserName()+"' and password='"+u.getPassowrd()+"' and role='"+u.getRole()+"';";
			Statement s=connection.createStatement();
			ResultSet resultSet = s.executeQuery(query);
			if(resultSet.next())
			{
				c=resultSet.getInt("id");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return c;
	}
	public int signup(User u)
	{
		int n=0;
		try 
		{
			System.out.println("Its for adding login");
			Connection connection = DBUtill.getConnection();
			String query="insert into login(username,password,role) values('"+u.getUserName()+"','"+u.getPassowrd()+"','"+u.getRole()+"')";
			Statement s=connection.createStatement();
			n=s.executeUpdate(query);
		}
		catch (Exception e)
		{
				System.out.println(e);
		}
		return n;
	}
	
}
