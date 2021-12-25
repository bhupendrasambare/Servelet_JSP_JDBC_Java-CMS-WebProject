package controller.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.base.common;

public class allClient {
	private static Connection connection=null;
	
	public ResultSet getClient() {
			ResultSet result = null;
			if(connection == null) {
				connection = common.getConnection();
			}
			
			try {
				PreparedStatement sql = connection.prepareStatement("SELECT * FROM clients");
				result = sql.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
	}
	public boolean setClient(String name,String image,String info) {
		if(connection == null) {
			connection = common.getConnection();
		}
		try {
			PreparedStatement sql = connection.prepareStatement("INSERT INTO clients (name, image, info, status) VALUES (?, ?, ?, 1)");
			sql.setString(1, name);
			sql.setString(2, image);
			sql.setString(3, info);
			sql.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
}
