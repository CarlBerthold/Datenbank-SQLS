package IG_02_Objekte_01_Konstruktor;

public class Person
{
	public String name;
	public int alter;
	
	Person() 
	{
		
	}
	
	Person (String namePara, int alterPara)
	{
		name = namePara;
		alter = alterPara;
	}
	
	public void gibInfos()
	{
		System.out.println("Name:  " + name);
		System.out.println("Alter: " + alter);
	}
}
