package IG_03_Kapselung_03_Proof;

public class Person
{
	private String name;
	private int pin = 1234;
		
	public void setName(String name, int eingabePin)
	{
		if( eingabePin == pin)
		{
			this.name = name;
		}
		else
		{
			System.out.println("Falsche Pin !");
		}
	}
	
	public String getName()
	{
		return name;
	}
}