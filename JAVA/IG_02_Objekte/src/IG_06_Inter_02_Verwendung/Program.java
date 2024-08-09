package IG_06_Inter_02_Verwendung;

public class Program
{
	public static void main(String[] args)
	{
		int ergebnis = 0;
		IVorlage schnittstelle;
		
		Addiere add = new Addiere();
		Multi mul = new Multi();
		
		schnittstelle = add;
		
		ergebnis = schnittstelle.berechneZweiZahlen(10, 3);
		
		System.out.println("Ergebnis: " + ergebnis);
	}
}
