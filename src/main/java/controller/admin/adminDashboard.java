package controller.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.base.common;

public class adminDashboard {
	private static Connection connection =null;
	
	public int getTableCount(String name) {
		
		if(connection == null) {
			connection = common.getConnection();
		}
		
		try {
			
			PreparedStatement sql = connection.prepareStatement("Select COUNT(id) as number FROM "+name);
			ResultSet result = sql.executeQuery();
			if(result.next()) {
				return result.getInt("number");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
}
