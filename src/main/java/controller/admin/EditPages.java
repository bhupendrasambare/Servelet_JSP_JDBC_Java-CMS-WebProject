package controller.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import controller.base.common;

public class EditPages {
	private static Connection connection=null;
	
	public boolean setPage(String name,String image,String info) {
		if(connection == null) {
			connection = common.getConnection();
		}
		try {
			PreparedStatement sql = connection.prepareStatement("UPDATE `page` SET `image` = ?, `info` = ? WHERE `name` LIKE ?");
			sql.setString(1, image);
			sql.setString(2, info);
			sql.setString(3, name);
			sql.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
}
