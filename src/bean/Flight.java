package bean;

public class Flight 
{
	int id;
	String flightName;
	int seatingCapacity,reservationCapacity;
	public Flight(){}
	
	public Flight(String flightName, int seatingCapacity, int reservationCapacity) {
		super();
		this.flightName = flightName;
		this.seatingCapacity = seatingCapacity;
		this.reservationCapacity = reservationCapacity;
	}
	public Flight(int id, String flightName, int seatingCapacity, int reservationCapacity) {
		super();
		this.id = id;
		this.flightName = flightName;
		this.seatingCapacity = seatingCapacity;
		this.reservationCapacity = reservationCapacity;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFlightName() {
		return flightName;
	}
	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}
	public int getSeatingCapacity() {
		return seatingCapacity;
	}
	public void setSeatingCapacity(int seatingCapacity) {
		this.seatingCapacity = seatingCapacity;
	}
	public int getReservationCapacity() {
		return reservationCapacity;
	}
	public void setReservationCapacity(int reservationCapacity) {
		this.reservationCapacity = reservationCapacity;
	}
	
	
	
}
