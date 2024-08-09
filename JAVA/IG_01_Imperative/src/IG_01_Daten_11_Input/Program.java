package IG_01_Daten_11_Input;

import java.util.Scanner;

public class Program
{
	public static void main(String[] args)
	{
		// INPUT: 		ALLES VON DER KONSOLE ---> String
	
		String eingabe = "";
		int zahl = 0;
		
		Scanner sc = new Scanner(System.in);	
		System.out.print("Eingabe: ");
		
		// Version 1 --------------------------------------------------------
//		eingabe = sc.next();
//		zahl = Integer.parseInt(eingabe);

		// Version 2 --------------------------------------------------------
		zahl = sc.nextInt();
		
		zahl = zahl + 33;
		
		System.out.println("Ausgabe: " + zahl);
	}
}