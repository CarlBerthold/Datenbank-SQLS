package Tag_2024_07_29_v5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBSContext
{
	public static String connString = "jdbc:mysql://localhost:3306/sakila";
	public static String user = "root";
	public static String pw = "DBS_2024_Kurs!";
		
	public static Connection connection = myConnection();
	
	public static Connection myConnection()
	{
		Connection connection = null;
		
		try
		{
			connection = DriverManager.getConnection(connString,user,pw);
		}
		catch (SQLException e)
		{
			System.out.println("Fehler: " + e.getMessage());;
		}
		
		return connection;
	}
	
	public static Statement statement = myStatement();
	
	public static Statement myStatement()
	{
		Statement statement = null;
		
		try
		{
			if(connection != null)
			{
				statement = connection.createStatement();
			}
			
		}
		catch (SQLException e)
		{
			System.out.println("Fehler: " + e.getMessage());;
		}
		
		return statement;
	}
	
	
	public static ResultSet selectTable(String table)
	{
		ResultSet resultSet = null;
		
		String mySelect = String.format("select * from %s",table);
		
		try
		{			
			if(statement != null)
			{
				resultSet = statement.executeQuery(mySelect);
			}	
		}
		catch (SQLException e)
		{
			System.out.println("Fehler: " + e.getMessage());;
		}

		return resultSet;
	}
	
	public static int insertActor(String firstName, String lastName)
	{	
		int row = 0;	
		String myInsert = String.format("insert into Actor(first_Name,last_Name) values ('%s','%s')",firstName,lastName);
		
		try
		{
			if(statement != null)
			{
				row = statement.executeUpdate(myInsert);
			}
		}
		catch (SQLException e)
		{
			System.out.println("Fehler: " + e.getMessage());;
		}
		
		return row;
	}
	
	public static int deleteActor(int actorId)
	{	
		int row = 0;
		String myDelete = String.format("delete from Actor where actor_id = %s",actorId);
		
		try
		{	
			if(statement != null)
			{
				row = statement.executeUpdate(myDelete);
			}
		}
		catch (SQLException e)
		{
			System.out.println("Fehler: " + e.getMessage());;
		}
		
		return row;
	}
}
