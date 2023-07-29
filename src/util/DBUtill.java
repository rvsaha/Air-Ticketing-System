package util;
/*
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtill {
	public static Connection getDBConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/air","root", "");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		return connection;
	}
}
package jdbc;
*/
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.util.ResourceBundle;

public class DBUtill {
    public static Connection getConnection() throws ClassNotFoundException, SQLException
    {
       // ResourceBundle rb= ResourceBundle.getBundle("mysql");
        String url="jdbc:mysql://localhost:3306/airplane";
        String user="root";
        String pass="";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url,user,pass);
        return con;
    }
}

