package Tag_2024_07_29_v3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
		
		ArrayList<Actor> actorListe = new ArrayList<Actor>();
		
		Actor actor = null;
		
		try
		{
			connection = DriverManager.getConnection(connString,user,pw);
			
			statement = connection.createStatement();
			
			resultSet = statement.executeQuery(mySelect);
			
			while(resultSet.next())
			{
				actor = new Actor();
    			actor.setActorId(resultSet.getInt(1));
    			actor.setFirstName(resultSet.getString(2));
    			actor.setLastName(resultSet.getString(3));
    		
    			actorListe.add(actor);
    		}
			
			for (Actor oneActor : actorListe)
			{
				System.out.println(oneActor);
			}
			
			
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
