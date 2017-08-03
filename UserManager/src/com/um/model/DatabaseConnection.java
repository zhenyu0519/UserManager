// This class is to connect the database
package com.um.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	private Connection connection = null;
	public Connection getConnection(){

        try {
    		//connect the database
            //1.load driver
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//2.get the connection
	        connection = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;databaseName=UserManager","sa","362908227");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return connection;
	}
}
