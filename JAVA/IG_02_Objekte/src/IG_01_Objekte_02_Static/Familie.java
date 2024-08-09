package IG_01_Objekte_02_Static;

// Klasse definiert einen neuen Datentypen.
public class Familie
{
	// Eigenschaft der Klasse. 	--> 	Es gilt fuer alle Objekte.
	public static String nachname;
	
	// Eigenschaften des Objektes.
	public String vorname;
	public int alter;
	
	// Verhalten des Objektes.
	public void gibInfos()
	{
		System.out.println("Nachnname: " + nachname);
		System.out.println("Vorname:   " + vorname);
		System.out.println("Alter:     " + alter);
	}
}
