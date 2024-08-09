package Tag_2024_07_29_v4;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Mapper
{
	public static ArrayList<Actor> actorMapping(ResultSet resultSet)
	{	
		ArrayList<Actor> actorListe = new ArrayList<Actor>();
		Actor actor = null;
		
		try
		{
			while(resultSet.next())
			{
				actor = new Actor();
    			actor.setActorId(resultSet.getInt(1));
    			actor.setFirstName(resultSet.getString(2));
    			actor.setLastName(resultSet.getString(3));
    		
    			actorListe.add(actor);
    		}
		}
		catch (SQLException e)
		{
			System.out.println("Fehler: " + e.getMessage());;
		}

		return actorListe;	
	}
}
