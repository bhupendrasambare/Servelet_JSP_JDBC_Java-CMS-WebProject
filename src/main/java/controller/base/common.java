package controller.base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
public class common {
	public static String base_url(HttpServletRequest request) {
		String scheme = request.getScheme() + "://";
	    String serverName = request.getServerName();
	    String serverPort = (request.getServerPort() == 80) ? "" : ":" + request.getServerPort();
	    String contextPath = request.getContextPath();
	    return scheme + serverName + serverPort + contextPath;
	}
	public static Connection getConnection() {
		Connection connection = null;
		if(connection ==null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sunglasses","root","");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return connection;
	}
}
