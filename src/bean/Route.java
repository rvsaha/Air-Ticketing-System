package bean;

import java.util.Date;

public class Route
{
	public int id;
	public String source,destination;
	public Date date;
	public String distance,duration;
	public double cost;
	public Flight flight;
	
	public Route() {}

	public Route(int id, String source, String destination, Date date, String distance, String duration, double cost,
			Flight flight) {
		super();
		this.id = id;
		this.source = source;
		this.destination = destination;
		this.date = date;
		this.distance = distance;
		this.duration = duration;
		this.cost = cost;
		this.flight = flight;
	}
	
	public Route(String source, String destination, Date date, String distance, String duration, double cost,
			Flight flight) {
		super();
		this.source = source;
		this.destination = destination;
		this.date = date;
		this.distance = distance;
		this.duration = duration;
		this.cost = cost;
		this.flight = flight;
	}
	
	public Route(String source, String destination, Date date, String distance, String duration, double cost) {
		super();
		this.source = source;
		this.destination = destination;
		this.date = date;
		this.distance = distance;
		this.duration = duration;
		this.cost = cost;
	}
	public Route(String source, String destination) {
		super();
		this.source = source;
		this.destination = destination;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public Flight getFlight() {
		return flight;
	}

	public void setFlight(Flight flight) {
		this.flight = flight;
	}
	
	
}
