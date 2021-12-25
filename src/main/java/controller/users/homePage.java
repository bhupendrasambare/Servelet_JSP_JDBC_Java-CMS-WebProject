package controller.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.base.common;

public class homePage {
	private static Connection connection = null;
	
	public ResultSet getPage(String page) {
		ResultSet result = null;
		if(connection == null) {
			connection = common.getConnection();
		}
		try {
			PreparedStatement sql = connection.prepareStatement("SELECT * FROM page where name LIKE ?");
			sql.setString(1, page);
			result = sql.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ResultSet getTable(String name) {
		ResultSet result = null;
		if(connection == null) {
			connection = common.getConnection();
		}
		try {
			PreparedStatement sql = connection.prepareStatement("SELECT * FROM "+name);
			result = sql.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
