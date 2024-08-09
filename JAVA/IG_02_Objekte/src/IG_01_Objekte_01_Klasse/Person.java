package IG_01_Objekte_01_Klasse;

// Klasse definiert einen neuen Datentypen.
public class Person
{
	// Eigenschaften des Objektes.
	public String name;
	public int alter;
	
	// Verhalten des Objektes.
	public void gibInfos()
	{
		System.out.println("Name: " + name);
		System.out.println("Alter: " + alter);
	}
}
