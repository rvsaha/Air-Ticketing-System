package bean;
public class User 
{
	private int id;
	private String userName,passowrd,role;
	
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public User(int id, String userName, String passowrd, String role) {
		super();
		this.id = id;
		this.userName = userName;
		this.passowrd = passowrd;
		this.role = role;
	}
	
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassowrd() {
		return passowrd;
	}

	public void setPassowrd(String passowrd) {
		this.passowrd = passowrd;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public User(String userName, String passowrd, String role) {
		super();
		this.userName = userName;
		this.passowrd = passowrd;
		this.role = role;
	}
	public User() {}
	
}
