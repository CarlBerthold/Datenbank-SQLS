package Tag_2024_07_29_v4;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBSContext
{
	
	
	
	
	public static ResultSet getTbalFromServer(String table) throws SQLException
	{
		String connString = "jdbc:mysql://localhost:3306/sakila";
		String user = "root";
		String pw = "DBS_2024_Kurs!";
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String mySelect = String.format("select * from %s",table);
		
		try
		{
			connection = DriverManager.getConnection(connString,user,pw);
			statement = connection.createStatement();			
			resultSet = statement.executeQuery(mySelect);
		}
		catch (SQLException e)
		{
			System.out.println("Fehler: " + e.getMessage());;
		}
//		finally
//		{
//			if(connection != null)
//			{
//				connection.close();
//			}
//		}
		
		return resultSet;
	}

}
