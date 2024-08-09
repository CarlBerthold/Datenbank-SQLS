package IG_01_Daten_20_Format;

public class Program
{
	public static void main(String[] args)
	{					
		String name = "Hans";
		int alter = 33;
		String ausgabe = "";
		
		ausgabe = String.format("Name: %s Alter: %s" ,name, alter);
		
		// System.out.println("Name: " + name + " Alter: " + alter);
		System.out.println(ausgabe);
	}
}