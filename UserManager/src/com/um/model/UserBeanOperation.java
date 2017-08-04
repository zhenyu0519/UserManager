//This class is to operate the userbean class
package com.um.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserBeanOperation {
	private Statement statement = null;
	private ResultSet rs = null;
	private Connection connection = null;
	// define page variable
	private int pageSize = 5; // the number of records for each page
	private int pageCount = 0;// the number of pages
	private int rowCount = 0;// total records

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
					existence = false;
				}
			} else {
				// user name is not existed
				existence = false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDatabase();
		}
		return existence;
	}

	// get the page user want to display
	public ArrayList getPagination(int pageNow) {

		ArrayList recordList = new ArrayList();
		// get statement
		try {
			connection = new DatabaseConnection().getConnection();
			statement = connection.createStatement();
			// get the record to display for current page
			rs = statement.executeQuery("select top " + pageSize + " * from users where id not in (select top "
					+ pageSize * (pageNow - 1) + " id from users)");
			// put result set into ArrayList
			while (rs.next()) {
				UserBean ub = new UserBean();
				ub.setId(rs.getInt(1));
				ub.setName(rs.getString(2));
				ub.setPassword(rs.getString(3));
				ub.setEmail(rs.getString(4));
				ub.setGrade(rs.getInt(5));
				// put userbean into arraylist
				recordList.add(ub);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeDatabase();
		}
		return recordList;
	}

	// get page count
	public int getPageCount() {
		try {
			// get connection with database
			connection = new DatabaseConnection().getConnection();
			// get statement
			statement = connection.createStatement();
			// calculate page count
			rs = statement.executeQuery("select count (*) from users ");
			// get the row count
			if (rs.next()) {
				rowCount = rs.getInt(1);
			}
			// caculate the page count
			if (rowCount % pageSize == 0) {
				pageCount = rowCount / pageSize;
			} else {
				pageCount = rowCount / pageSize + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeDatabase();
		}
		return pageCount;
	}

	// close the connection with database
	public void closeDatabase() {
		try {
			// result set is always not null, because the table is
			// always existing.
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Result Set Not Closed Properly ");
			e.printStackTrace();
		}
		try {
			if (statement != null)
				statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Prepared Statement Not Closed Properly ");
			e.printStackTrace();
		}
		try {
			if (connection != null)
				connection.close();
		} catch (SQLException e) {
			System.out.println("Connection Not Closed Properly ");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Disconnect Database");
	}
}
