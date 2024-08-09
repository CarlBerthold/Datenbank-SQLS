package IG_05_Poly_01_Basic;

public class Program
{
	public static void main(String[] args)
	{	
		Object o = new Object(); 
		
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
		
		ausgabe(o);
		ausgabe(lebewesen);
		ausgabe(person);
		ausgabe(haustier);
	}
	
	// Polymorphe - Methode
	public static void ausgabe(Object obj)
	{
		// System.out.println(obj.toString());
		System.out.println(obj);
	}
	
//	public static void ausgabe(Lebewesen lebewesen)
//	{
//		System.out.println(lebewesen);
//	}
	
//	public static void ausgabe(Person person)
//	{
//		System.out.println(person);
//	}
	
//	public static void ausgabe(Haustier haustier)
//	{
//		System.out.println(haustier);
//	}	
}
