package IG_05_Poly_02_Up;

public class Program
{
	public static void main(String[] args)
	{	
		// -----------------------------------------
		Lebewesen lebewesen = new Lebewesen();
		lebewesen.setName("ET");
		lebewesen.setAlter(200);	
		
		// -----------------------------------------
		Person person = new Person();
		person.setName("Hannelore");
		person.setAlter(33);
		person.setLieblingsFarbe("Blau");
		
		// -----------------------------------------	
		Haustier haustier = new Haustier();
		haustier.setName("Lassie");
		haustier.setAlter(10);
		haustier.setDarfRaus(true);
		
		ausgabe(lebewesen);
		ausgabe(person);
		ausgabe(haustier);
	}
	
	// Upcast des Datentyps --> Genereller 
	public static void ausgabe(Lebewesen lebewesen)
	{
		String printName = "Name: " + lebewesen.getName();
		String printAlter = "Alter: " + lebewesen.getAlter();
		
		System.out.println("- - - Identitaet -> Lebewesen - - -");
		System.out.println(printName + "\n" + printAlter);
	}
	
	public static void ausgabe(Person person)
	{
		String printName = "Name: " + person.getName();
		String printAlter = "Alter: " + person.getAlter();
		String printFarbe = "Farbe: " + person.getLieblingsFarbe();
		
		System.out.println("- - - Identitaet -> Person - - -");
		System.out.println(printName + "\n" + printAlter + "\n" + printFarbe);
	}
	
	public static void ausgabe(Haustier haustier)
	{
		String printName = "Name: " + haustier.getName();
		String printAlter = "Alter: " + haustier.getAlter();
		String printRaus = "Raus: " + haustier.getDarfRaus();
		
		System.out.println("- - - Identitaet -> Haustier - - -");
		System.out.println(printName + "\n" + printAlter + "\n" + printRaus);
	}	
}
