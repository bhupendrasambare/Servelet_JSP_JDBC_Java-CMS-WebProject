package controller.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.base.common;

public class allSocial {
	public static Connection connection=null;
	public ResultSet getSocial() {
		ResultSet result = null;
		if(connection == null) {
			connection = common.getConnection();
		}
		
		try {
			PreparedStatement sql = connection.prepareStatement("SELECT * FROM social");
			result = sql.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public boolean setSocial(String name,String icon,String info,String link) {
		if(connection == null) {
			connection = common.getConnection();
		}
		try {
			PreparedStatement sql = connection.prepareStatement("INSERT INTO social (name, icon, info, link, status) VALUES (?, ?, ?, ?, 1)");
			sql.setString(1, name);
			sql.setString(2, icon);
			sql.setString(3, info);
			sql.setString(4, link);
			sql.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
}
