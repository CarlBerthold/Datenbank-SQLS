package Tag_2024_07_29_v1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Program
{

	public static void main(String[] args) throws SQLException
	{
		String connString = "jdbc:mysql://localhost:3306/sakila";
		String user = "root";
		String pw = "DBS_2024_Kurs!";
		
		Connection connection = null;
		
		try
		{
			connection = DriverManager.getConnection(connString,user,pw);
			
			System.out.println("Funktioniert");
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
