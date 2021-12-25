package controller.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import controller.base.common;

public class FeedbackOperation {
	public ResultSet getFeedback() {
		ResultSet result = null;
		
		return result;
	}
	public boolean setFeedback(String name,String email,String number,String massage) {
		Connection connection = common.getConnection();
		try 
		{
			PreparedStatement sql = connection.prepareStatement("INSERT INTO `feedback` (`id`, `name`, `email`, `number`, `massage`) VALUES (NULL, ?, ?, ?, ?);");
			sql.setString(1, name);
			sql.setString(2, email);
			sql.setString(3, number);
			sql.setString(4, massage);
			
			sql.executeUpdate();
			return true;
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
