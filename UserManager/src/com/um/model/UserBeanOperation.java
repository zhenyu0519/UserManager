//This class is to operate the userbean class
package com.um.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserBeanOperation {
	private Statement statement = null;
	private ResultSet rs = null;
	private Connection connection = null;

	// verify if the user is existed
	public boolean verifyUser(String username, String password) {
		// user existence default is false
		boolean existence = false;
		try {
			// get connection with database
			connection = new DatabaseConnection().getConnection();
			// get statement
			Statement statement = connection.createStatement();
			// get result set
			rs = statement.executeQuery("select password from users where name='" + username + "'");
			if (rs.next()) {
				// means the username is existed
				if (rs.getString(1).equals(password)) {
					existence = true;
				} else {
					// password is not correct
					existence =false;
				}
			} else {
				// user name is not existed
				existence = false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			closeDatabase();
		}
		return existence;
	}
	
	//close the connection with database
	public void closeDatabase(){
		try {
			//result set is always not null, because the table is
			//always existing.
			if(rs != null) rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Result Set Not Closed Properly ");
			e.printStackTrace();
		} 
		try {
			if(statement != null) statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Prepared Statement Not Closed Properly ");
			e.printStackTrace();
		} 
		try {
			if(connection != null) connection.close();
		} catch (SQLException e) {
			System.out.println("Connection Not Closed Properly ");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Disconnect Database");
	}
}
