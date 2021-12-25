package controller.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.base.common;

public class allProduct {
	private static Connection connection=null;
	public ResultSet getProduct() {
		ResultSet result = null;
		if(connection == null) {
			connection = common.getConnection();
		}
		
		try {
			PreparedStatement sql = connection.prepareStatement("SELECT * FROM products");
			result = sql.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public boolean setProduct(String name,String image,String seller,String brand,float price,float sell) {
		if(connection == null) {
			connection = common.getConnection();
		}
		try {
			PreparedStatement sql = connection.prepareStatement("INSERT INTO products (name, price, sell, image, seller, brand, status) VALUES (?, ?, ?, ?, ?, ?, 1)");
			sql.setString(1, name);
			sql.setFloat(2, price);
			sql.setFloat(3, sell);
			sql.setString(4, image);
			sql.setString(5, seller);
			sql.setString(6, brand);
			sql.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
}
