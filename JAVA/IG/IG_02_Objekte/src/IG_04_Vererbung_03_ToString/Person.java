package IG_04_Vererbung_03_ToString;

public class Person
{	
	private String name;
	private int alter;
	
	public String getName()
	{
		return name;
	}	
	public void setName(String name)
	{
		this.name = name;
	}

	public int getAlter()
	{
		return alter;
	}
	public void setAlter(int alter)
	{
		this.alter = alter;
	}

	@Override
	public String toString()
	{
		// return "Name " + name + "\nAlter: " + alter;
		return "Name: " + getName() + "\nAlter: " + getAlter();
	}
}