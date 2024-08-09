package Tag_2024_07_29_v2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Program
{

	public static void main(String[] args) throws SQLException
	{
		String connString = "jdbc:mysql://localhost:3306/sakila";
		String user = "root";
		String pw = "DBS_2024_Kurs!";
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String mySelect = "select * from actor";
		
		try
		{
			connection = DriverManager.getConnection(connString,user,pw);
			
			statement = connection.createStatement();
			
			resultSet = statement.executeQuery(mySelect);
			
//			resultSet.next();
//			System.out.print(resultSet.getString(1) + " ");
//			System.out.print(resultSet.getString(2) + " ");
//			System.out.print(resultSet.getString(3) + " ");
//			System.out.print(resultSet.getString(4) + " ");
			
			
			while(resultSet.next())
			{
    			System.out.print(resultSet.getString(1) + " ");
    			System.out.print(resultSet.getString(2) + " ");
    			System.out.print(resultSet.getString(3) + " ");
    			System.out.print(resultSet.getString(4) + " ");
    			
    			System.out.println();
    		}
			
			// System.out.println("Funktioniert");
		}
		catch (SQLException e)
		{
			System.out.println("Fehler: " + e.getMessage());;
		}
		finally
		{
			if(connection != null)
			{
				connection.close();
			}
		}
	}
	
}
