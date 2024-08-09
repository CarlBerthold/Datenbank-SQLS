package Tag_2024_07_29_v5;

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

//		// INSERT TEST
//		int row = DBSContext.insertActor("Hannlore", "Schmidt");
//		System.out.println("Row affected: " + row);
		
//		// DELETE TEST
//		int row = DBSContext.deleteActor(212);
//		System.out.println("Row affected: " + row);
		
		// SELECT TEST
		ResultSet actorsFromSerever = DBSContext.selectTable("actor");
		ArrayList<Actor> actors = Mapper.actorMapping(actorsFromSerever);		
		
		for (Actor actor : actors)
		{
			System.out.println(actor);
		}
	}
	
}
