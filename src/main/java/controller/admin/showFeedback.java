package controller.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.base.common;

public class showFeedback {
	private static Connection connection=null;
	public ResultSet getFeedback() {
		ResultSet result = null;
		if(connection == null) {
			connection = common.getConnection();
		}
		
		try {
			PreparedStatement sql = connection.prepareStatement("SELECT * FROM feedback");
			result = sql.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
