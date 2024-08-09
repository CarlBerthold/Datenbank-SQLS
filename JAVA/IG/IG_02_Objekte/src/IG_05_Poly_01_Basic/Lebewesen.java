package IG_05_Poly_01_Basic;

public class Lebewesen // extends Object
{
	private String name;
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}

	private int alter;
	public int getAlter()
	{
		return alter;
	}
	public void setAlter(int alter)
	{
		this.alter = alter;
	}

	public String toString()
	{
		return "Name: " + getName() + "\nAlter: " + getAlter();
	}
}