package IG_05_Poly_03_Down;

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
	
	// Upcast des Datentyps 							--> Genereller 
	public static void ausgabe(Lebewesen lebewesen)
	{
		String printName = "Name: " + lebewesen.getName();
		String printAlter = "Alter: " + lebewesen.getAlter();
		
		System.out.println("- - - Identitaet -> Lebewesen - - -");
		System.out.println(printName + "\n" + printAlter);
		
		// Downcast des Datentyps 						--> Spezieller 
		if (lebewesen instanceof Person)
		{
			String printFarbe = "Farbe: " + ( (Person)lebewesen ).getLieblingsFarbe();
			
			System.out.println("- - - Identitaet -> Person - - -");
			System.out.println(printFarbe);
		}
		
		// Downcast des Datentyps 						--> Spezieller
		if (lebewesen instanceof Haustier)
		{
			String printRaus = "Raus: " + ((Haustier) lebewesen).getDarfRaus();
			
			System.out.println("- - - Identitaet -> Haustier - - -");
			System.out.println(printRaus);
		}
	}
	
//	public static void ausgabe(Person person)
//	{
//		String printFarbe = "Farbe: " + person.getLieblingsFarbe();
//		
//		System.out.println("- - - Identitaet -> Person - - -");
//		System.out.println(printFarbe);
//	}
	
//	public static void ausgabe(Haustier haustier)
//	{
//		String printRaus = "Raus: " + haustier.getDarfRaus();
//		
//		System.out.println("- - - Identitaet -> Haustier - - -");
//		System.out.println(printRaus);
//	}	
}
