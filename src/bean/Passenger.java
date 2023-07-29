package bean;

public class Passenger 
{
	int id;
	String passengerName;
	int age;
	String gender;
	Route route;
	int no_of_seats;
	User user;
	
	public Passenger(int id, String passengerName, int age, String gender, Route route, int no_of_seats, User user) {
		super();
		this.id = id;
		this.passengerName = passengerName;
		this.age = age;
		this.gender = gender;
		this.route = route;
		this.no_of_seats = no_of_seats;
		this.user = user;
	}
	
	public Passenger(String passengerName, int age, String gender, Route route, int no_of_seats, User user) {
		super();
		this.passengerName = passengerName;
		this.age = age;
		this.gender = gender;
		this.route = route;
		this.no_of_seats = no_of_seats;
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Passenger(){}

	public Passenger(int id, String passengerName, int age, String gender, Route route, int no_of_seats) {
		super();
		this.id = id;
		this.passengerName = passengerName;
		this.age = age;
		this.gender = gender;
		this.route = route;
		this.no_of_seats = no_of_seats;
	}
	
	public Passenger(String passengerName, int age, String gender, Route route, int no_of_seats) {
		super();
		this.passengerName = passengerName;
		this.age = age;
		this.gender = gender;
		this.route = route;
		this.no_of_seats = no_of_seats;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassengerName() {
		return passengerName;
	}

	public void setPassengerName(String passengerName) {
		this.passengerName = passengerName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Route getRoute() {
		return route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}

	public int getNo_of_seats() {
		return no_of_seats;
	}

	public void setNo_of_seats(int no_of_seats) {
		this.no_of_seats = no_of_seats;
	}
	
}
