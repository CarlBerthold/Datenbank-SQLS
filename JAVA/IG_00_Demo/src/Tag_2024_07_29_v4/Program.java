package Tag_2024_07_29_v4;

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
		ResultSet actorsFromSerever = DBSContext.getTbalFromServer("actor");
		ArrayList<Actor> actors = Mapper.actorMapping(actorsFromSerever);		
		
		// Test ob Daten Vorhanden
		for (Actor actor : actors)
		{
			System.out.println(actor);
		}
	}
	
}
