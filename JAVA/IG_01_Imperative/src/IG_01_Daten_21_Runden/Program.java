package IG_01_Daten_21_Runden;

import java.util.Locale;

public class Program
{
	public static void main(String[] args)
	{	
		double zahl = 100.1254567;
		
//		// Version 1 -------------------------------------------------------
		String zweiStellen = String.format("Wert: %.2f", zahl);
		System.out.println(zweiStellen);
		
//		// Version 2 -------------------------------------------------------		
//		zahl = Math.round(zahl * 10.00) / 10.00;
//		System.out.println("Wert: " + zahl);
		
//		// Version 3 -------------------------------------------------------
//		zahl = Double.parseDouble(String.format(Locale.ENGLISH, "%.2f",zahl));
//		System.out.println(zahl);
	}
}