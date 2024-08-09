package Tag_2024_07_29_v3;

public class Actor
{
	private int actorId;
	private String firstName;
	private String lastName;
	
	public int getActorId()
	{
		return actorId;
	}
	public void setActorId(int actorId)
	{
		this.actorId = actorId;
	}
	
	public String getFirstName()
	{
		return firstName;
	}
	public void setFirstName(String firstName)
	{
		this.firstName = firstName;
	}
	
	public String getLastName()
	{
		return lastName;
	}
	public void setLastName(String lastName)
	{
		this.lastName = lastName;
	}

	@Override
	public String toString()
	{
		return String.format("ID; %s Name: %s,%s", getActorId(), getFirstName(), getLastName());
	}
}
