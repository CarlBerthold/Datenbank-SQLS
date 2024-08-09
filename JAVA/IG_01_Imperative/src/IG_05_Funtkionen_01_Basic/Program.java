package IG_05_Funtkionen_01_Basic;

import java.util.Scanner;

public class Program
{
	public static double liesZahlEin()
	{
		double zahl = 0;
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("Bitte geben Sie eine Zahl ein: ");
		zahl = sc.nextDouble();
		
		return zahl;
	}
	
	public static int liesOperEin()
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Welche Berechnung wollen Sie mit den Zahlen durchfuehren?");
		System.out.println("Addition (1) - Subtraktion (2) - Multiplikation(3) - Divsion (4)");
		System.out.print("Eingabe: ");
		
		return sc.nextInt();
	}
	
	public static void berechne(double zahlEins, double zahlZwei, int oper)
	{
		double ergebnis = 0.0;
		
		if (oper == 1)
		{
			ergebnis = zahlEins + zahlZwei;
			System.out.println(zahlEins  + " + " + zahlZwei + " = " + ergebnis );
		}	
		if (oper == 2)
		{
			ergebnis = zahlEins - zahlZwei;
			System.out.println(zahlEins  + " - " + zahlZwei + " = " + ergebnis );
		}		
		if (oper == 3)
		{
			ergebnis = zahlEins * zahlZwei;
			System.out.println(zahlEins  + " * " + zahlZwei + " = " + ergebnis );
		}		
		if (oper == 4)
		{
			ergebnis = zahlEins / zahlZwei;
			System.out.println(zahlEins  + " : " + zahlZwei + " = " + ergebnis );
		}	
	}
	
	public static void main(String[] args)
	{		
		double zahlEins = liesZahlEin();
		double zahlZwei = liesZahlEin();
		int oper = liesOperEin();
		
		berechne(zahlEins, zahlZwei, oper);		
	}
}