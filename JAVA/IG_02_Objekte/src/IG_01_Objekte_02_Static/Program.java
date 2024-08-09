package IG_01_Objekte_02_Static;

public class Program
{
	public static void main(String[] args)
	{
		// Familie vater,mutter,sohn,tochter;
		Familie vater = new Familie();
		Familie mutter = new Familie();;
		Familie tochter = new Familie();;
		Familie sohn = new Familie();;
		
		// Klassen attribut zugriff ueber den Namen der Klasse. 
		Familie.nachname = "Schmidt";
		
		
		mutter.vorname = "Jenny";
		mutter.alter = 45;
		
		vater.vorname = "Fred";
		vater.alter = 52;
		
		tochter.vorname = "Hannelore";
		tochter.alter = 16;
		
		sohn.vorname = "Hans";
		sohn.alter = 12;
		
		mutter.gibInfos();
		vater.gibInfos();
		tochter.gibInfos();
		sohn.gibInfos();
	}
}